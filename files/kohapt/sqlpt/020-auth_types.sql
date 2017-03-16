/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- TODO comment / remove after
-- delete from auth_types;
LOCK TABLES `auth_types` WRITE;

/*!40000 ALTER TABLE `auth_types` DISABLE KEYS */;

INSERT INTO `auth_types` 
(`authtypecode`, `authtypetext`, `auth_tag_to_report`, `summary`)
VALUES
('','Default','',''),
('COR','Nome de Colectividade','210','[210a][210b][ 210c]'),
('GEO','Nome Geográfico','215','[215a][ 215b][ 215c]'),
('PER','Nome de Pessoa','200','[200a][ 200b][-200f]\r\n[400a][,400b]\r\n[</a> 500a][500b]'),
('SUB','Assunto','250','[250a][ -- 250x][ -- 200y][ -- 200z]')
on duplicate key update authtypecode=values(authtypecode), authtypetext=values(authtypetext), auth_tag_to_report=values(auth_tag_to_report), summary=values(summary);
/*!40000 ALTER TABLE `auth_types` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
