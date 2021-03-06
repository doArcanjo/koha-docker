
-- TODO Cleanup - Why - Is it still needed? ?
--/*!40101 SET NAMES utf8 */;
--/*!40101 SET SQL_MODE=''*/;
--/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `authorised_values` */


insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('SUGGEST','BSELL','Bestseller',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('SUGGEST','SCD','Shelf Copy Damaged',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('SUGGEST','LCL','Library Copy Lost',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('SUGGEST','AVILL','Available via ILL',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOST','0','',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOST','2','Extraviado',NULL,NULL);
-- No need already inserted
-- insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOST','1','Desaparecido',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOST','3','Desparecido e indeminizado',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOST','4','Em falta na estante',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('DAMAGED','0','',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('DAMAGED','1','Danificado',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOC','FIC','Fiction',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOC','Infantil','Zona infantil',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOC','Exposição','Em exposição',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOC','Novidades','Estante das novidades',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOC','Nos técnicos','gabinete dos técnicos',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOC','Em estante','Na estante',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOC','AV','Audio Visual',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOC','REF','Obras de referência',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('CCODE','FIC','Fiction',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('CCODE','REF','Reference',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('CCODE','NFIC','Non Fiction',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('WITHDRAWN','0','',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('WITHDRAWN','1','Withdrawn',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('NOT_LOAN','-1','Encomendado',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('NOT_LOAN','0','',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('NOT_LOAN','1','Não é permitido emprestar',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('NOT_LOAN','2','Restrito aos técnicos',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('RESTRICTED','0','',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('RESTRICTED','1','Acesso restrito',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','PT','Portugal',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Lingua','por','Português',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Tecnicos','Nome do técnico',NULL,NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Estado','ENC','Encomendado',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Lingua','eng','Inglês',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Lingua','ger','Alemão',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Lingua','spa','Espanhol',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Lingua','fre','Francês',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','FR','França',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','DE','Alemanha',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','ES','Espanha',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','GB','Reino Unido',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','US','Estados Unidos',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','590','Intérprete',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','070','Autor',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','450','Autor da apresentação',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','080','Autor da introdução',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','030','Autor de arranjo musical',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','340','Editor literário',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','440','Ilustrador',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','730','Tradutor',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Tecnicos','Ana Raposo',NULL,NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Estado','CAN','Cancelado',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Estado','COMP','Completo',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Estado','DES','Desaparecido',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Estado','PAR','Parcial',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('AQUISICAO','Compra','Compra',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('AQUISICAO','Oferta','Oferta',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('AQUISICAO','Permuta','Permuta',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('ASSINATURA','Activa','Activa',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('ASSINATURA','Inactiva','Inactiva',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('ASSINATURA','Suspensa','Suspensa',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('ASSINATURA','Cancelada','Cancelada',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('IGND','Registo sonoro','Registo sonoro',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('IGND','Registo vídeo','Registo vídeo',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('IGND','Música impressa','Música impressa',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('IGND','Documento electrónico','Documento electrónico',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','BR','Brasil',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','AR','Argentina',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Tecnicos','Luísa Marques',NULL,NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','545','Músico',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','200','Coreógrafo',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','205','Colaborador',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','000','Indeterminada (função)',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','005','Actor',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','010','Adaptador',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','020','Anotador',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','040','Artista',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','050','Responsável editorial',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','072','Autor em citações ou excertos de textos',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','090','Autor do diálogo',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','220','Compilador',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','230','Compositor',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','250','Maestro',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','300','Director',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','320','Doador',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','370','Responsável pela montagem de filmes',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','445','Empresário (teatral/musical)',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','555','Arguente',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','557','Organizador de conferência',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','600','Fotógrafo',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','630','Produtor',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','632','Director artístico',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','633','Equipa de produção',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','690','Cenógrafo',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','721','Cantor',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','727','Orientador de tese',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','640','Revisor',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Lingua','it','Italiano',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','IT','Itália',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','MZ','Moçambique',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','130','Responsável pela concepção gráfica do livro',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','MX','México',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','BE','Bélgica',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','CH','Suíça',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','VE','Venezuela',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','695','Consultor científico',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','240','Compositor gráfico',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('IGND','Programa de espectáculo','Programa de espectáculo',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','ARA','Árabe',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','650','Editor comercial',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','651','Director publicação',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','CA','Canadá',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('NOT_LOAN','3','Retirado temporariamente',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('NOT_LOAN','4','Extraviado',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','CU','Cuba',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Funcao','560','Investigador',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Pais','NL','Holanda',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('MANUAL_INV','Copier Fees','.25',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('BOR_NOTES','ADDR','Address Notes',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOC','CART','Book Cart',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('LOC','PROC','Processing Center',NULL,NULL);
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Bsort1','mestrado','Alunos de Mestrado',NULL,'');
insert  into `authorised_values`(`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values ('Bsort1','licenciado','alunos de licenciatura',NULL,'');

-- TODO Cleanup - Why - Is it still needed?  /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;