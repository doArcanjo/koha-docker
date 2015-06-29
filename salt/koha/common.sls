##########
# KOHA-COMMON
##########

local-apt-repo-priority:
  file.managed:
    - name: /etc/apt/preferences.d/local-apt-repo
    - source: salt://koha/files/local-apt-repo.tmpl

deichmanrepo:
  pkgrepo.managed:
    - name: deb http://datatest.deichman.no/repositories/koha wheezy main
    - key_url: http://datatest.deichman.no/repositories/public.gpg
    - watch:
      - file: local-apt-repo-priority

koharepo:
  pkgrepo.managed:
    - name: deb http://debian.koha-community.org/koha squeeze main
    - key_url: http://debian.koha-community.org/koha/gpg.asc

koha-common:
  pkg.installed:
    - skip_verify: True
    - version: 3.20.01
    - require:
      - pkgrepo: deichmanrepo
      - pkgrepo: koharepo
