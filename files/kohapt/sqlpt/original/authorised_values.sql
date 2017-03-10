/*
SQLyog Community Edition- MySQL GUI v5.30
Host - 5.0.37 : Database - koha3_2
*********************************************************************
Server version : 5.0.37
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `authorised_values` */

DROP TABLE IF EXISTS `authorised_values`;

CREATE TABLE `authorised_values` (
  `id` int(11) NOT NULL auto_increment,
  `category` varchar(10) NOT NULL default '',
  `authorised_value` varchar(80) NOT NULL default '',
  `lib` varchar(80) default NULL,
  `lib_opac` varchar(80) default NULL,
  `imageurl` varchar(200) default NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`category`),
  KEY `lib` (`lib`),
  KEY `auth_value_idx` (`authorised_value`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

/*Data for the table `authorised_values` */

insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (1,'SUGGEST','BSELL','Bestseller',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (2,'SUGGEST','SCD','Shelf Copy Damaged',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (3,'SUGGEST','LCL','Library Copy Lost',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (4,'SUGGEST','AVILL','Available via ILL',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (5,'LOST','0','',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (6,'LOST','2','Extraviado',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (7,'LOST','1','Desaparecido',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (8,'LOST','3','Desparecido e indeminizado',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (9,'LOST','4','Em falta na estante',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (10,'DAMAGED','0','',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (11,'DAMAGED','1','Danificado',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (12,'LOC','FIC','Fiction',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (13,'LOC','Infantil','Zona infantil',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (14,'LOC','Exposição','Em exposição',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (15,'LOC','Novidades','Estante das novidades',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (16,'LOC','Nos técnicos','gabinete dos técnicos',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (17,'LOC','Em estante','Na estante',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (18,'LOC','AV','Audio Visual',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (19,'LOC','REF','Obras de referência',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (20,'CCODE','FIC','Fiction',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (21,'CCODE','REF','Reference',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (22,'CCODE','NFIC','Non Fiction',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (23,'WITHDRAWN','0','',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (24,'WITHDRAWN','1','Withdrawn',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (25,'NOT_LOAN','-1','Encomendado',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (26,'NOT_LOAN','0','',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (27,'NOT_LOAN','1','Não é permitido emprestar',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (28,'NOT_LOAN','2','Restrito aos técnicos',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (29,'RESTRICTED','0','',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (30,'RESTRICTED','1','Acesso restrito',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (31,'Pais','PT','Portugal',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (32,'Lingua','por','Português',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (33,'Tecnicos','Nome do técnico',NULL,NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (35,'Estado','ENC','Encomendado',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (36,'Lingua','eng','Inglês',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (37,'Lingua','ger','Alemão',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (38,'Lingua','spa','Espanhol',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (39,'Lingua','fre','Francês',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (41,'Pais','FR','França',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (42,'Pais','DE','Alemanha',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (43,'Pais','ES','Espanha',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (44,'Pais','GB','Reino Unido',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (45,'Pais','US','Estados Unidos',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (46,'Funcao','590','Intérprete',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (47,'Funcao','070','Autor',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (48,'Funcao','450','Autor da apresentação',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (49,'Funcao','080','Autor da introdução',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (50,'Funcao','030','Autor de arranjo musical',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (51,'Funcao','340','Editor literário',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (52,'Funcao','440','Ilustrador',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (53,'Funcao','730','Tradutor',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (54,'Tecnicos','Ana Raposo',NULL,NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (56,'Estado','CAN','Cancelado',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (57,'Estado','COMP','Completo',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (58,'Estado','DES','Desaparecido',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (59,'Estado','PAR','Parcial',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (60,'AQUISICAO','Compra','Compra',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (61,'AQUISICAO','Oferta','Oferta',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (62,'AQUISICAO','Permuta','Permuta',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (63,'ASSINATURA','Activa','Activa',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (64,'ASSINATURA','Inactiva','Inactiva',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (65,'ASSINATURA','Suspensa','Suspensa',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (66,'ASSINATURA','Cancelada','Cancelada',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (67,'IGND','Registo sonoro','Registo sonoro',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (68,'IGND','Registo vídeo','Registo vídeo',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (69,'IGND','Música impressa','Música impressa',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (70,'IGND','Documento electrónico','Documento electrónico',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (71,'Pais','BR','Brasil',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (72,'Pais','AR','Argentina',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (73,'Tecnicos','Luísa Marques',NULL,NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (74,'Funcao','545','Músico',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (75,'Funcao','200','Coreógrafo',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (76,'Funcao','205','Colaborador',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (77,'Funcao','000','Indeterminada (função)',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (78,'Funcao','005','Actor',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (79,'Funcao','010','Adaptador',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (80,'Funcao','020','Anotador',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (81,'Funcao','040','Artista',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (82,'Funcao','050','Responsável editorial',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (83,'Funcao','072','Autor em citações ou excertos de textos',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (84,'Funcao','090','Autor do diálogo',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (85,'Funcao','220','Compilador',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (86,'Funcao','230','Compositor',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (87,'Funcao','250','Maestro',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (88,'Funcao','300','Director',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (89,'Funcao','320','Doador',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (90,'Funcao','370','Responsável pela montagem de filmes',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (91,'Funcao','445','Empresário (teatral/musical)',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (92,'Funcao','555','Arguente',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (93,'Funcao','557','Organizador de conferência',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (94,'Funcao','600','Fotógrafo',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (95,'Funcao','630','Produtor',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (96,'Funcao','632','Director artístico',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (97,'Funcao','633','Equipa de produção',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (98,'Funcao','690','Cenógrafo',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (99,'Funcao','721','Cantor',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (100,'Funcao','727','Orientador de tese',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (101,'Funcao','640','Revisor',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (102,'Lingua','it','Italiano',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (103,'Pais','IT','Itália',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (104,'Pais','MZ','Moçambique',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (105,'Funcao','130','Responsável pela concepção gráfica do livro',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (106,'Pais','MX','México',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (107,'Pais','BE','Bélgica',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (108,'Pais','CH','Suíça',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (109,'Pais','VE','Venezuela',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (110,'Funcao','695','Consultor científico',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (111,'Funcao','240','Compositor gráfico',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (112,'IGND','Programa de espectáculo','Programa de espectáculo',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (113,'Pais','ARA','Árabe',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (114,'Funcao','650','Editor comercial',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (115,'Funcao','651','Director publicação',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (116,'Pais','CA','Canadá',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (117,'NOT_LOAN','3','Retirado temporariamente',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (118,'NOT_LOAN','4','Extraviado',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (119,'Pais','CU','Cuba',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (120,'Funcao','560','Investigador',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (121,'Pais','NL','Holanda',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (122,'MANUAL_INV','Copier Fees','.25',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (123,'BOR_NOTES','ADDR','Address Notes',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (124,'LOC','CART','Book Cart',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (125,'LOC','PROC','Processing Center',NULL,NULL);
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (126,'Bsort1','mestrado','Alunos de Mestrado',NULL,'');
insert  into `authorised_values`(`id`,`category`,`authorised_value`,`lib`,`lib_opac`,`imageurl`) values (127,'Bsort1','licenciado','alunos de licenciatura',NULL,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;