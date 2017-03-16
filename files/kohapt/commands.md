# Backup to tar file:

## Original
docker run --rm \
   -v kohaprod_koha_mysql_data:/from \
   -v $(pwd):/to \
    alpine ash -c "cd /from ; tar -cf /to/koha_mysql_data.tar ."

## Our
docker run --rm \
   -v  dockercompose_koha_mysql_data:/backupData \
   -v $(pwd):/backups \
    alpine ash -c "cd /backupData ; tar -cvf /backups/koha_mysql_data5.tar ."

## Our 2
docker run --rm \
   -v dockercompose_koha_mysql_data:/var/lib/mysql \
   -v $(pwd):/backups \
    alpine ash -c "cd /var/lib/mysql ; tar -cvf /backups/koha_mysql_data5.tar ."


# Restore from tar file:

## Original:
docker run --rm \
   -v $(pwd):/from \
   -v dockercompose_koha_mysql_data:/to \
    alpine ash -c "cd /to ; tar -xf /from/koha_mysql_data.tar"    

## Our
docker run --rm \
   -v $(pwd):/backups \
   -v dockercompose_koha_mysql_data:/var/lib/mysql \
    alpine ash -c "cd /var/lib/mysql ; tar -xf /backups/koha_mysql_data.tar"   

## Our from Init 0
docker run --rm \
   -v $(pwd):/backups \
   -v dockercompose_koha_mysql_data:/var/lib/mysql \
    alpine ash -c "cd /var/lib/mysql ; tar -xf /backups/koha_mysql_data_init0.tar"    

## Our from Bib
docker run --rm \
   -v $(pwd):/backups \
   -v dockercompose_koha_mysql_data:/var/lib/mysql \
    alpine ash -c "cd /var/lib/mysql ; tar -xf /backups/koha_mysql_data_bib.tar"    

## NEW
docker run --rm --volumes-from koha_mysql -v $(pwd):/backup busybox tar cvf /backup/backup.tar /var/lib/mysql


docker run --rm --volumes-from koha_mysql -v $(pwd):/backup alpine tar cvf /backup/backup.tar /var/lib/mysql



# Upsert multiple values mysql (!!!Atenção a Primary keys :D )

## Para obter as colunas da tabela (para adicionar depois do nome da tabela e antes dos "values"):
e.g. "insert into tablename (@resultado da query) values"

SELECT GROUP_CONCAT( CONCAT("`",COLUMN_NAME,"`") SEPARATOR ", ") FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'koha_name' AND TABLE_NAME = 'auth_tag_structure';

### V2
SELECT concat("insert into ",TABLE_NAME,"\n","(",concat_thing,")","\n","values") from (SELECT GROUP_CONCAT( CONCAT("`",COLUMN_NAME,"`") SEPARATOR ", ")as concat_thing,TABLE_NAME   FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'koha_name' AND TABLE_NAME = 'auth_tag_structure') a  ;

## Para obter o statement para colar depois de "on duplicate key update":  

SELECT concat("on duplicate key update ",concat_thing,";") from (Select GROUP_CONCAT( CONCAT(COLUMN_NAME,"=values(", COLUMN_NAME,")") SEPARATOR ", ") as concat_thing FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'koha_name' AND TABLE_NAME = 'z3950servers' ) as a;


# Biblioteca default 

## Até 10 caracteres
## Sem números (TOrna dificil a identificação)
## Se um dia quiser Bib Centro infantil (o 1 o 2 e o 3, Não é identicável)
## CSPNSC- (Redundância) => NSC

B_CENTRO_NSC  (tentar ir até 6 caracteres) ex. Carimbos 


# Tipos de Documento -  Tipo de Uso/acesso - Regras de Emprestimo - Colecções - Aparece no OPAC na pesquisa avançada

## C - Consulta 

## Até 10 categorias : porquê? .:
## Exemplos
  
  a) CLOC -  Consulta Local
  b) 1) VHS Emprestável  
  c) 2) VHS Não Emprestável 
  c) Livros Antigos

  d) Livros

# Acabar com valores autorizados "Técnicos"

# Utilizador Estatistico

# TIpos de Atributos Leitor - Campos adicionais à fichade Leitor

# Languages
## Default instead fre => por  - ver system preferences 

#OPAC configuração HTML
## Tabela system preferences


Tradução revista -  limites da Biblioteca - Library transfer limits - se se pode transferir livros de uma biblioteca para outra

# Autoridades
## Criar autoridade automaticamente por defeito na inserção : 
### BiblioAddsAuthorities (permitir)
### AutoCreateAuthorities (gerar)

                      Autores Singulares  -  Colectividades
- Nome             		Campo 200         -    Campo 210      
- Uses             		Campo 400         -    Campo 410
- Linked ref.           Campo 500         -    Campo 510
  (Vêr tmb)


  Vêr Aututoridades Z39.50 - Procurar - França, Espanha
     Biblioteca nacional