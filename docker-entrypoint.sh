#!/bin/bash
set -e

echo "Global config ..."
envsubst < /templates/global/koha-sites.conf.tmpl > /etc/koha/koha-sites.conf
envsubst < /templates/global/passwd.tmpl > /etc/koha/passwd

echo "Setting up local cronjobs ..."
envsubst < /cronjobs/deichman-koha-common.tmpl > /etc/cron.d/deichman-koha-common
chmod 644 /etc/cron.d/deichman-koha-common

echo "Setting up supervisord ..."
envsubst < /templates/global/supervisord.conf.tmpl > /etc/supervisor/conf.d/supervisord.conf

echo "Mysql server setup ..."
if ping -c 1 -W 1 $KOHA_DBHOST ; then
  printf "Using linked mysql container $KOHA_DBHOST\n"
else
  printf "Unable to connect to linked mysql container $KOHA_DBHOST\n-- initializing local mysql ...\n"
  /etc/init.d/mysql start
  sleep 1 # waiting for mysql to spin up on slow computers
  echo "127.0.0.1  $KOHA_DBHOST" >> /etc/hosts
  echo "CREATE USER '$KOHA_ADMINUSER'@'%' IDENTIFIED BY '$KOHA_ADMINPASS' ; \
        CREATE USER '$KOHA_ADMINUSER'@'koha_mysql' IDENTIFIED BY '$KOHA_ADMINPASS' ; \
        CREATE DATABASE IF NOT EXISTS koha_$KOHA_INSTANCE ; \
        GRANT ALL ON koha_$KOHA_INSTANCE.* TO '$KOHA_ADMINUSER'@'%' WITH GRANT OPTION ; \
        GRANT ALL ON koha_$KOHA_INSTANCE.* TO '$KOHA_ADMINUSER'@'koha_mysql' WITH GRANT OPTION ; \
        FLUSH PRIVILEGES ;" | mysql -u root -p$KOHA_ADMINPASS
fi

echo "Initializing local instance ..."
envsubst < /templates/instance/koha-common.cnf.tmpl > /etc/mysql/koha-common.cnf
koha-create --request-db $KOHA_INSTANCE || true
koha-create --populate-db $KOHA_INSTANCE

echo "Configuring local instance ..."
envsubst < /templates/instance/koha-conf.xml.tmpl > /etc/koha/sites/$KOHA_INSTANCE/koha-conf.xml
envsubst < /templates/instance/log4perl.conf.tmpl > /etc/koha/sites/$KOHA_INSTANCE/log4perl.conf
envsubst < /templates/instance/zebra.passwd.tmpl > /etc/koha/sites/$KOHA_INSTANCE/zebra.passwd

envsubst < /templates/instance/apache.tmpl > /etc/apache2/sites-available/$KOHA_INSTANCE.conf

echo "Configuring SIPconfig.xml from templates and data from csv ..."
door=`awk -f /templates/instance/SIPconfig.template_dooraccess.awk /templates/instance/SIPconfig.dooraccess.csv` ; \
auto=`awk -f /templates/instance/SIPconfig.template_automats.awk /templates/instance/SIPconfig.automats.csv` ; \
rfid=`awk -f /templates/instance/SIPconfig.template_rfid.awk /templates/instance/SIPconfig.rfid.csv` ; \
inst=`awk -f /templates/instance/SIPconfig.template_institutions.awk /templates/instance/SIPconfig.institutions.csv` ; \
awk -v door="$door" -v auto="$auto" -v rfid="$rfid" -v inst="$inst" \
  '{gsub(/__TEMPLATE_DOOR_ACCOUNTS__/, door); gsub(/__TEMPLATE_AUTOMAT_ACCOUNTS__/, auto); gsub(/__TEMPLATE_RFID_ACCOUNTS__/, rfid); gsub(/__TEMPLATE_INSTITUTIONS__/, inst) };1' \
  /templates/instance/SIPconfig.xml.tmpl | envsubst > /etc/koha/sites/$KOHA_INSTANCE/SIPconfig.xml

echo "Configuring languages ..."
# Install languages in Koha
for language in $INSTALL_LANGUAGES
do
    koha-translate --install $language
done

echo "Restarting apache to activate local changes..."
service apache2 restart

sleep 1 # waiting for apache restart to finish
echo "Running webinstaller and applying local deichman mods - please be patient ..."
cd /usr/share/koha/lib && /installer/installer.sh

echo "Enabling plack ..."
koha-plack --enable "$KOHA_INSTANCE"

echo "Installation finished - Stopping all services and giving supervisord control ..."
service apache2 stop
koha-indexer --stop "$KOHA_INSTANCE"
koha-stop-zebra "$KOHA_INSTANCE"

supervisord -c /etc/supervisor/conf.d/supervisord.conf