/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `auth_tag_structure`
--

delete from auth_tag_structure;
LOCK TABLES `auth_tag_structure` WRITE;

/*!40000 ALTER TABLE `auth_tag_structure` DISABLE KEYS */;

INSERT INTO `auth_tag_structure` VALUES
('','000','Cabeçalho','Cabeçalho',0,1,''),
('','001','Identificador do registo','Identificador do registo',0,0,''),
('','100','Dados gerais','Dados gerais',0,0,''),
('','101','Lingua da Entidade','Língua da Entidade',0,0,''),
('','102','Nacionalidade da Entidade','Nacionalidade da Entidade',0,0,''),
('','152','Regras','Regras',0,0,''),
('','200','Cabeçalho nome de pessoa','Cabeçalho nome de pessoa',0,1,''),
('','300','Nota informativa','Nota informativa',0,0,''),
('','400','Referência Ver','Referência Ver',1,0,''),
('','500','Referência Ver também','Referência Ver também',1,0,''),
('','801','Fonte de origem','Fonte de origem',1,0,''),
('','830','Nota geral do catalogador','Nota geral do catalogador',1,0,''),
('','856','Acesso electrónico','Acesso electrónico',1,0,''),
('COR','000','Cabeçalho do Registo','Cabeçalho do Registo',0,1,''),
('COR','001','Identificador do Registo','Identificador do Registo',0,0,''),
('COR','100','Dados gerais de processamento','',0,1,''),
('COR','152','Tipo de autoridade','Tipo de autoridade',0,0,''),
('COR','210','Cabeçalho nome de colectividade','Cabeçalho nome de colectividade',0,1,''),
('COR','300','Nota informativa','Nota informativa',0,0,''),
('COR','410','Referência Ver','Referência Ver',1,0,''),
('COR','510','Referência Ver também','Referência Ver também',1,0,''),
('COR','801','Fonte de origem','Fonte de origem',1,0,''),
('COR','810','Fonte da Informação dos Dados','',0,1,''),
('COR','830','Nota geral do catalogador','Nota geral do catalogador',1,0,''),
('COR','859','Localização Acesso Electrónico','',0,0,''),
('GEO','000','Cabeçalho do Registo','Cabeçalho do Registo',0,1,''),
('GEO','001','Identificador do Registo','Identificador do Registo',0,0,''),
('GEO','100','Dados gerais de processamento','',0,1,''),
('GEO','152','Regras','Regras',0,1,''),
('GEO','215','Cabeçalho- nome geográfico','Cabeçalho- nome geográfico',1,1,''),
('GEO','300','Nota informativa','Nota informativa',0,0,''),
('GEO','415','UP- Nome geográfico','Usado por- Nome geográfico',1,0,''),
('GEO','515','VT- Referência Ver também','Ver também- nome geografico',1,0,''),
('GEO','675','CDU','',0,1,''),
('GEO','801','Fonte de origem','Fonte de origem',1,0,''),
('GEO','830','Nota geral do catalogador','Nota geral do catalogador',1,0,''),
('GEO','859','Localização Acesso Electrónico','',0,0,''),
('PER','000','Cabeçalho','Cabeçalho',0,1,''),
('PER','001','Identificador do registo','Identificador do registo',0,0,''),
('PER','100','Dados gerais','Dados gerais',0,0,''),
('PER','101','Lingua da Entidade','Língua da Entidade',0,0,''),
('PER','102','Nacionalidade da Entidade','Nacionalidade da Entidade',0,0,''),
('PER','152','Regras','Regras',0,0,''),
('PER','200','Cabeçalho nome de pessoa','Cabeçalho nome de pessoa',0,1,''),
('PER','300','Nota informativa','Nota informativa',0,0,''),
('PER','400','Referência UP','Usado por',1,0,''),
('PER','500','Referência Ver também','Referência Ver também',1,0,''),
('PER','675','CDU','',0,0,''),
('PER','801','Fonte de origem','Fonte de origem',1,0,''),
('PER','810','Fonte da Informação dos Dados','',0,1,''),
('PER','830','Nota geral do catalogador','Nota geral do catalogador',1,0,''),
('PER','856','Acesso electrónico','Acesso electrónico',1,0,''),
('PER','859','Localização Acesso Electrónico','',0,0,''),
('SUB','000','Cabeçalho do Registo','Cabeçalho do Registo',0,1,''),
('SUB','001','Identificador do Registo','Identificador do Registo',0,0,''),
('SUB','100','Dados gerais de processamento','',0,1,''),
('SUB','152','Regras','Regras',0,1,''),
('SUB','250','Cabeçalho de assunto','Cabeçalho de assunto',0,1,''),
('SUB','450','Referência UP','Usado por',1,0,''),
('SUB','550','Referência Ver também','Referência Ver também',1,0,''),
('SUB','675','CDU','',0,1,''),
('SUB','801','Fonte de origem','Fonte de origem',1,0,''),
('SUB','830','Nota geral do catalogador','Nota geral do catalogador',1,0,'');

/*!40000 ALTER TABLE `auth_tag_structure` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
