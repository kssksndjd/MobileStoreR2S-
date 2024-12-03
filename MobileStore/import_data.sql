-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mobilestores
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Smartphones'),(2,'Tablets'),(3,'Accessories');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Apple'),(2,'Samsung'),(3,'Huawei');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,999,2,1,1),(2,649,1,2,4),(3,200,2,3,1),(4,2500,1,3,2),(5,750,1,4,4),(6,999,1,4,1),(7,999,1,5,1),(8,990,3,6,1),(9,990,2,7,1),(10,1089,3,7,3),(11,788,3,8,2),(12,1089,1,8,3),(13,990,1,8,1),(14,990,2,9,1),(15,1089,1,9,3),(16,788,1,9,2),(17,990,3,10,1),(18,1089,1,10,3),(19,788,1,10,2);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) NOT NULL,
  `total` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-06-10 14:30:00.000000',1998),(2,'2024-06-11 10:15:00.000000',649),(3,'2024-06-12 14:23:45.033114',2900),(4,'2024-06-12 14:29:08.791921',1749),(5,'2024-06-12 15:12:51.701757',999),(6,'2024-06-12 17:55:54.868740',2970),(7,'2024-06-12 17:56:21.358447',7227),(8,'2024-06-12 19:49:17.099152',4443),(9,'2024-06-12 19:55:19.271155',3857),(10,'2024-06-12 19:59:56.598968',4847);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_data` longblob,
  `image_name` varchar(255) DEFAULT NULL,
  `image_type` varchar(255) DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`),
  CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	\r\r\r\r( \Z%!1!%)+..038?,7+-0+\n\n\n\r\Z-+----+-+---+--+--+-+----++-------+---+-------+---+ÿÀ\0\0\á\0\á\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0O\0\r\0\0\0\0\0!1AQaqr²\"#245s„‘±\Â$3BRTct’¡\Ã\Ñ\ÒSb¢³Á\áðD“”£C\Óÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\02\0	\0\0\0\0\0\01!A\"Qq¡±\Ñ2BRa\á#3‘ðCÿ\Ú\0\0\0?\0\î \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\æ\Ù\åºgY©+|ž¡9\Ón.\'Œ©\Æi\à\ãN)öm=üpÇ„¤\Û\ÑY³G¯žV£\ÆWW\èº4\äQI‘¼«¼°¬\å\Ê_+»ÿ\0‘ýGSy{þ&\Ê_+»ÿ\0}~#©¼:rŠ\î®\ï]mzQ\Ê7—¿âœ¡òÛ¯÷d7“\Å(wù\ï{J:S¾»\\U–-ð\"ct\ÄÌ¢\ÚgV_¸ZV²¾•?ƒRujF2ò·³ziò_ˆ•öIÿ\0\Ê\çGÇ¯ÿ\0&ý\r>Ç›\Ò\Ü#xõa»\Î\å¥NUjÔ¯\ZtÓ”\ß_RÑŠ\ÚðSÄ‹i2\Ö7˜\éñW}·Rÿ\0™¹_\åu¾½O\Ä\ç\Ûõ[g\Ò\Ý7*\ï\ÞWÇŠrüI\Ø\Ù\ïù›•~Yqõ\åøŸtÜ­½y[9\Ïñ2P\Ý,\Í\áªÍ­o¶Ma\é‘~¤ôeyó—_úš\ÞJ¯óž¨\Þ=Y¨î— ñW^\ÍÆ¦>Ib:z›Ç«wÌ­Ú¥*Š†V‚Ž-.¿\è\Ê†pZš\äIñ1¾\ÉvªsRJQjQ’N2M5$õ¦žú,—\Ð\0\0\0\0\0\0\0\Z\î\èRV¹:µJmÆ¬”hÓ’\ÛT’Ž’\ãI·\ä\"\Ó\Ñ\ÃóýzŠ.¹ðž*Ÿ\ì\ÅjÇ—Sôq”ˆR!­Ö¿œž“~“H¢\ÛB\Ë#\åIihÉ¶žó×‡!I‰†Û“l¥qVi\á§VJ1\Çb\ßoÐ™ˆ\Þv^ghJÖ_SÓ‚qŒñŠ]Ö¤ù1\ÞdDÄ­zxZm\ÄtvlkÅ¼\Ðd‡›.7\ÙF]yi\Û\ÚGI\Å÷3ž8(µÀ\Þ-óp;txbö\ë\Ä6¥]QÇƒRZ’\à\\¹L1\É\ÆÐ‰k\Z´§Jx\èÕ„©\Ë\r©I5\ÚE«\â¬\Ö{±ž“»”\Ý\æNPƒt\áÕ¥Ž1œjRŠ—i¦xö\Ñf‰\Ú#xö\ÃO®§2Šó7(~£þ\ê˜§\Øó~_||ÕV(\ï\î—\Ë\Íÿ\0\Ô\ÛCó²fü¾øVu¸cñ{§\äøy©{úŸûhþb>Ë—\Ó\ß\ný¿Où½\ÓòJ±É“ äª¬*<1Ž\Ü.ÿ\0\å\ÉY\Úcfµ\Ë\\•ñVw„\ØÄ¢Y£\0!e»%*n¢\ÕRš\ÒRZ›Kjþd\ÖSY\êî»†\å¹]dµN£nv³\ëiü\ÛX\Åy’\äH¼z4‡D% \0\0\0\0\0\0\rva“W\Õ\ÒÈ­¸V\Ü8ŽqPr·†Žõ8ý¨ˆEZ\å•ôaa¤°\ÅM,V\Z·Î¼yb±\Â/M\å\îJƒT\ãÜ¦—\Ös\ÞVž\å•yÒ”jS“JmJ2[\Íª´\Êù\ÉquN«„i¦¤\ãÖœ–\Æñlˆˆ…­y·-w(>\Æ<³ôv\"T–]\Ê5\ï_\íR\é\Ô=_£¿\ì\é\Æè’‰\ê¦að\âKC¢Kž\ÐÁ8“³–\è\ÕY‡-\Ñj\"“[£T3—=/­£Qa-«¹–ü§Ë›\rrFÒ¾\rE°\Ûx\ã¼(§A\ÂZ2Ú½\rp£Ç½&“´¾‹Zä¯Š¼2B{yO´\Ô\Çõu:,˜\äŽ[÷Stý\Ïu	\Ð~ž»ø\ZG-»»))\0\0\0\0\0\0\0hû°ø5}*ªEmÂ¶\á\ÊTS§\Ö)Ò†+\ÈUXS\Ü\ä\nS–:¼±Ä\å;\ÊM½:r\à[u,9S^\åÉ¹v\Z’\ÞZ¾\Ò\ÑU¶d\É\Ùq¹h\Í\ã\Ëø‘1±0¸½x\Æ\ro\Ê~\ÉYRRw%]¾÷K§Tõ~ü_³«wF”OR˜cq--S‰hs\Þ*D—-\áª\"a\ÇtJ¨¤¹.‡T\Ê\\öE™”³E¹¤¤¸\Ö\ÇÀr\ç\Å#õu\éu†\ÛöžQ!È˜˜¥ô11¼‘\í5<UNƒ\Ê\Ñ\Ëv\êm\ï{®}½5Ž[wvRR\0\0\0\0\0\0\0\Ñ÷aðjúMh­¸V\Ü9M	cN-/*m\"ª\Ã\ëAhã¤±\Ç\rü0\Ú~W‹te£ý CN¥%„Ô–3Ñ’Ž;\Ò\áõ8¦±¿Š;{\Óxž›]eÖ–\ÇR\à_ß¬®Oó·	®ûumµaN/n·\éi#IYnB»}÷:—N©\ê}\ßöu\à\î\é.\'§»[C¢Z%…¡Šq-\ç¼#Ô‰xrd„J¨™qdB¬Œ\å\Åt*\ÆVsZQ&ceX&Ì¬¼0=§Ÿª\Çø\á\ê\è3\ç?·\Éñ|»MOS \Î8\å\ê\Ç-Ë©·½\î¹ô>ð\Ö9m\Ý\ÙIH\0\0\0\0\0\0GÝ‡ÁžsG\Ú+n·/mt\á©\â\à\Þ:¶\Åþ„\è\Ý\Ó>W‡¬”¼•jm`\ç\Ýh\nü‰NR\Æ†¿\ÚIÿ\0RwLK\Û™N“Åµ\'Á¤\ß+Ø„\É6NoJK\í\ä¶\"ª-÷^\è¾\çR\é\Õ==\ÙÝ§\î\é®\'£»i†9D´KC\â^%\ÏxG©H—HB¬‹82 W).ˆŒ¬\å²%Fab¦\Ìex`”Œm\Æ\ÒÚ“5˜˜\æÇ\n\æªt\å\Ív¶Ï¡\Çx¼E£»s\ên\ïk¯C\ï\r#—Owd% \0\0\0\0\0\0\rv/y\Íh­¸V\Ü8›7¸=Á\0Á=@\ÂK•}º‰!u¸\â÷E÷:—N©\éh{þ\Îý7wOhô7o0ø”Kn\Î\Ð\Ã8–‰s\Úª\Ä\Ö%Ç’k£G–\×%\çdV\×f6rJFaiL#T‘…¥¬B<Ù”\Ëj\Ãæ¬»EUÁJ§AœY£\Íõ´S\åðú7ž¦\îöºñ”~ð¬rô»»!)\0\0\0\0\0\0\0h»±\Í,š“iJW4´V:\Þ\nX\àV\Ü+nH£7¤@\è.\ê<\å\ë2\îk—\éZ^\\F¿cN\âq‹«ŽªRŒçƒ’ø¯K[\Þ\ä\Ç\Ý6h\Ç;O\ëÃ–)={»B×­kOc\á=MÝ³–‹D©0\Å8–‰chFªk.L•W\Ü#hyy¡Ur\ÊY\å\åU×‘\Ïir!Õ‘\Ïi^°‰RF6–Õ†aitÒ¬u¥\Ú\êqÑª¿qœù:Ã¿M\Ò\íó©ºkô{˜â´œ\é4±\Ö\Ò\ÓM\á\å^’‘\Ë\Ó\î\ìÄ¤\0\0\0\0\0\0Î·l\ï:?Iû¹º¶\á\ÇVoH\è\0\î£\Î^°C[³]º·Œ})ž!{7ü\Ç\ÏÑ°¶»–6¯U*[¶|\æú<›:´ÚŸ–\Ü|\à\Ï\áòÛ‡ð\êI¦±X4\Ö)­i®zq.\Ù|M‰ghFªk.\\•V\Ý#xyy\áKv\ÊY\ãfT×‘\ÍyrBYœÖ–Õ„Y3ž\Ò\è¥_\r˜Ì»)V©v¹ø¹ôY•X£kCw\êrÿ\0\ß\âý´S»\Ð\î\î’\0\0\0\0\0\0\0\ç[¶w¤ýÜŠ][pãˆ«7 \è.\ê8mÒø!¯X.\Ý[\Æ>”‹\Ï½“\\J¨\Ü3#<³V\×rnÕ¼)\ÔzÝ³\à7\Ñ\ä\ÙÙ§\Ôø<¶\ã\à\éÁŸ\Ã\å·Qx5Ši¦±MkMp£Ô‰v\Ì#\ÕFµaz«/\Ñ^^¦­~úFw—\Ï\ê\Õ\æq\ÞXVj\Ìæµ4¦\ì-œö³·‘ŒËª´F»}®|\ÉôYM\ÛÖ½[\ïS–\Úþ/\ÛC»«»¸H\0\0\0\0\0\0nÖ½\ÇG\é>ÄŠ][p\ãh«7 z@\èwq\çG\ÖP\äÅjþ1ô¤^x…­\Ù>Q*ª-\ÍM\Æö/\æ\r\ÛF`gË¶j\ÖöM\Ú7…*¯[µoyü\ßG“gf›S\áòÛ‡V\ÛymÃ¬\Ï±X4\Ö)­i®zõ—U¡Yzµyºšôj¹NzÌ²K\æu?yG^¡\çä²˜\éº,¤r\Ú\ïC&)H\Âl\í­\å\"›¶Š±Vx\Æ^.§A‘ºñ\Ô\â½ÿ\0™\í¢\Ý\Ûwvò\É\0\0\0\0\0\0\0hÛ±x3\ÎhûEmÂ¶\á\Ã\Ê3z\0@,\'‘n £Vv\Õ\ãO¶\Ü\Zicµ\Çj\\m´§ij\Ù8Ö¯\Ïö¤Z\ÜBo\ÙaY$±{Eµ\ä\äñ~N$B\ä‰Kx\ÌöýK\Écj\Þj½n\ÙüWó}Mú]Oƒ\Ënxsmå³¦^¬cŠÖš\Å5­5\Â{t\ámE7«G\Ë5p“G.{lù-EwÉ²Ž¥S\ÌÉ‘Õƒ\n<ªœóg¡L{1¹”Ý¬C\åÌ…¶{Œj>\n5>Ø°:_So{]x\Ê>ª†‘\Ë^\î\ÈJ@\0\0\0\0\0\0\Z6\ì~óš>\Ñ[p­¸p\âŒÞ€\Ð6<Â¶K\Ô\æ“\ëT\çV)\ì\ÓN1OÉ¥‘¯)¯-ó/T\í3\æK\Ô\Ë\Ï\r3!.\Ýq\Ïö¦gn!KöH\ÊRø+•ÿ\0\"’\ÍY(1JŒ2d\ÃrÌ¬ñt´¼–6\ÏU\Z¯m»ø²ù¾&\ÏGI«ðO†\Ü:i—xðÙ—9oTjµŠ\â-¬Ëµ¶xö\ÓÍ³\ÛôP\ÊóÍ›;«Ž*ó¯¾\Ïz\é	4ÀF8[Ô—Æ§SÐ¢ÿ\0¨ŽU\î\èýM\Ý\íu\ã(úª\Z\Ç-{»!)\0\0\0\0\0\0\0hÛ±ø3\ÎhûEmÂ¶\áÃŠ3\0ô\0¹³”U½\Ô*I\á:‚2\ß\äO\ä&\'iLN\Òß²\Õ|iO™/Q¤ð\Ñ\Æóß®9þ\Ô\Ì\í\Ä)~!÷[²“|/\ì(Í†T\Æ\Ã\á\Ñ\'añú91™Ùš\ÚÁ7­\Z\Óü¹sj|1Ñ±]f»» §oª\îŒpŒ1\Â5\à¶CŠKyùó\\YµU“k}\Ù÷tºÞ¾´¥)E¸\É8\Ê-\ÆQi§ž\r4ö3§ž³<*2\Æd!šŠr’Š\Ú\Þœ`]]$¨\Í-Š”\Òú¬G*G.\Ô\Û\Þ\×^2ª¡¬rÛ»²\0\0\0\0\0\0»ƒ<æ´V\Ü+n8£0\0€lr½Æ„hõ\Éu´\ã°Ž:8á£¥†8yI\ÞvLLµ\ìŠð©s\ÏK\Ó9‹v/\Ä&h³3­“²7z¨“\Î\Ù6}\Â\ÜÖ´reÎ±³µ5\Ûhy™²¶\ì\'[O9)“\ÌøÏ¬\ÇW°wVqJö+¶A`•\ÜRû*%±\ï\ì{\Íp\é5SŠ~®ÿ\0w·\éü>‡Gª\é\á·C®-\ÆI\ÆQn2‹M8´ði§±ž\×/M’2*…\ÎI£‚\ëk\Õo”…fR¯gÚ§\â\ç\Ñb9Dr\èM½\íu\ã(úª\Z\Ç-»»!)\0\0\0\0\0\0\0hÛ±ø3\ÎhûEmÂ¶\áÃŠ3\0\0\0=\Ôy\Ñõ„ª²?¾\Ü/œ])—ôFY\ém³žlúP\'f6\ÈûŒ\r+W&L©4hš\Ä8\ïu­\"e\Ç{/²rÁž~¢7‡<OVÛ“ªj<<\Ô\êô´ù\Z¶è™„¯\"\îì¢•\ìV5i¬»Š_eN¿±\ï5Ñ¤\Õx<—\ã\áü=\Ý>}\ãirG)µ4\â Úši§¤¶Å§±ðž¼»&WŠXfy>\×>dú,˜Lr\éM½\íu\ã(úª\ZG-»»!)\0\0\0\0\0\0\0hÛ±ø3\ÎhûEmÂ¶\áÃ‘F`\0\0\0.\ê<\èú\ÂUyv\êüÿ\0jF±ç¢j%¶p\Ú\ï¥\Ñ[Ýšœ\r\"Ö²es\ÚVñ+g5\åmhq\å†\ÛC\É\ÍW^+/m\êV‡«†\íS>s5\\§ug®\ÒÆ­5‚W)oñT\ã\ß\Ø÷™Ù¥\Õx<—\ã\áü=<Y7\é.Q6\Ói¦šm4\ÓN-<\Zkyñ£¡\ê]„¹’õ2a0\ê]M½\íu\ã(úª\ZG-{»!)\0\0\0\0\0\0\0hÛ±ø3\ÎhûEmÂ¶\á\ÃJ3z\0\0\0º:>°•nA÷\ëŽµ#j0\Õ\ÎÕ…\âF‘*÷d„K\Ä9\í)\âZ!¥.’,\ÆÒ›D\Î\Ì,±·g6F2¸³™\çe«ZJ\îÖ©\ç\Þ†+¬¨\Ì\É\è\ã»N\Ï\Ü\ÊWI\ÝY¤®\ÒÆ¥=I]$¾Êœc\Þk·Kªðyo\Ç\Ãøw\ã\É\Ú\\r\ï¦šj3RM4\â\Òi¦žÆžñ\ëCxun¦\Þöºñ”}U\Ç-{»!)\0\0\0\0\0\0\0hÛ²x3\ÎhûEmÂ¶\á\ÃJ3\0ô\0\0<]\Ôy\Ñõ •~@÷\ë\íLÖœÃŸ[\Û\ß\Ñz‘¼CÄ´²Á†s)\ÑfR“L2”ºL\ÎÌ¥:„Ž{²˜ZZ\Ì\â\ÉUmmP\à\ÉWU%iB¡\Ë.\ÜwN§2®\ê]¢n›™°¸£Vö\ÛF4\éNu\ã²70ŒmðM%©\ï\áƒ\Þk¿I©š\ÌR\Üvý¸¯\×f¦\Þöºñ”~ðö#—_wd% \0\0\0\0\0\0\rvOù\Íh­¸V\Ü8r(\Ì\0\0@ñwKXJ¿ {õ\Ç?Ú™i¶•sW\ÅOªþ(\ì‡\ÎONY ‹C9g,\å\"K)H¦\ÊJ’—I˜]œ\Â\Æ\Þg&HL,\íªY!µVt*w‡M%aF¡‹³\ÑóŠ~\à¹ú%\Ïðdi‡ü•öÃ·\r¼\Ð\Ô:›{\Ú\ë\ÆPû\Ã\é#—©\Ý\Ù	H\0\0\0\0\0\0EÝ—Á~sG\Ú+n·Q˜\0\0\0<\ß\\\èú\ÂP3ß®9\ë¥2m\Ä&ý—ô_\Øt\á¶õö<n?MûOý)F\î)e€g,ð\"T–x2’\ÎRi³+²u	×„\Ä,(L\ã¼4…•\n‡%\á­VjÖ‡E%‹8\'\îŸ¢\\ÿ\0\nCù+\í‡ny\ã\Ú\Õú›{\Þ\ë\ÆPû\Ãé»½\Î\î\ÊJ@\0\0\0\0\0\0\Z.\ì¾óš>\Ñ[p­¸p\äQ˜\0\0\0<{W*õ„«ó\ßn9\ë¥2m\Ä&ý—0©£,w·\É\Å\rœzœ?[ný–;\ß?,±\nK,H• \ÊJ²‘M™YTºR9î˜„\ê39o\r!>…C–ð¼,(\Ô9o\rjøË³÷\Ç\Ñn?…\"˜\ãû•öÃ«ù\ë\í…So{\Ýs\è}\éô½\ßE\Ý\ÙIH\0\0\0\0\0\0DÝ›Á‹\éT=¢¶\á[p\á\å€\0\0\æ[W*õ„«ó\ßkó\×JDÛˆMû,ê²¬\Òru\ÏÀ–ßƒ\Ç\Äu`\Éøe\ä\ëô\Ûv¿¿\Íg¡\åK$H•Y`RU–x3)Wdªl\Â\Ë\Â])ö…\âh\Ì\æ´/	\Ôj×…¡\æYŸ¸\î>‹qü)R?¹_l7\Ã÷\ë\í…GSo¼]ó\íþôú(\åô\ÝÝ˜”€\0\0\0\0\0\04]\Ù|\ç4<\Ñ[p­¸p\âŒÀ\0\0ó\'³‰ •vB}¶¾÷fºR&\ÜBo\ÙcU•f&Jv\Ýu“2‚Ÿa7…E³öÿ\0©Ù/‹¤òðuš9\Å>*}ß‡ð³F’ó\Ù\"RUeœ‰Ù–„ªr9\í\ÂU)Z„\ÊS9­>r\ÅOq\×ú-\Çð¤gXó\×\Û\r°ÿ\0’¾\Øø¡õ6û\ÅÖ¯‡o¯‡\ßOw»é»»1)\0\0\0\0\0\0\0j{¨\ØJ¾J¬ ›•„–¶\Õ9)K÷tŠÛ„O\0™F@\0\0\0ù©°%UeQRºœeª5µÅ½÷Ž)}­ž°µº\ÂÒ¡Fhó	`o\ršš\Øö`J&7]dÜ´»Š\ï½Syó¸9Nšf\ígªú:cÍ‹ý|¾K\èñlõšKÈ–X™\È\Í+-	Ù¡¤$\Óf…¡*œŽ{Bð§Ï¬«\nŸgq	P¥ù9,$ù[~Žpc›dÓ«¯EŽo–6\â:¶~§ü—*96u¦°ý&·a\Ç,1ú\Îk\ÈzúuR\0\0\0\0\0\0\0ñ¤\ÖZzš{\ZŒgž\æU\èÔ•l™½m&\åú<ZUmñz\ãû¸p-«f³9®\Ü)5ôh76\Õi<+R­J\\)T¦ýD*Ã¥ý\à\Æ\ã\Üy}nƒ\Èýn—q?CˆF\Ê5eŒZ\îeƒ\Õý	‰\Ù1(q«s\rIÓª·±i\ËJcz§j½\ë\×mc\ÖV6Kó/ª6WÃ\×\êv_‰>_T\í–®¿Sû²üG—\Ô\Ú,rõP¥Œ~$£\'É¯Wµo\á\î\å\Ôh°\æ\ën“\ë¦¬\ã\Ê&¥õ*þr\ßY_\é?5¿\Ü|ŸK9²‡É¨ýJ¿œ¬\Ú%?\Òp~i÷|Ÿk:²Šÿ\0MG\êUü\å&+=\Öþ—‡óO»\äúY\á”WújR¯\ç+4¤÷Oô\Ì?š}\ß&j9Õ•jv4­i9=šj\Î^E¤ñôúšz­GaŽóÿ\0~\Ëü\Ù\Ü\Ç)\å*ñ¸\Êò©FŠ\Ã¸´j8üZtð\ìyZIm\ÖiZ\ÄFÕ˜ñÖ‘\á¤mÿ\0cgN…(Q£\nT¡S‚\Ù¥‚FYÀ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?ÿ\Ù','download.jpg','image/jpeg',1),(2,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z%!1\"%)+...383,7(-.+\n\n\n\r+.++--++-++----+--------------------8-+----+-+--+-+ÿÀ\0\0ø\0\Ë\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0P\0\n\n\n\0\0\0\0!1AQa34qs‘³ð\"#Tt‚“¡±²Á\Ññ2BRSr’\Ã\Ò\á5bƒ”´\Â\Ô$c„dDÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\01!2Q\"Aÿ\Ú\0\0\0?\0÷VkÁ…ºE†Ï®ö·\ÎPv\ÈX\Ç’§&!f\Ù%\Ù$†€s9\Ä\09@¼ž|6€!\ÃübA$œ\ä‘BO\rUz‡\íŸu\Ëø\è‰/\Ú).\ë—ñ\Ðÿ\0ó7c$_™\ì»ñ./Æ¨\Ã\äAûüIƒ\Õ!\á\ÙGXÙ¨‚,3\æ+§\ëy§…\ã\í^)7‡bÆ˜„\Ð\ÑÑ \'°5&´·œ­!:\í>A\ìL³ú\Þ_º!x\Æ{Rýo-\Ý|c=«ÉŒ\ë´ù\âù\çiòÁ\ëß®%»¢Œgµ?\ë‰n\èƒ\ã\í^4ü ý>A\ìUß„Ÿ§\Èµœ5+\Ý0|k=«\Ìq›d\Èñfÿ\0CÁ\ì{h\Æ\Ä~’\Ð\ë\Z\Ú[SJ\nss:÷<l6‘^\Ãx=­16\àXÑ;8d*Tj¬Bòi}„\Ä3pVp\Ê\Û\Ä:ü—Í¼¸p\ípKy‰]€pñÿ\0öBþ¦7ú\èù\ÑS\Ó:\×\Å4úƒ÷\\/\êc® \ì^\Ãý\Û\é‹\ë–^„#8_h][:\ãÉL5\æ§ðÿ\0w3úˆŸ\ê¨EÀ¸u/~‚Æ‹\Üù§µ£„™j×§T/˜´ü!,\Ø,Š!½‘[e¦:shñÀú‹\r	‹¡\èx½‡\Ü\Ð\æ\Ï\Âp\"¡\Âe\än ‰Z¥û5Œ\Ýú˜Ÿ\ê£IÀfFJ±~YfY.\0†\Õ\ïs\ËZ	¨hÊ¥«yL5\æMÅ¼`~\Ã?úbú¥“þ\Î\áþ\ë…ýLoõ×¦$˜<\Ïöw;®õ1¿\×\\&°N1Bn[c¤[“eÄžÄ†Àx*½M$Áæ¸ƒ²lH³?¡O0²(99NnCƒ®Éˆ\Ì\Ö\Ùe\Ö^*Gª/Ù‡5“rsl|B\èùY#-‡‡\'lmo¡\Z«`yƒ^C{\áCy\ás>u\çz\Ù\Ù÷g  4Óœžt-?6!3(Š\Ú\0Th«\r\ï¬#\ÆB\è\ZƒpÔ¹|.\Æ\Ò\ÒšT\ÃBV§ ‡#ÆŽ\\ò]F\ÞØµ£5ƒ\×nµk0œG¹\Ðb8º\Êi:¡_!YS“¥…\Í\Ê ;\ã2\ÐK@p\ÏhZØ—(\æº$ÃšZ\×C0\áTS+(‚\ç\á\rWKµ\ãog\Õø\"#)0<±Á¤Vº´ðZ\Õ{{>«ÿ\0\Å\ZGÆ·º\\Á,,/¯\É\0K\r”»ÿ\0Ž\ç®/z‹ž¸½\ê‰=\ê¼G¤\ç./r–¶ \åóŽ6,ˆD…?ú#ô¥Iž\Ú9|\È\Ïcg\ÒGùó)[ñÍ¬÷r\áE­\ê\Ó§¯Ç…Š\Ü)zN¹gžš!s|,\ãóQd^·.\árh¡\Å\Ìyý«¡¾º—¬\Î<Š\rm4)‚óPUXOVQSI RE$’I\ìË¹\Éw\Ñ\è\"#\ÌY\ÞR\Ý\ï£jÙ“r’\ï£\ÐEGxµ¼¥¸ˆ]Tª\0\Ã{\çñ·j¾À‰p´P\è\ØIÂ´\ÛaŽVB\È>V”‡#¹°»Jš¨ƒ_g*³Ð¯…1š¼B\ÑG»\å\0@#øˆ¡\"·Šk¤¦d\È/k‰?++\ã\"`µä¶¡¤\ÜIºò‰¸R´¦z.øþ“„9Ü…´ò9P8ö\æp?üVŽZ\Ëq\í¬\àø«\ÙHŽŽz\ä\ç&.\\\É@œW7œW2PNHö\Öòù‘–\Æ\î¡ž>=Ÿ\ÍrÝ›\Ë\æ(·cö\ÖPñó)ö®ž/ÓŸ—ò5k†¥\"h¸C„WCò/Er•\Òev¢Â²\"Ap¸ûWYyšjü–:\çø\ß5¬Ø§8\áQ‰m£\Ézh1Ã¯¿Jr\Ú\ê+‹¢0#\ÛoÓ„ú¬h\í9ù\×i9»hz\ëK°‚\æ\ÇT)…†Ž’I\"¼óf=\ÎK¾A\â\Þò–\â!tm@»1nr]ôz¨“\âƒ T“cÅ¤›G€8\0\0r)T7ñ°§|zž„f\Ò\×\\z\ÕO_…;\ã\Ôôa­O®H4¥M3\n\ÙSw*£\rø®\\I!‚·9&š‹%\àør\Ìsa¹\Î/¦\\G\0\Ò\êZ\ZS’\Ú\Ûy©¦€\0\Þ\Âqâ¸¸­¢\æ0XÑš¤\ÚN³ù+X\n>!0\â\Z*ž‚‚\Þu²Omg¿\Å]ª\Î\í\àw©^ª¢D¨˜•P3Š)\É\\\ÜPvÁÇ·7—\Ñ(\Ïc\Í\èxøý+V\rÝ›\Ë\è”Sˆ“90\r\Û|n®ž/ÓŸ—ò9`]\Z\ãER\Åzó+ŒzôWRtEÁ\í…ÜµspQ·6F\"J¿h\Õ£ÔŸ$¬Y\ëjVž\Ø.w:­\Z\rB\æÈ¶Pû•¹xdƒ[³.vc^Ý¥&\é.­kQ¦£Ì±6ºnV5,X±cL$¹K\Åª\ËO>Ù‡s’\ï£ý¼TCˆ?» ÿ\03¥zÙ‡s’\ï£ý¼TGˆ?» ÿ\03¥z•A¸F\ì+\Çþ5\çXQ…ð\È‹i¥zF0µ°ÿ\0ZŒªV$3i¾Q•\Ô\æ^m·\r!P2\Ì!µ¸\Ô™\ÌurNŒ ­\rC%H&(\Ò\Ã~[œ\á”\áü-h5:KB\×t\0R¨j2\áÂˆA\Ô^\ÒG\"\ã3:\\j\çes¨\0.\Z‚ˆœ3X\àw©^ª¥%\Ú\ç\np\Ð5\ëVÊ¡ JrTP1*§%@”ða\í\íð½ˆ1Cqw¤({\î\íð½¶ñYÝ¥\Ö\Ø#F\é\n\é\áý8ùÿ\0\éw­3K\ZN¾uy…{>«\Ë\Ík28*F*\É/\"õ\ÒÕ«?~z]SkUv\ÄÖ¬B‹\ç\åX®‘3}:õµl@ƒ’\Ð9\Ô$dò{#B\ã\ä\Ô£EÃ®µ¹\Å\Ï!Y!s\ÉY%\ær\"€nx§-•„™`p·%À­¹h™L[g\ä\Øf\ÎK¾öñQ!´Œ ‹mXb¼ƒÀE¨sf\ÎK¾öñQ\Î-\ï)n\"FÕŠ\Û\È1òY†vuÅ ¶¤w\\PÉ–g\ÍÈ«\Ü\Ü\é½º³T&9\Â\Z*\Äq2\Ìù£™!€¡P%Q%\"TJ%@”\ä¨¨’‘*$ ±‚oo…è•«‹N\íN\ã£tŽY8\'wo…\è•oºŒu/\Ûb\Ðð¼\Õk‹8ùÿ\0¸N\Ðy•¸1ˆ÷ðÚ°\å\æEG[H©\åW\áEŽzp\Ò\Ì\Ë\×+\Ç(Š\Zô¬©°XH9•‰9š^3óõ†\Z„\ê7+¶Úµ\ÑnWm™ª\íš~gu\äV`\Î;=JÉ†N•¯))™D\ÓF“§:&\Ö\Þ\Â\ï1µ¶\Ô<‘›™CcaüA\ÂM\ç•]‰…ž_|‹Ž§Ÿ\È*ó÷\Æý\Çi\ÖO±c\ä®1H \"š\ÓI¸¼Yp4\á¢\äÞ¸\á\Ø4C\êZx!\Ã\"”¥3p®x<9Ž\Z¬\Ó\\\ÅtÁK˜\Òo¡k†‚:•/¢{\ìÁ¹\Éw\Ñþ\Þ*:\Å\Í\ç/\ÄB\èÚva\Ü\ä»\èÿ\0o\â„ð‰#Á¤Re´¾k\'€–“Ê±]M;\âw¾½k¢li ŠÉ­º\r ò‚*%X†%D¤J‰(\\\ÜT‰\\\É@‰Q%\"T	@‰Q)(’‚\Î	\Ý\Ù\áz%XÁ°u3Å‰\éže_\î\ìð½–@þ6\'¤¯>Ü¼óüµ¡\Ç\É\"\Ê\rT÷{•\È3¹«M55$\è5ó\Ñe¸‡g¶\Üö*±#¹§ƒ\Ü<‹¼¯	Ÿ\ícˆ5vI¡\ÑÁ¤\ßÊ‡e#\Ò($\ç´ûU©Y\ã’tÓ›?ž–¥W³l@,6<|\Ómó‚º|šnAºµ¨ˆ\ä€ÀÔ†$™L\Ö\")x\âyµ-[¯Gd´ªÌ±\Ô\Ò-f§¼®\åù\Ô]\Z€\ç±F¬Ž\Ø:q\å¹5­+J›Q~‚	¢óŸ„Þ€$M(A\á#ÊŒ04\Ù\0o[\Â\áä‡Ž\ån*²ðò^iquy\ì>[U–»•s..ô³\ç%\ßG Šˆ±÷t\æt¯C›0\îr]ôz¨³$Œ9\r$\Z³.\Ê\Ý\Æ 4pR«\Ìñ\ï}\ÎñÐº&!BŠñó}\Îñ°º&!2¬C\ä®d D¨\ä¨8 bTILJP9*)&%¬¾\áz%b‰\Ç2+ó±ör­œ\r¾\áz%bEƒW<ÿ\0\Øÿ\0I#=úl\ÉM‡üSnqŸ¯²÷x§_*\É-5L\ËNK|˜¢£\çŒ8F~·®’¼½qüZuZj9}Èƒ\Çc…ŸY£²§-C`\å¦\á¤_Ë¡ZÀ\Ì!\Îoü–\ç¶1½$ü\Þ\å¥\Äz–t­6%‹´v\å­	\ê`,¹yV\r³[ƒ¶*\ÒBee„Ù¨\æõ¹\â›a¼½†\Êë¶€¬@ðkª\ß2&“†\"±‘)_’\áMtä¡·•ròúY>\ÚÒ³£-‹^neQÒŽi²¥t…&+Aù^\ïbóºhKf-\ÎK¾A\â\Þò—\â!tm@›1\îr]õ÷Q\Ö-\ï)n\"FÕš\Û\Éqó}NñÐº&!‹±ó}NñÐº& òUˆgÌ”\ä¨‰P%\"T	@‰L˜”Ä rT	H”\ÕAoo†x^‰Q“”\Êc\Ïý±=2\àCÿ\0!ž¢V\Ö,Á€\í\"4^NÌ«=³ß ôy:f±gÆ–¥\Èòcƒ›“Ü³fpU\æ•[\ÍqK\Ì=†­$?”G%>BE´‘q ±f\Î`²\ÓPžEÔ°«63\Ö \Æ\Ë\0ƒCž–®\ì¥\äT_\r8œB.4=o[R\ï\Ü\åvæœ¬\Ãi¿Þ»d•\Êi«GP­°Š[\î]#hC%®óÛª\äYŠ/†ixsn\ÑhB…\ÏÆ³“®egNqZ\írkYòs°—+\ÑÜ¨Dƒ\Û\á­\èŸZ» sC…\ÅA¢±kó[O´\"¼N\×\ì³\ç%\ßqb\Þò–\â!tm@›1\îr]÷÷Q\Þ-\ï)n\"F\Õ\Zy&?o©\Þ:D\Ä\ZQŽ?\ï©\Î6D\ÄJ±J\æJ“Š\æJ%@”‰P%L‘MT\n©ª˜”\È.\à3ÿ\0!ž¢U…/\ïi°½\ÙM\Ì\àoW0øg…è•–¿[\ß\çHzzn\n\Â0¦Y–\Ç/\ãKˆ\ç·:²ø4½y¼\ÌH1Hdµ\Ã8Ï¨Œ\à\Ò\å\èØµ0æ€†úCu+cô–Áu÷\æµt\æ¹X½D˜\Ý×®…“9\í¨º«\Ô\æD1_m­4§i\×\ÃB»H\çC¤\ÜEô>E\Þ]Å¶½X;²„\æO‡¥‡Û©_C>Å«BQÊ¨:	i\É\"†Ê©±\Äi]95y®©\ë\äR{ˆwS\×Zª\×\ë]£šcJ¥£|Yž«Cló\\.§u¿*M\ä ,_˜£­õ[ \è5\0\ê^>½»øú\ØóÝ™7).ûûˆ¨\ï·”·£jÙ“r’ï¿¸ŠŽñoyKqº6¬WW‘cþú\ãatLAnF{ o©\Þ6D\Ä\â¬D\\W\"¦\å‚Q)Ê‰@\Å1)Ê‰@““‚\æ\ß,ð½²„q–öº\ì·P\è·:\ÕÀ[\åž¢VoŽÿ\0®\ï:\'^–\ß™U|-\ZFžB¥eÍ²ñ ú´-‘GbE~i¿›:º\çé·€1¸\Ù\njŽi \rkš™g?½mN5Ð»6¨vV\ÚÒ¹õ„	\ZL<<­\\…_±5s3·E–W\ÍÂºó\Þ{fÁ4žÀ›Xlp²\Íh¢Üœ¦\Ú)Q \èµy\æ”ilV›À\Í\\\ÔÓ©hb\Æ0\äv˜§°65\ß4ç®¥k_\Ò\á\Å%‡±xº·\Ùm+r\r´W\Ï\Ï\ÖõŸHmŽqq5$‚4lW™RµÎ·Í¬W\'´‚4i]aÅ²yTc¾\Ê~J\ßb\×]}1k[Á‹0\ÖP	\à2õ$±\ä¥LHÙ‡`8ls59\Ê7^^¯\Û\Õ\àŸ\ç¯;Ù—r’ï¿¹ŠŽñkyKqº6 =™·).ûû˜ˆó·”·£j\Åw \Ù}\Îñ°º ·#Mw\Ü\ï¡b	qV\".P*EA\È\" T\ÔJ•5“$\ÔAo\ï–x^‰C±\ÝG¿\ë»Îˆ°øg…\è”92\Þ\Íÿ\0Y\ÞtJM~”œ4s®D)1\Ä^Œ´epÓ›dA–4\Ü\ì\æüöœ\ëZVf^!\ì\\Ö’Gb\ê1Ù®&\Ã\Ès!Á©Œ\Ön\r¥™9¼[COV~[x2\rŠü¦SNNƒ[k¤g²úR\Äƒ\ç#B±9?4öLû&\îJM!>ABÇ›€5k~A\Ìs\äžBst\ç¯\ëŸS=\nbE,†\Ö:\ÑsIø\Ã]x\æ\Ø\âÞ¥eÄ™sˆ.$–ú\ï¹t„úšWÞ»k¿)÷&€÷5Œ¹\Ä5£I6*B-3#=0I‰\Ó.„:µš\â\ÙFžwjX\ï¦\'?.°w€°`–—djZ;\'|\çWs\ÍE}$—ºL˜ó­™÷).ûû˜ˆó·”·£jÙŸr’ï¿¹ˆ1gyKqº6©V<d-÷;\Æ\Âè˜‚J6\Ù}\Îñ°º& ’¬Q*E2R\Õ`ÀmO–\ç5¿™p!5v0[“\\ôóÒ§Î¥ú;r©ÁŸ]¾EY2\í‚\Ú~mm\ÒW\ì\0Ù kMD\ÔAgo†x^‰Cqf\ï¬|\è—o†rú%:\\\ï¬|\ê\Ïi×¤A\Âl€M.V!À³¯]	\Ý/L\Ú=Š\Ø\ç®Mm\r9½Š\ä@\Øj¸EX†\ro\Õr‰]\Ù&	³®¥¥\nX\ä\Ýeú\r‹Œ™­·i\äµlKE´WÙ©JÁ\à0\Å%Ž²;E\\O\ÊmÍˆ4\Öã¯„(9Ž\É\"‡6{VÙ‹\r\Ð\Ú\â\Ö\ÖK\\\rk•Q\Ø\Þ\Ú^\r…jb\rl\Üx›k2¡ˆnÊ¶–¼\ÐKGÊ»B\×=XfÜü\"ù˜¬ƒvo¼\æhùOv¡\Öõ\í\Ø\'2^ \Ã‹-¼›ËŽ²I\'…S\Åü[—“Agd\ïŒ÷§‘}´j]f\Ýuã‰$’dn¼\ëf}\ÊK¾þ\æ\"<Å\å-\ÄB\èÚ€öhÜ¤»ðt1\æ,\ï)n\"F\Õ+O \Ù}\Îñ°º& ”k²û\ãat,A «ŠŠ’d\rD\É\ÒA\Z%D\éQh˜…4\Ä ±÷vrú%dJÁ\Ê\Êú\Îó­Œ»³—\Ñ(cœJt\Ü\'L<\Ò\Øö´\ne=Á\Ô#øF½\\ªór³\Ü\Ø“ÁNp¨9]ÝƒH°·­W§\Ì\à=¤d†\ZKÅ¼™®Ð³Ž¡\Å2@¸I6T\ÓË¦\Íß·,y¤Ì•5{\íU\0¥\á\Ï\à\à4ô\Öûj‡\ç0~×—=«\"„»\èuiZ,AL\Ô:z…œ\èE¹—y1\"82Kœ\ã@\Ð	&¶\\Y«n%¹µu}Û±þ‰(\ÐñH±(øšA¥Œ\äZ¬lE\Ä6\Ë12£\Þ\Ö\Ø[_ñ?^l\ÚQÚŽž>3\î’I“ª\êd’Iœ\ìÑ¹Iw\à\èb#\ÜY\ÞR\ÜD.¨f\ÊK¿E\â\Æñ–\ïx=Tªñ\í‘7\ä\ï¡b^³\r|)ƒ1CµL5­s³6,1@@§\Õ+Íšõb\'T”j•P:Iª–RI6PM”\ÒM”–R8\'wg	ó\ì\nþ\éo¤+Æ¤\"„š«W lŒÙ·`\è\Î‰·:$M2ª\0‰\r¿\Är©Ÿ(\èPz¼ü˜ˆ\Ò(+N¼ˆK	Imou\âÁA¤-²ƒ=¶[[‘Â­5\"ÈŸW­ü*\ÊÍšóY\Ü÷\Ðl´Z\Z\Þtf\ÕU‡„pLFR­6Œ\×pW9§­z\ä9Œp-\È\ÏZ\×U\0\Ñe÷­ Á +¬ü5\å³ˆF`=ó-|6\Åq9\ÝmÃ„/CÀØ¿-*)Zsº÷›\0µ\Æ\Ü\ËQ%\Zœ\Èd’I\Z2t’@\É$’\ç5\Õ#\ßc¢z>Å\ã-\Þðz6¯\Z\Ùc¡\Ì\áYH\Ïs¢¹¶·l4«A–1®­3¸‹\Âö¼,aKA„o‡\nX\Z|\Ë*\ë=%47BŠÆ½Žs\\*\nšØ–L¸˜q\"\Ã\äÕ¯h\à\Ê\\ä¤’?P;¢\'\Øb_P;¢\'\ØbI&…ðEº\"}†%ðGºö’I¡|ÀîˆŸa‰|ÀîˆŸa‰$®…ðEºb}†%ðEºb}†$’š\"v \Ý1>\Ã¦8\ì;?m”~\Ûq\"\ÆDg\Ðn¼[«:I Ê/Œ°FC#N\Ð]”\ÇD\æs\êhº\í˜\Ïô³~${I\í¸\Ïô³~$~¶\Ìgúi¿\ßÂ’HÙŒÿ\0M7\â[øR\Û1Ÿ\é¦üK}‰$m˜\Íô\Ó~%¾Ä¶\Ìfúi¿\ßbI [f3},ß‰…6ÙŒÿ\0K7\âG±$,¼gúY¿=Š¼\Þ\r\Æ9‘µÄ‰8Zl\"†Ó©Å”¨\áI$\Û\Z\ìN\éh­™› s-d A¶ð^E”A}• ¨>¾’H?ÿ\Ù','download (1).jpg','image/jpeg',2),(3,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z&!1!%)+... 383-7(-.+\n\n\n\r\Z-% %--------------//---+----+-.-.--+-/+-+-------------ÿÀ\0\0ô\0\Î\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0L\0\r\n\0\0\0\0!1AQa\"q‘24BRr¡±²³Á\Ñ#3Tbs‚“\Ò\áð5CS’$¢\Âc£\Óñtÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0<\0\0\0\0\0!1AQa\"q‘¡±\Ñð2Á\áBñRbr#3Â‚’¢\Ò²òÿ\Ú\0\0\0?\0\î(\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@]Óœ2²ÙÅ’^ÿ\0¸Ÿ5OPS`Bö\ÇoÑ¤ÿ\0?\"X7²;5Ù¥\èlŸ‘,ž\Èñý\Zoñ“ò%¤{0Y!ù\È_x\â	¿MD´´]U\â+˜@Fö÷²}\Ñ\×\æP·½“\èvò‹ó \ÞöO¡\Ú?\Ê/Ì€;{\Ù>‡h\ë‹ó \ÞöO¡\Ú?\Ê/Ì€\Ço{-{\ÎzyQg\ÍT\Û\â\Çô;GùEùogk!\Ê\Çh=1~e6¸\ÞöO¡\Ú?\Ê/Ì ž,C´”_™\07³½“]Ž|ð\åE—^ö÷±ý\Ñ\×\æ@g·½è–Ž¸¿2\0\í\ïcú%£®/Ì€\ÑÝìº¬sôº/Ì€\Ú>\Î\ÖJ‹\ÖIÀ\ÖAŒÓ¢òùÁNØ´‹K¬²UÍ¥ø\Ü.½µÊ­:·ä€Ÿ@§\í¢4²“v\ë\'Q8\ÖPL\é·Y\âl–~Q\':.·@Õ½X‚\"\ËÂ‹C‰k\Í\Ò(p ‚\nI8»0šd\é\Óež)…¨>G<¶H(/1 š:½q½®…V\ì’v\Óm\r‡Œu\0\r%\Û9 \Ôy•ˆ8Å¢\Ð\ç—HóW8—8\í$\âªY+ˆ‰†\Ï:P[Ùµý\Þt/òx\Z™·yÿ\0D(\ámLñƒPóþˆ[\å\'šf\Ücp44×•P·ÊŽN\î\Þ\"ñ\Æ\ÓZ“@A$kŒøm\Ìk\n’“Z/\ä\ÓONI·\'–n\Û\áýKœr\á\ÔÍ¿‡\Zó\ço+2,\Äs._;‚÷ü\ä\Ê\Ë³“y«ß­g\Ü\ãš O\ÞdlÜºmœ\Ö;g\ï2\Õg\à›R\È &\å”¨\Ö\\Þµ™bž\ÓMdbÀ\éM]\Í\Ú\É\î\Þii\à\Ô,¼\â\ê`\ÜZ\rÖœ³sƒ©¸ULq2“µ½\ë\àŽ«\à\Ýúo+nZ½\Ädº66“\Ëu\Ý3\Ø0]¾c¶K7¢\åÅ”ŸÀ\èA»\Ô{1\Õ\ÙkÁ\èý/¼¹­=À\Âó·\ÓPSó3\ê\Õúðÿ\0UVÓ“Ié’»\æø\n?@\Æ?¨\î~M9†¤g)gl¸eð*1ý\ïÀch°D\ß\r\Þo‚³ŸO†R‡\ï~a\Ññ84ñ\Äxqo7H8\n´cQŽ\äRl\Å,*O+øZtd‡Œþ(/PA\ÅLJ÷W\ËC2Æ•WÌ£\Ã\Ù\Ùý‡\\\ÒÏ²i<­4kc~\Â\É\Z\àwbBY\ëD\0€<*4²K\Ì=`¥\ÎÝ‘œ8\ØÁ\Ê\ë«\ÖßŠ0T™ ory\ëž\å\0w=±—()Zt¡J·ô®û9}W«Hy\'£\ÒK-DCªhÝ­:\éÖ†ü\ã¥,tM~\ä-mQp\èï¥z˜©9\ß<òfñ\ÈZA\ZF\ã\ï\"\\½:’§%(\îÏ«\Õ=;d Ð·U(6PòEw[_\ãb\Ï8[\ß¯Z69\ÆJñ\î\ámc{7þ™.\Çb\Ñ\Æ\ÕM&÷²\Ïq\Ä9\äß«nV\ãI¡ŽJ\Ð\æd¨\ä—G\ßó§\í\Ít•\ä°ñOukuò=\àhp®¦\å\ç_i¾·\Ý\åvŸ_…‡Ë¢®³{7\ëQEGIÛ±47@\Ë\ê€.ƒ\Ð0MVªP²\Ïù\ß\ã«\åbõk*Q\Ö\Í_>eÿ\0ñw±X\ïQòŠ4b\ÈÏ¬ýû—_¿%Ë™š/™iTVŠúbÿ\0ûK‹|;ø­À3=‚l¯\Ý\Üi©ˆŒH‹V.\Ét´¤yu±nZ\îv 6\ä:Ê²‚F	mO5Ÿ—x\ÚIX3uw7\â­s,\êÓ\Õ.\Å\ê7}³\Ähó(p–.\ßB·‹$´)ÿ\0U\Û\Ã\íZ†3Ø­8 2€,\ïI>\ï®\Õ(#‡\Z\ró\Ý|y¶¼\Ø\Ó2<‘C–u¦\È)sp~\Ú\ãóu\'2dˆe–‘¶\Ý\ØVC­Á+Lh•¡Œ®!\ÍsˆñE\Òz\ÎIbN…¥…!xÿ\0§\'¨\å$„\nŽxU:SW‘Ž\'h÷)\ÈÓ±\Å²\Î5È´i-\ÌY°¿qRvPŸ&¬º’È„³³F®„A\Ü\Ùõ(\Ù\àKŽÒ´–\×V¢„\ê\ÇvN\Z\Õz\Î.“ý¹òÞ‰\Ù\Ûf²2%›t°¶i\éde%\ë±\Äh8;Â”ó3FR»hG„Z)¶y¥ˆ\ÉWG#Z\Öºó£{\Ú÷\Z]i\0°\çWa€\\ölw„\Ü\Ú÷™w\Òp\Æ\Ë<\åõ\ã›r4PF\Î6™P3s\Û!v9¾6(S\è\ÝõŸS[\á8\ìý7k­Ù¼¿\Ç%\×~Tö;(²¶f‡\Þl\Íi|„\n“vŠ†€Z(	q\ÖMp~ýþzŒ\Ðs]¬E–WKƒNËµ-\íÿ\0+‘.¶¾BDM\'iÙ¼AtQ\ÆJn\Ô×¿\È\Âyco\Î\Ê+â³–\î°nò<\Ê\ê)*W¥÷\'Ø³~ž/¨g.’Ò‹\ï?”yÀÁ£©MÌ³\Ç_*P\íy¾\ì’\î\Ï$¯\Å\î\'œ\áÕQs%GZ®sb\\XÚ—9üµ½›\r„ô!u¹ºÿ\0©ƒ\í\âöRfg±Y\æ@l€ü-\ïIy›\ë(\Îò’ò\0¼€Œ\Ónù7ù{7 9$r]\Çr©Ö”¶f˜»4‰óª\Ø\ÝS[‡1\éFxQ\Óú%Ž\Ñ\Å\Ç|}÷c\ÒcœNß¥\ïE¬Xé–›!\Ööó„\Ì\ï\Z\Øw\Å\ÙOõ\Ò2\×\Ã=\ë¸\ÒK-\ß\Õaû\ß”\íH—K/Ü‰[-\â£Û¬\í©\"vG+\á7\É.³8\Æ\ãB(\ë \Ô:¹VòŽ£\r|\n”øf¼]ü\îD\é+@}°\Î`s\Û\Ç\Ä\áy÷›\ÄD.HÖ‚I-k	u\íGj\"y+œc­NI=.³[³×°œo¬ò÷Y«$±Š|¤Î¾\ãh…\äg@@iv®\æš\×F+3l\ÝW(ºm»i’²Vñd3§?Á˜ð\ã?ˆkÀƒ\É=¥À7‰„”ù‘¶½\Þý\nN–\"¥M©%¦ö¼“õ\"f³\ÈñI\'š	º9˜\Ð\0Qó¸&D°rŸû•V\î\ä’m‚!\á×˜\é%>lž\âc‚£\ÝÜ½X:(Æ§¼\Ñ\è!YM–t\èGúŸrûˆ½­\ÔÁ\Ò\áú«¦\Îù[¡\Þ\×\äHºžG\Þý\Îv\Ò+¿ð`\Èv7­ù²\à‡z/¾!ûhý£U9\ê{!¹ \Ê\0@Dp³¼\æòG¬—^V \Å\äy¦!\ÞDž\Í\ÈL\Ö^ÀkÚ¹\É\Ù\\\ïBuP«,ƒ[\Ø:k\î\\]G¹3ÓŽ-gòFÇ£Z\ìœ\çy19Ë„\ë\Ê;¼Mtð´ÿ\0ªý…Gð`»(§wÝ‰ž¹\'Ì²<\\\ß\ÓnÍ§\äj•(ÿ\0°Ø¸\ãœ`­7¹‘J¼SWJ\Ýi/9_À¬«ÒŽžDÍ›€ñŒ^YMÍ–½n2\å,\\¢³ª»:^QV\ï9¼f\è¯/A\Óx3en7÷‘GXhôª\ÇVjð\Úk\ì¼\Úñ%b*<¯nö\Ä\åþ!ŒM\'.@­I\ÈUõ©\Ü·\ê[Y»õi\ã™\Ú4\ê\Ë;\å\Ï\Ñz”\îðŠ\Îcuœ6F’1¸EÆv8\ãJ\îiÎ¼$#7¶\×Q\çc\êNùi¬õ÷\æSd´\Ø.Õ¶y/] Uõ\0Ýº\×¬’Ž„¸c…=#\ÉQ­«J°µ¢\Ï\Æ\ÆA\Ä\ßx\nw7\Ï\éMu+“¡NZ\Åw#]Ö\ï}\ìWG\éyM\Ü\çT\çxÖ›q¨ó,\Õ04š¼U»2ûyžžVVM·~Ï‘1$/\"ðœŠ\ê{|\í©:z\Ã.)³Ð«…­}¾ô¾È‹¶Y\íaw0¡ó®”\çG„‘\åÖ§ˆ[\âýó \ím”wLê§¹nƒƒÑž]_š¾¤0{–„Œ\ÎLL¹MŠ\í2[Ew\Ä?m´j±\ÌöJ\0@~wœ\ÞHõ‚ r›\Ê\Ä\äy¥\Ï!\ÞDž\Í\ÈY/6öUh<Ä€¨\Õ\Ñ\ßÒ«­.[,:>0p¨{–IºK\êw÷\Èú\È\ÒQúb—atÐ–\áQ\æª\ÍR¢‚Ú>\Ù5\ãw\àR¤š\Þ\\lp\00m9Ï¸/>_«7³NW|)\ÇþS¿„LSw\Þ;–\Ô\Æ\n¹À|v\r¥G\è±zUšŠþ\æ\ç.\Ëä»‘\Î4\å7h«e¶’*A\ã?>†\ê\é\Çr\éò(\Ã4¶š\ß=\ÝQ\Ñyò;F†vo±zû\\\ÈM#¤U.\'!¬ü\î•Y\êTswnü\ß\Ù…\Z*:/~ý²¹¦mœP55’\íM?¦Ó¨lq\Ëv\'¥t£M\Íòó÷ø\ÞMjª\Ëß½\Ýú#™i9KžIÎ¿°½\ê*\Èù\Ú\í·v6¦¡w9\ØQƒ4EdMh›5\\7.u\ã\Þønó»\ÜL\Î\æ—QÆ‘\Æ\Ûò\Ã&ó’¢\n\ìÝ©\Ú_J\Íúv•\éZ÷¶IÃ¸ ]F0\âp­Ê´Ì«Jœ$óG\ÍÔ¥)S•{\ì\ç’[\Û\Ñ%Ç‰ht­4x¡ß‡Ÿ%UN;>¬jÁ\Új\Ý~\ì6{Îµu\Ä\\¥d¾‰\ïˆ~\Ú/h\Õb‡²P\0@CpÃ¼¦òG¬\Ô@ä·•ˆ\Èò?JžK¼‰=›”•KÜžHPI\Ðt¥¯‰6Š\ê\å\ç`œ12“$¢¸¯Wö>\Óž\"”fÞ«\Çy`²\éKš\éû\Ôþ*ö±r~û{¬mý^‹¼ž°:\Ó?sòmñˆ«¾\ër5\æZ\ã³M(¯}f*\ëC\ê\é>\Z.×¯uº\É¶15|‡\n’\\\âvW\Ü\Ú’½jp\æûû\ß\Ùb\ëb2YG¹{\æÈ«}¹\Å\×s~WFL\Üi›¾¨\é:—•^¤›\é÷p6Q¢’ºÓ¯^á©\Â\Î\Ò\çUò¸\Ð\rwŽ£˜\r‹89²eQl\å¦\åÄ¤\é\É\ÈÂµuo8\ê/&\ëiõC†V\'ø\ËÖ¡ï‡¿¸+\É\Þ\Ûþú.\Äü\"ø”ÉR\Óæ¡§š‹Ó‚<šº.~\í`9tB\èFñÕ™•!¶Œn\Ñe±7‹Œ¼\ær\Û\ÑûÖ¸7ws\êðñT(\í1­¹¥\Îp@\rùKCõZW\Å`§Md¬¬x•Û­S\å\ß%Ò›\ÝH¯\Ú-!´’”\0R\ÎÃ˜i\ÎW\Ê5+:ª)UküýO›\Ü!g\Ñ\ÒH\×=\îº1¥q¼\í”×¼¨i3„0õj\ÅÉ»u\ï~õd$ñ–¸´‹¤f‘\äTƒŒœZ³Cy™¦Jhžø‡\í¢öRr=”€†}\ã7’=f¢!.V \Å\äy\0\ÇIK¼‰=›”r\é{“\Ì=!@,\\•ò<Ùšqu\\Ê2¡S¸W ¥Ý¬¢ø:ö©T\ÓU÷^ùOE\è(¢\åHo»ý£ót\á¹g©(\ÓW“=zøÚ•:0\Éxþ		´³‰1Y\Ú€«h\Ø\Û\ã=\Ù4~\è°:µ+ta’÷¼\Í$b¾eg–\í\í¾	o~\îD:\ÒK®\ÂK\Þ\ì\ÙmŸ[2°Õ©ti\æøúv\ê+-\Ñÿ\0\Ù\ï|´C\è\ìì³·/Ò¤\ê`ýþöc\Ù\Î\Û\Ìò¨\ë;þ\ß2µi´\ßùg¡\ÍwµœŸ\Ëp4o”5;\rð†\ÏG¿¯rõü\\\ï\Ò\îû¿O\ÉK\Ò\ÓTÒ„€C|S ¹Ë±c\Î\â½\ZQ³÷»7\ÞüŒ­7÷\Ù[®}®\È\Ýõ²aˆ\é§6C\ÍE²BI¤¹÷h¼\0Œ—B‰fJh¨/;œ\ÑVn\Èö¾GndÕ®\Óp^h©a¹s½)\ÓXh5\ç-\n°[\ÏO\â8„£\rt]…Ÿr#\\\Ö\Æ\Â\×r…\ê\Ê»-k\Å\×[Zqq\ÖpV<­˜Ó†Ì³Iô¿º\\:“ú¸¼…\ìvó\ÇO\\N\r\Öwn÷#i#­<ªK\æ\Õß»ß´H¼E94š6\0¡+\êm—¯‘\r\Â;mm\âÿ\0•žX\íÜ¬y?\Â\ÓQ\Úo§¿óÌª\ÈqV>nn\ì–\Ñ=ñ\ÛE\í\Z…e \0€„\á¯x\Ï\äY¨\ÇK•ˆ5¼€/ \Û\ÎÈ“Ù¹@9Œ½\É\æ ‘;©ñH\Ù#4sÓ¼!hM\ÂJKTvm¦ÿ\0ŒƒŽ¾ ˆQ²\Z‚þ2•1\ÆÝ»	\ÔW™<=¤\åU\ä}ž\nµ:´\ã*kjov\åþO€µ\çKv£¸\Âo6\Z\â\ê\Î\í{i\éX\ëb%Wý:j\Ñ5½š-Ôœ¶¥Ç‡(­ÈŸ‚\Ì\Û3h\Þ\\\ÎÂ¿¼€ýVz‰Qè¯«\Ëòy\Îr\ÄKi\åW-Ò‹C\Ýï‹•h~A\çT`\ì8ý\ÐN°­Jk{\Ó\×\Þòföž\ÂË%\ê÷šr\Óx\Ñøq\ãe%š<Y5TTmlZ¨\ÆÙ­\Ù.·¿³\ìq›R\É\é¿üV\î\Ý;J•®W\Ò\î\é\×\çw9Áƒ®klW·%\êZW[×¥Q÷Z>6·Yim\Ñõ~E7{žn.3Šþ\ß@þö•Ô¤~¢É¡\á-euœ\\«¬\ÃN\å\ÎY»S€‚£A\ÔbRL	\ã ki\Ö\ÖoMO\î­:üfò²<\í­¹:­ÛƒÞ—ò“½»ÿ\0h½ŠÅ”’7U\"‹`\ÔO\ïÏ“\éGzX}¦§%o\é\ÏßŽ’W3.#\É\îZ6€Qm\ì\Öòõ#\í\ZDš²\Î8\ë<\Û6*Ls\Ä7Ð¢»}ý‡:‚\Ò\ÌC®“õŽ]z+Ð¥&ô9\Çtª¼ý÷¾ðqöM\ÃÜ½¢F\Ç7QÀôQZ\Ö>cN1ªö>— \ßD÷\Ä?m´jOe \0€ƒ\á¿xO\ä]¨\ÆK•ˆ5.@bò¥°\ç\äI\ìÜ “›IÜža\é\n\0\Õ\' ´»\ì\Ò_hdA\æp\Þ5.\èF´vY»žwZ=WwMl²\Åel\Ð\ÉÆ™hx\Ï	\Ï8P·S\Â\æ¯:ó\ê\Ê8e³y¿~ˆ÷!)c¥uôûö\Ù¦­ò ŽŽµLn‘_›\Æ\íua\Êq\Ù\Îh\áösžº·ö\ëgj•#\Þ?JÓ›\ãÔ†\Ò\Ã\Z,\àÞŠ\Æ\Úý×“ƒO–\áJjkh¢\í½®\Å\ï‘U–\Îùfýù•tŽ”^q\å\Ú\ßxîŽ\äa¨9õw3FÅ²)CþŸ7øÈ¥|\é$¿sÿ\0\Åi\Þó!eu÷\È\á‘sco3qô­	l\Å\'\Öt¿Í©RkF\ãÔ³û!–‘”€zOÁu \ï˜>\'œK¼Ù›,E\Ï\0k!vl®\Z“©QEoeŽ\Ô@m\ÍT\åcNN±]Wˆ5:š\Ó\ãU’¹\ïcd¤\Õý1\×ßŸ$ø ²YKˆ{\Æö´\à6q\Z°\0¨\0šuŠToÓ–š¥ÿ\0\'ö[•‡³N\Øó«œuú|Q\ç\æR•Ž•kF=~?ƒ{„µ[\ä\ÍZš\å)7¡Ž£º½We\Ãß¾²\Ñb\ÐV+(¬®<x\"„w¥Z\ÉjL>lÕ©FË‹÷$9´\é¹¤M7nG¥\Çª#“:\ÃÞ£\Ú~\Å‡	 \ã/^|n©4ð]ƒ±×Þ¥E$Þ¦?á¶°\êi}/Á\å\èU´O|Cö\Ñ{F«Ÿ\"{)\0 ;\Â$z\íD*\\¬A¡r\r­\'?\"Ofô$\çRw\'˜zB¨\Z 2’kƒZr{$‚H®+\É~-©¼§\rEs•8\Ë7©³\rˆ©J\ê/¢õ\\}\×ô\Ì\rŠKEþ2\Õ+‹.c~6«SžH\Ä{ˆ^~\"”¾\ÜOVšŽo%’ò\ì\â\Åô\ÜN<ViùI]~\Òá¨‘Wã±‘\à7¸.\ÒW¨ôZ}¼EV\Ü/¾y.­\ï\ìB[§kŒÖ†\àÆ·‹‡s\0¸\ÊtU\Ý+²‹[4÷¼ÙªŠT\éJ¯+.[½H}\ïC÷Ž\íµyZýÅ¾F\ê’{\ï7ÿ\0S\ËÀc¥~}û®öƒ\ï]p\ßB\í<¯‹;\ãjr\Ùò¿\Ü ¢¥\éƒ€\ç?¢\î\Í_.2­\Ã%\Ö\É[<å¾”ã€®¢6`(7\r@(\Ô\ÝJ’Kn}}|ú¸vnQ$\ì6+E£\æuž\Ï\äŽzŸýó+%ÀU®\ÞK/7Ô¾\äÕ‡DX\ìü§¨~\ÓÉŒs\Ý)\Éjs*NŒ¿‹n˜q.\roŠ\Ê5½$\ç\çG3¼0ô\á\Ò\ß\ÅûÈƒµ\éø#ð\Ú\ìO[°\êU\ÌT\ÅQ§õHƒ¶p²?¥\Çkª}4M‹\êa©ñŠQúW¿Ý§å™®`—(?@¦\Éu‰T¯¬Ÿ½\Ã=\ßý´^Ñª\ÇÏž\Ë@Ã¿\åóù#\×j q\åb\r\Z\Þ@!1\Äù{7 9\ì\É\æªH\Ù³J…Î  \ê¦÷!H_#\\\Ç¹¤¹¤‚È‚1CI«2\ÉTzú?„S0\Ì\é\ÆI4f>4š9Î«\Èz2Yç‡‹µ²I\ÞÇ¡OV\é\Ô\Î\Ê\Ü2Ò–øŸfd0œKú‚(M\Z\ÝÆ®K:SU\\\å\ØzXœT*\Ñùtž¶Yó\Ë\Èuf`¼i À,õ¥hŸK…‚ù\ÇEd»^·:³H~½:°[h+B=G\Çcåµ‹ªÿ\0º\Ý\Ù£O\Ò\ë­`\Í\Ï!¬.9’N`e@	\Ã*.\ÖlöiAS„b÷n\æõoË©p& fn¾\ÔýT\æ w4`y\Þ\ãÌ©*Ô¡¬—x•X\É\ÞR¿ø¦üt^ó\Ï>‘—¸²ºƒ+\îh™Œ­:\0\\eŽ£\ÆýH§\êvÛ§nri}\Û\ï\Z?ƒúZN\éÁžCO[\îúW\'‚\Ò-õûg7Z¼õ©õf5›f–W|¦7\Ì—\'ñnK\Åúƒ…O÷+Iõd6<‰™°w¸ù…¯\ëj=þ\ÕO\áxE¤o\Ö\ß\ÚÆŽ\Ñor\Æ7™‚½j>|ž­÷\Ö”~ˆEv!¦\È|o@]¡;œªa\Þö@\èÁKTCdñŽ©ô\Ñð³[2kƒg²P¨ ?—\Ú<‘\ëµ\ÃK•ˆ4.@bò?rOdô$ I\ÜôHUdB…£rƒ´d…Ú \îê…®j\é\Ä9XÕ“¸dH\æ\ÃÐŽ)êˆ…i\Åô[]Yt[\Ç\ÂüEö¹\ÕÆ¼ Mkš¬\ãÑ²4a\ï*¹\çûnv¾&\Ð\Ðd±˜/°–º)aŒŠ°Ð†\È^—œE5€¼:8\Å;F®¼xžZI´\Ûy\ï»zò¿—sc\ÙVˆYk±–š8±\ÄS®%z1þ†»UŽ\Ã\Æ\ÛR½¸®’\íÑ®\Ü\É;/d\Ûƒ\æŽbª²U—\í\ÂS—\ÓQv\å\çe\â?ÿ\0\íVwŽK\ØkµÀzÀ,““\ß/C\\~Q{¿“[tra¦\Ð\ZGXŽ»´p\Öý\Þdª\ØÓªœ\íâ¬ z0¦\Öÿ\0*\Ó09S©uŒv\ìE\Ú\ä­0‰–¤ºŠÖŽ?\ê¢ÿ\0ô3Ú…\é-€¨\ï9>o\ÌöJ\0€¯ðûùu£\È»P(•b\r	@j\\€MÇ•÷döOP\nûž\é\n	 7hBñƒ¹A\ÑS\Ú\ÐË¡s(ZT¥I«™o\ê¼w®\Ór0\æÇ¡<×ˆš“žñ\æ•£iªÍ˜O÷NÑ£\íÅ’\Æã•¢¥\ÙË¸\ÛøóƒŽª©|jy\Ê+X\É÷<×™\îl©A®\r¯O²\ÞJ\ém\r¥€=—9ÇŠÖ¢7œü!\Õcˆ84\Þ*øl[YKw¾\î{ºŒÑ¼%tö_{\×\î=W5cšð‡‚/„:VVHZh\éX\Òñg‡8\Îñ‡2ö©b[\ËÁý™3)=š\ÑØ“\ÒQú_>}k¹“Ù‹MAðšs\êýV½¸\Ë)#„°õ¨ô©»®1~þ\æð\é)[Ü¸ó\äz\Å\n‡B˜üB²É»õ¯\àuÿ\0\Ï\Ú)BòFú;\ÖTý4Vˆ\ë‰M	»N;\ÂcO[O\ï¡>IþU\ïŠ~û†\Ói6h\æô\ÕYSg\n˜ø5{45\Ññ\ÛE\í\Z´4{-\0 {²ò\ëG=v¢%XƒBP\Z\Õ <¯»\'²z€QŸ\ÜôHPH\Ü ‚2\çŒ\Ü@ÀTgPDu§)(­^D½£G>7›\Ý\r£r¤ð\Ó\ÃK¥\Ûø’0\æ\í¹>\îuRó‚œy=A§¥ªLk­{ñ6\è÷.¬Ÿ/³#2““VvhŸžg”\ßJ¤x?÷‘Ô…]£,“6…\ÑÇŽº<¹­?VŽ5\Ü\Î\â-l\âô’O\íüõ\êJT_zJÿ\0÷(–-¤#EMZúQ\Ö\î\à¸\ê½K¤\ê{+­yøŠr„¶£ªöýW\'bµ \Ú\ÚY5ö\Õu\Çw»\í1›ÁÁ\æ9%“\riýCrp\ß\Ò5®´+¦®´Þ¸s^ŸÁ\Ê\rl¸\Ûj:¸ÿ\0\ÊwWc)škƒO#„ Xí™˜¡?ÖP®\ÌóÀš¯Rž)\Æ)¾”x\ïE]SÌ£+Çò_#Ÿi+;¢yŽ\ÑŠA\ÔyŠô©\ÍI^\è\ÍU\ÆN\ÕV\Ë\ã¹õ?}c\'\Ôoý\í]Ô®eœy€x:ú\n±E$\Äm´\r\Ë€K«»@WD÷\Ä?m´j“\Ï=˜€»\Ùùm£\È»P•b\r	@b¨\rZy_vOdõ\0£¿¹\è ‘\0 ”XtcÁ\Í.ÁÀŒCvMTž÷\Â\ãIE\Ý&Þ©ð\äOQ¥¡¯7£É’xQýWý]\ê¾Lö8\Ê“¼7=ñ\å.\\\Èm!b0»”>M\ÚÆ£©\Ã÷Š3È«E\áe³?¡\ï\á\ÏÞ«¸´\ÄA®±<&aAžµ6÷¯\Å¹½^\ãŸ\ÅIÁ\Ç/z	\Ê5þ\ê3CN#ó\Ñùmô¨–‡l.Ubu^–É¢­»úol‡\ÉsnºŸuŽ_9ñdáŠ§5¾\ë\înžu(ÿ\0t\\{wx´2\àý°±ÏŠLix<&]­\Þ×€ö\ï\'Rš\ÐRŠ’÷½xdÍ’»žYmf¹Idû÷õ²õbœ\È\×5\Ô{\Øñªh.JÝ¦„y¶Šx\ÓN”\ÓY\'\à÷¯O\ä\ÃR\nRY\'§ö\Ë|z½ñ\é+4rGrlbð&ð\à:ª|Mú·ŒµÒ«$ö¡®õ\Çó\ç×¯ZnJ{Tòžõº]\\ùo\ëÖ­§›OôúI¼cpZ@«©\à\Þ>\ë	\Éz4$§Ó \ì÷£¢Tj\Æ\ÖV{·_–øÈ£ižK*#\ÆFqc‡¿Ó¹zTqQžSÉžv\'\á•i§:(\ï‹ú—fþ\Ìù|oþ–\Ã\Çù‰ˆZ$®‘ž´®\ìH\èžø‡\í£öRq=˜€»\Ùùm§\È»Q€’¬A¡(U«/\î\Éìž€¥;¹\èªH¦Œ…ÿ\0(y<ô\ÇR¥G+tMXHÓ•Oõ4$å°¹¼¨\Íð1¨\î‡8ø.Q¬´–G¡<,¡Ó¦\î—\rWa!£t€8²¯‚\í\ÎõÕ«£\ÐÁã”žnÏŽ\ç\ÊK\îJ°¶†7·“J–fZ<f	œ\Ù\"w\Ôõ6c(ºrYN¶\ç¾=Y¢\n\ßb1\Òj\Ç|\Óõ\nø\ì?®\ÚI\âÕ ðòT\äú/\é—ü_\'\á¯0ttÂQ\Ö\n¥==\ïCw·÷û\è\êRf”rkß½\r\ì\å\åHP\É\Ã\å8G±,¡\Æ\Ñð\áv\ØñA\Ôò¼F\Ô\ã>\r{ð=YJ\Ô)\Í~\Ùyÿ\0{¡”H1tn¼~°\'#z@\ä­FÓ·<¾\ë\ß#\×\ÅÇ¢\åÖ’û¯|KEHÝ’WF8È±tgh&›	¦Ac«EI8\Ë~O“\ã\ï\îCŒ*\Ç?¦zò{Ÿožº–‡L\×1¶˜1ŽN\é¾+¼&žŸŽEyQÚ„)\ê¼y˜#¤\è\Ôú–Š\ÜG[\àˆ\Ä[#oÙj\0«\ìõ\Í\ÍUÍº³e*’Ú¼]¥\çù\æwI\ÎVýüôŸ\'\Â\\ý\åLØ§°;$\âóH\å5\Íñ\Ö2\Ç1¯Q>\Õ\n´ñ+<¤‹F´\éG\æF\î+Tþ¨ò|¹•½4l\Ïg\ÞK\ÉÀ\Éß´o\Íl ª\Â[/4cø£ÁV£ó–Sñ}|W=wr+Ž[”z’\Ú\'¾aûhý£PƒÙˆ\0 +‘?–\Ú|\ëµ\ç\âUˆ5%Š 1\å&Odô$¦;¹\èª\"cnŠ‚\ÑðU¹®Ž\ÏI>±xd‘˜±\ÕgÁD£ju„ªS\Î\ã±jŽN\ì]Œ\ßù7_¥rØ”>8\Z>}:¯¦­.+\î·ù¬ö§0\0þS+ƒÁ§hvq»qÀ\ïWSŒŸ\ï¼\ÛK:I)\ç\Ín|Ÿ\í|žO™\"\×4µ\ÔsÕ‰Ê£À˜œ±Á[“=-¨UƒŒ³O³ÿ\0Ì¿ñoG|ˆ{]°Ð’\à{‡kp	\Z¤oœs!\æT£*ofYð|m¹ÿ\0rñYj\Æfkýþþ*\ÆZ‘\Þ%fÁ\íò‡¥ò’\ë/]‹-—-ñŠ\à\çH\Ã÷š\êyÀ^GÆ©\í\áe\Ê\Ï\Äô ö°\Ó\\üGœ/€2\Ñ \ÕxŸº\îI÷ƒ\'*K\Þhú\n-O	=\Ù>§“÷È\àå´†˜‰\å\Â\ë\Ìò	Ë˜G3‚Ùˆ‚vš\Ñù˜ðfS\Ã\Ïw—\áý‹O4\Ël\Ó?<ù\×ún\Ê÷FG\êó/3†uaµª:s\å\é\Ì\íŒ\ÃÊ¬6—\×ù\ÝÏ¬ž´A)V4Î \äF\ÑE‚\æE5\ï‘\Â5\é¦Ci\Ö\Ç.“Y\\G@1=\Ù>\Z\ê\'Á\ç\ÕZn\Ã7Z[+)­üy?Qú‡N[Sv’\ß\Åpg·K{‹Fš\Z±Ë©}E8\ÉE&|\æ.µ)\ÔsK]\ËD1\ÕvGŸ7|\ÉM\ß0ý´~ÑªJ\Ì@[\ìü²\Ó\ä]¨>¬A¡(¨\ËLž\É\ê	)Ç¹\êô…\0\ËL‰\n­&wŒ­£°\æ;GŒ\Ð\í\ã’z\×7\éf˜\×_¾)ø1[±¿\'~°ÿ\0Qµ8êŽ¶£SGn¿Tl\ÖK-5ˆ8z1G(O&:ÔºPbö[x\Ä9Rœ“º\î4\æ”\ÚKšñ:\ÑÅ¨¾Ã»;v]i(\'k›G\n´\ê­r\Ö®[EHß²i\èzª¬*\Æ\Ò\Ñû\Éò\Ýkµ\Åý*>\Õg#x9½Zü\Ú\Æj\Òk\\ùñ÷¿½dòŽŽ\ãÒ¤óš´‰n\r[x«C$­.J\×t\Ôù–l]?™JQ\âšð5\á%}¸ñ/7¡˜;\ÆON\áÖ¾{\áùB\Ü3>—òö.ÿ\0\ÉIšs¬—\î¿x\Èù±û«ÙŒT\â\á\Üy8\É:aˆ\ã.ÌŸ†}…‘¤=¥µ\Ïw\ê+Œ÷¶kwŠ$b\áLl²˜\í.-š\Ï\Þô™YZ]Mš‰À>I`g*\ÛT\×F_W\'Ç´òñSŽ®Þ±ž©k~+\ïüûO\éy­O¬†\ë%‘ƒ\Ému\ï;ý\Ý\Ãa\é\ÐVŽo{\â|\î*¥LD¶ªd·\" ´-Y™R5sUŠ¸\äHhŽø‡\í£öRp=š€µ\Ùùe§\È»Py%XƒZ \n 3\å&OdôCÁ\è\åR\ËS@\Ý\ê¨Š6ª­Wk¶´t\Z(q{™\Ñ5½G+FN{zˆ÷.n2Þ“;B¤V¯Ab\à\ì\Ü\ÇsÕ§\Î)\çT\Î;šñ;m)\ä\Ü_^O\Å[\Ä\Ú(^1ŽðÝƒÁÿ\0zÕ¾l_\Õ\è#Jk:w^+\Â\ãˆ\íG¹{i¶˜ˆ]S¹¦‡ô\Ô]\Ùÿ\0[\\t£†#j¹Ê¼r\ÐF\ÌþQ\éQ3–\ZV›/ZV\×\ÇD\Ç\ë-\é >\åó\Ôiüº®<\ì}•ÞŽ\Ò\àŸÜ¯iW2é«€¨\ë\ÙûÚ½\n*WVZd`ø«¤\á5&–\ÒR]|;~\ã4ÜŒŒ1ƒ€q\Ç\rXn÷¢XX\ÊNO¸ñ©üV­:§š\Ê\ï†\ånD|Ö‰Kœ\âIÌœÖ…\ÅY#ÏJ³w“\ÌD‚­tri˜¢‹•°¥È²hžù‡\í£öV3ž\Í@Z\ì“ü®\Ó\ä]¨:’¬AŠ \n 3\å&OfôPe\ÑðU/\rA©sº¸«ZUnuQfáŸ¼\\¾Ç¼ƒF\Ñ\×ð\n·\å\àYB<|\íkv\×\Ïÿ\0ûþK¨Ã¾\ã$0g\èjZl¤¿„9³²G\Ð0<\×Ôš`{¬µ¹\ÉF9»G+(¦ýð%™ ˆ‚i\æujCi\ÊyÁŒ½‘%\ÇV@e\Åb¯QS†¯òƒŒ$\åÜ½H\×\èsKñÀ\Ó`8\åž¾}Kº\Ä-%‘oÑ´¶\é;¯~{•\Æ\ï´KN,\Èñw‡’F\â(Zº¥M½¤–{\Êþª»_/\æI[+i\ádû\Æ\Æ¿ª¾©+®fo—\Í÷z\\M\Ñýa\ÓQ\éQ~E?»\í\æjb:ˆ=)~E>\\·3BÂ¦\å$\rR\å\Zf	Sr·$4O|\Ãö\ÑûF¡\Äöj\0@\n\Ïd¿\åv¯ z\í@yÌ•bU\0Uµ˜ü òdöOP\n³r\èø(/\rLŽu„fðÚ„\í.&o·b´¸\nF\\H\rn\',1<\Ã3Ô¡´³e\ã¶òK\ßß¸tl´ù\é.ŸrŸ\Ípe÷‹W/›¥_ž‹¿\Ò\çiR\ÙÊ¤³á¿»\×d—\Ñ\Ú$`K8 MpL\í\Íe.´ô8…’¦#rw\ê\É.\Ý_‚7\ÒÀJ\ÊS[uó“\ê[»n\Ë&ˆ\Ñücƒci\ru/:·Ÿ ­9RV®`n\Ô0{0Ö«²³\×Áv{|w\'w$º4U¸½[\í\ß\ä´W\Õg²œÍ†lQ\Ó>2Jx\ÔäŽ€»ü.›jU^ü½~\Ç,OG\êv]K?nâ·¡-?$‰\Ép8‚\ÇF°	}ñ\â­5£iõùûò\ætÁ\Ô{*\Ý_‡\Éä¿‚NÕ£\Ù3p`‘¹\\&’3\n\Ò)6\Ó\ÇT\Ü\Ó!\Ê2q\Í;yv®\ÖkMZ1­¨\í[X¿ª?\âõ·\'ø d\Ð\Ï º\Ì\ã+[\ÝFE\Ùc\ÚÙ´-Q\Ä\Û*Š\Ü÷>\Ó\Íý;jôe´¿¥\ëÝ¿Á‘\í´j5f¾§`´œ£U7g“\îðywƒN¦“°Š\ßB(\Â\\Z³÷\Ø\"øG\ÖØ2›œ%I-\Í	lr“‹\\›˜P£Œ‡\Ú\'¾aûhý£P\Ì{5\0 c²gò«W=v <\âJ±*€*€\Þ\Ê~Py2{\'¨\\e\Ð=\Ê\ÇS¥ª-‹Áfs²¹4s¸\à¹\ÊqŽ¦š8i\ÕúU\×{\ÈX™™¼v3\ÒóŸ@U¼å¢·_§©\ßgK\ê–\Ó\á—l\ß\ÙvŽ¬\Âi0`0\çtH\Þky\Ý&‹Œ\åNË¤ùû²5\á\è\â1A(G–ÿ\0ù>\×bF\ÃQ\ZDž)\î<–\re\Î\Õ\ÌzŽu3žKr\Þû\rÔ¿O…¼p\éJKY=#Û§b&´e\Ët\\\Ù*\È3‹‰þÍ‘¹¸\æ\à)­f«Wc%ª\í\Ùÿ\0\Úow$ª:\Û\Þ\Ë\Õ\è\å\Ép‹\ËV\ìú/¬†gcAV’.\ÞÃ»»\à‹´\ro‚Ë£\Âu|\Ét\åožo{¿\"ò‹º‚\Õørõ\çÔŽ;\Ãm fµ=\Ä\ëýþ÷/©£O\å\ÓP\à¼wœ¾*Òš¦´Š°\ÏAZ.œEAn-ñ€9£yix\ÈT\ÄCj9{ö\í\ØfÁ\ÎËŽWë¶«µ].dô:7‚\æ\Ðbh\Ùc<¦T\ê¡\Þªr½\\\ßRRY}žÿ\0{\×a\êt¾¸>’ñ[»ø\îwÜ\å&³Ciketo\ë-\Æñ‡hX\Ê÷Ÿi(·¯\Æ;Ÿ8ú	Ò†-mÃ£?¿¸ò\î\àDiV€þ\'JCqç¸µD;¡´€(ñ¼\0F¶œ\×Jw¶\Ö\å¾/\Þ^ó0Î¢o\å\â£~k\ê\ïýÝ«°‡\Ò:h›~\'6hOrör\ÝMGv{‚\ÑO=™dù”ž¢†\Ý	mÃ†õ\Ù\èÈ/8óˆZL\n§gŠõ2Ms\Þ–\ï®}F¢šŠJ/F;\Ñ]ó\ÛG\í\Z¤\Æõ=š„\0@Vû#À\ç\è»Xnb\î†\ã\æi@y¥¨V \ÍPP\nY2°B\âZx½¥£\Î\êt +qD\ÓÜ¨ô:S¶Ò»·1p\æ7&\Þ;]—CW=™\ËWn¯Sz­BLvŸi\Ý\êa\Ï{\Ï)\Ýd\09‚•ÁtQYWwi\Ív»%Ô¿\Ë<7”\ç‚yÁ\ê<\åVY$z4!ƒ¤¶\ç4\ßZð^úÅ…¢ýAxŽ1ž<§tgû\éUùN\Ú\ïÁž9Wº\ÛP‡^o\ï\ïMä†‹6b\Þ2w0D\Ãòv[\í¿3ëƒ¥Ç’\Ê\í\ç\ËÂº¬ž\Ì\Úz\Ê\Î\Ér\ægU©TVmFš\Ò7W“\ç\î\Û\ß\ï¢\íVk=¾\Íy\×L\âó€ P\ÇgŒ†ÓŠ®Ÿ}q<%Gd\×‹¿6òÕšV*œ^©õ8ø&ô[¸¼÷“Zs„V	c4…œ“ ¹\Üø1§™u\Â\àš¨›\Ñg£^h¶J56Ý²þ\èý\Ù\É\íZ>\Ê÷—!8üÍ¯]Oö·¯n\Ìò1¿™QË0²\èû+H\ÒÕ¦£\ämYƒQý%ÕŠ\Ð\Ä\ì4\Ö\âa\ÑØ‹\ZE¾b«G\"\ÑÊ…\ÆóC)\Ì5\Zð\0\ÖH\Òq“¾’\äõ\ß\ÕsÓ†:Y~\Þqú^v\×7»±\ê\Â[t06L3’.\Í\r$h–!A\Ð\Û\\ds\Z\ÖT\è\ç\É\ÛG\èÉž&š“©—µ\×c\Õn{\×i tÅŒ°E,Œš\Ë\'r\×8q\Ð;a½A©\Þü]\ÍR©\'{l\Ío\Ü\Ío…\ÄGf¤–z6\íÿ\0wÏ¿‰]\Ò1‹\ïØ­q\Ë³h{\ï&H¼1õ€¨Ü»E|õ³V\r5¿Ñž\\ª~š{T\ê\'\Ô\Ó\ï[ú\Öf¼eŽ\Õó”³Ë¶¿&\îgø<\Î\èUÙ¯G\é\é/}F¿\Ô\á1yW´eýIýýH;u‡‹<™ñµ®i=@\ã\ÑU®G-S]‡›ˆ¡\ZNð©.M_»\Ò\ãluŠ®¦o˜·\æHp~\Î\ém–x\Ù\Ý:xÀ\×\áŒ}\èg=’€W°8\à\"„ˆ9‚€\â*\ìCjd®~-’\'DNpk\ÙõAv\êX\Ô\Ü\Þ\×\Zk\ègñ!ÿ\0È„k5ô3øÿ\0\ä@j\î\ÆúkU\âHj?\î!!h\ìW¥f%ÿ\0Â˜¤&¯ñ\Üu¹¥¯%„œKhEr#!\0G´\îšþ\ÌŒ\Ä\ÚsMf/\Æb\0\í9¦¿³\ã1Ž\Ó\Úkûþ3\í=¦¿±\ãGñ@cµ›ú;?\Z?Š\0\í?¦¿°\ÏÆ\â€;Oé¯£³ñ£ø \Óúo\è\ìühþ(´þšú;?\Z?Š±›ú;?\Z?Š=¨4\ß\Ñ\Ùø\ÑüPj\r7ôv~4;Pi¿£³ñ£ø \Ô:o\è\ìühþ(³±š&ŸÃ°o3G\î(—\ØË±Oð2‹U±\í’v“cjY\"…\Õ=Ó©Q¹\Ô\Ð\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@ÿ\Ù','download (2).jpg','image/jpeg',3),(4,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z%!1\"%)+...383-7(-.+\n\n\n\r\Z-+--+-++---+-++----+--+-++++-----8+--+++----+-++--7ÿÀ\0\0\á\0\á\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0P\0	\n\0\0\0\0!12AQq\"RTar‘±\Ñð35t“¡²³Á#4s’”\Â\Ò\ÓBb\á\ãU‚$%Ccƒ¢ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0#\0\0\0\0\0\0\0\0\01!\"AQ2R#ÿ\Ú\0\0\0?\0\î \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0½hŠº\â\"cTMkB½»\æô¡\å[©t\"L\Ä|y‡«žõUUU±8“CS&„\"BV;%jN‡­vöo›Ò‡Ïœ3~Þ”<›µ X4=eó†o\ÛÒƒ\çß·¥&\í(Q­W&4ET×˜hz\×\çß·¥\Î¿oJ:¹÷$\Â9\íVØ´Uz­UW™x‰+zñt\Âû\ËúK\Î,\ìÜˆ\Û×¿8fù½(6öo›Ò‡\Öö\â\é‡\Ò\ï\Ò[[ú:W°ŸC“ðòbm\í\ß7¥\Þ\ÝózPñ¯ÿ\0’\ï\éõö!\ÜG®%gJöG?\Ã\Ê=·³|Þ”{w\Í\éCÇ¾D\ÒÎ•\ì>6÷\â.vt¯`ô9?(ö\Þ\ÝózPû¶·|(y/j%+Xx«J­}’\ì+ØŠ©_£\é_ZPŸC“ü›\\\í­\ß\'J\rµ»\ä\éCË·;c©¸\Þ- ó«\Ó×€fY°õ\Ð\ßJ§þHŸE.v—¢v\Öï“¥\nš\ä\\J‹¨ó\Âl=?¿•ûñh\Ä\Ý{;q¢\Â~\Ú\ÖDz9\Ð\Ý\îT]­[„×¢µµM\ÓlTTZ•\Ðôð\"\\‰ÍºØ¶\Èl}4aµñ%\0\0\0\0\0\01q.¥*(Œ»•Ô½@ye¿D\îOa\n\ä&\éÚ»¢6­¢\âT¡bZWUkŒ²\0bwÅ¿R—\Ë3‰ôn\Ô@•z¤7òÓ©\ÜEï§‹¾ƒyP0¡Ä¦4~,ôÁKL\ã\áSÿ\0óžŸÿ\0œRö€ò\Â\ã%Å†„W¥š\rÔ¨3Ph¼E0V„ç¶¨Dt:\ã\ï´&\ÂuO°ÙºD\ÒAdJ*h\'\Ãv\'&e-(’¢\Ó2õ“®uµn˜M_\æ¦?QZM—vCó5Q5V\Åõºi#°Ü¦\Â\Ú\Ú\è)¹rU4\êU\â&š\Õ\è\ÅV\áAU³)‰¡\Z!²žNsY6E³ÇŒ“\äLõÀ:\é\Èöwñ’|‰Ž¸*+¬\Þw\Ô$ü\Ú»i˜0×™\äù?5\îšfL\Ð\0\0\0\0\0\0\ã¥Z\ä\â^¢\ánew\ä¯PP‡‰5!öµ\ÄT\ÆØš¶‰G9Cÿ\0D©d>‚¡@)-M\ä;Qtµ7\í@d/:©\r\ê˜ðÿ\0*g6†½–Ø½f³y\Ô\Ú\ârùòR\Ä3˜6÷\ç\ì;øo\Â\"¾LB¡4:™,,$\ÔCŠ–ñ8ä¥ˆŒf23\Ð\È\Ãi;h¦¬\ê\Ú^•}7+ŸJ b\"\ØWZ¤¬¼%«u$[„ŽjüR¹=óXd$[j§96\Â:À‰U‡\á4gD°Û6ö-„ˆ¸Úªžº¥¦\âÅª\"žo/ölúr=üdŸ\"g®\×G³ÇŒ’\äLõÀ1ª\×X¼\Ï\'\Éù´t\Ó2a¯3\Éò~m\Ý4Ì™ \0\0\0\0\0\0-\Ì\ä;’½EÂ˜¸—R\åHi‹˜²\ÔÝ¯%ž\ËKð’\Ä\æ,\Â]\ÚòYì´²*´)T	PYšMÃµ”µ5\íA•\çø·òÿ\0*µCymú(œ¿Ê†b\"œw\ãŒ¯|å¸¬\ÂE\\é´ª¨ºûÐ¢ypšm\ã\Ó^c\\r\Ò,X†\Ò,\ÓL”F¦lT\"GC²1±ŽR•J-KhÁ©6(\É\\\ä«je\å\ÔS	q\ÝZ·A±I2ªc›«¦\Ù{Û‡Qq9:µL|\é\ÎnV\Ä\Ôj²°\ìOWöSc‘‹„”\\i\ë\ã<þ^ö\Ñ(\ä;<x\É>D\Ï\\¯‡gŸ%È˜\ë€cU®µyžO“óX\é¦d\Ã^g“\äü\Öºi™3@\0\0\0\0\0\0S\êR¢˜¸—R\åxI‹˜-y,öZK‡‰9ˆÐ“v\îK=––B\éð©PøB\Ä\ÎKµK3i¹v –jñ\ÙX1>\Ñ9÷(eb²\Û3|Le\ä\ÇFÀ‹Tÿ\0©ùó·M+b\\w\ã\ÇÄ§}6&gð’‰™yó\â MM¹\ÜZˆ,‰E.­­¦\çGÂ‡L\í³³\â\Órf\é­Z\ÑË‚¼ö\'®†r\"|YnižL|FZSµ’\Ó\â0\ÙM/\\H5ˆ\êokMKj›,Œ+m\Åß¿9„½\ê6a•\Ä\ì&ó¹9Ö‰\Îmr01¥1f\â[T\çåº®Ž.™Ë–\ê¦;læ¡š„”¥1÷\ï\ÒkÒŽ\ÚÝ¢\ÔÔ¸¬\Öl2\ïª%5œYµNc\êr=žò\ä¹=p¬¨rMž\"Uò|™Ž¸&t­ŽÁy¿P“óh\é¦`\Ã\Þo\Ô$ü\Úºi˜3T\0\0\0\0\0\0)‹‰u)QL\\•Ô yu‰bs`¦\íÜ–{-&1,Nb,Ý»’\Ïe¥¸\ä)Rò´¡Z²\Ô\ÎCµ”µ2›‡j#z\Éô19•\nf›i]\ì1VDÏ‡ùPNBT­\è\ÂüVúb¢c#©**.‚2±Mc:¶ŽT[\r\Æ\ÂEn\ZgKuè¡§«(J’œ|%\Ü\â\\h¶¡¯^5Z\Ø\Ü\Ú4¢\ã­Z\à+’ª‹ZW=Et•D›‡¿m˜è½‡D\ä\Çõ\ZªV\ÊR¨©j.z¦+M\ê^.\ën\é\Ý)Zt;\Ôjw6Q±\Ó	‹eiJu›D\ìd<<\íD\æÁþ\ØF\\™K­5\ã–6Hp\Úô\ì\è%\ÉÁÁ\Ïð0W½;‡exÓ¿I²BS9«¦©59\Î\Ùrœ™Ž¸\'\\E\ïñ9\Ï9r|™Ž¸&9t‹Ó±\Þw\Ô$ü\Ú»i˜0÷™\äù?5\îšf”\0\0\0\0\0\0\nbä®¥*(‹’º”25,Bº}#¹,ö\ZND±5\å“\éÉ‡\ì4²•\nUª…\n€YT,\Ì\ä»Q%\ÈXšM\Ê\ê1y­E…Wy(d& ¢\Ø`¯v>\Æ\ìú\Ø\ä\ÞÈµj-šl®„C³‹\á\ä·\Ó\ZF–‘\Ý\'m½\Èø9—7òœ]õ\ê/\"4\Öæ¥¬±-\ÇBšmO•\ÍL|F\ZfVŽ§9¾\í[Š—C\Ü7Rõ‘\Ö‘H[†\Ö\ÚW\áMe¶Á\â89f²±iÓ‰\ÛU«K[‹	)[2ç©°\\û¬\ç\ÃX1k…Š‹…š\ÌöÖ¶P\Â\Þl]®rr]Tr-¨¨–­šªtk\ë½ˆ›d²R+m¦šf\ì_†-xyf¼rM—é…½—`X\êØª\ØÜ¥¢\"Ú¦™p¢Uµˆ\Ý\Ò*¶\"bs^™•4*[Ì¦\ír`¥*™<zt \æ\ïkN’›S’lø\Ú:O“1\×\ì\ÈÓü ò¤¹3pNl¯²+°\Þ_“\äü\Ö_\Ý4Ì˜[\Êòt—š\Ëû¦™£%@\0\0\0\0\0ˆ¹+©J\Ê#d®¥\ê\Í(–&¢·Œ&°†F–%|cù0ý†–BB¡B¡uP¥P*„y¬•\ÔJT#\Í&\åuv\â7\èÜ¿\ÕðCa”TkUlsœŽÔ‰j|:H×s[s’¨\×Ò™—r‹oI¹|Á\\\æµJô\Ù\Úzy\ÏNE\äc\æ!U\Z¿Ì¨Š\ä\âÒœh[(”\âõ\ã±9‰\ÒT|ûW§6šŸ}òI²jÄ¥sç­´\Ç\ÞÁ¿y\ÓRŽ‰n+>5³‹®Åª¹UL\ÌWV´Í£U)\ßaWi:pöV¤\ÈAÂ†¼O\ëC\êKUQ=d«ØŒ\â\ÂMh½Š½ù9dW­mF¢­µT©ÁüŸl\é‹•&¯šcJ\Ñ\ïZ¢-¦$Ï\Ôw4[]x·=\Ñ\'ö\Ûp \Ãv\Ò\Ås\êÖ¶ºª¿\í:‘\ÏZýØ¸\ÎX›l$EGY‹ž\Ë\Õ\Ó\\Ë¥L­\Ìc’\Z#›G%œ|\ä°^\ål\Ò6k\å•%É˜\ë‚vSŒü¡²¤¹3pJTW`¼…ÿ\0—Iy¬¿ºi›0w\ä\Ù/4—÷L3†h\0\0\0\0\0\0\n#d®¥\ê+-\Ç\Év¥\ê\Î*Ê¥¡b«\\Ç›1Â‡!d,9\nê…§ œ„i¤Ü®¢Z‘\æ“p\í_7‹ \á@ö©\ì4\Üfµ¢¹©W.\å‰Æ¸»MWbfýo¶Oa¦ö\é,\'#—2Xšó›\ã}šbÁ\\{š¬\rË¾·Z\Õz\Ñ	\í	v¤T\ß&|\ËTø¡Ÿt²%)™P\Ç\ß\\,(²¶·\ÚBó=\å*\Î\\¬UÄ˜ú‹\é/‚Š«‹?g=’µR\ÝÐ·r˜“¾lG_’t®\àQ­‰\écQUsW‰5Ô“©V\î°òi{ª¢s\ì,¦$W±)m¸(õ\ëZÿ\0´\Û\ï6\ä¢À•~<9Ë›œ©®\ÜƒŸù8\îy}¨Ù®\Ël´$cR\Õ\\\'®w=Q*«Ð‰©\È\0r \0\08\Ï\Ê*K“1\×\ì\ÇùC\åIrf:\à‘zEuû\ÅòlšKû¦\Ãx¾M‘óIt\Ã8f€\0\0\0\0\0\0·1’\îJõs\ä¯PzFØ…\n„„mˆG‚õrUR–ªRµ\ÄYnBÓ\ä-9\0°¨G›MÃµ|P”¨F›MÃµ|P\r\ïb\Öo¶Oa§Hd:ÿ\0a–\Ã\Ç_û\É\î\ÚtdBûö^t¡\Ì1·\Âß rgZ\'®¦U\ËKW‚»jô£‰¾\\|É ¶­\Z”fmiO\æ\\\Ú5ö\"AÎ©‰y´Ú¦J,º\Ô\Í\\Ë‹Z:\"Q¸\è¶+¹³\'{¿)=×¬{.>«UQp\ír¢Û”–\"¥4ÒŒ\è0\Û\r\Ù6ó\'z™™ˆ8|Z´”\ËJ¢%-þ\è¦7=\ÍUv9*˜¥˜0¨^0V€\0ùC\åIrf:\àœ\ã?(|©.L\Ç\\*~ñ|›#\æ’þ\é†pÁ\Þ/“d|\Ò[\Ý0\Î \0\0\0\0\0\0-\Ìd»Rõ\n#\ä»RõÀ‘,(‰U8õ‘¶!öfÕ°²ž…§!!\ÈZr\ÈE\Èw|\ä\×!y7\ß8a«L}º{¶\ç»ýZ?Û§»a\Ð\ËE\â<XxYX³\'|d)¨(\å\Åa”#\ÅaiV•„–‘Âˆ˜IcRºñS¯\Ôf\Ò“\ì(4^jv—¨M\Ëe«[XHe\ê\n\Ú>€\éð 8\Ï\Ê*K“1\×\ì\ÇùC\åIrf:\à‘G_¼o&\Éy¤¿ºaœ0—‘\ä\é/5—÷L3fh\0\0\0\0\0\0\n^Ú¢¦”*\0pÉ¹gC{¡½(\æ­‹\àFr\Îj\çÁ‹\ãa1\ë¥\ÍE_YÁùN\r\î7°Ž ö–^‡tðrOƒAû\ì)[Ú’\à°~\ã{\Çr\'V9GU§ ¼’\à°~\ã{žHðH>½ƒc‡^eúº\ç²$4€‘Q\ïG\å«\Z_\åuRˆš\r…v_^žhé¼ûž¶¬”º¯\Ù3°ù\àm\Î\à2Þ‰„\ìs%Ù\Ü=:þ\Ñmv_^žh\ê^\Ü\î-\è¡ö<\r¹\Ü[\ÑC\ìF\ë—.ÌŽ\à)ø…ý¢•Ù\Ü¿ˆ_\Ú:Ÿ·;€\Ëz}ƒÀÛ›À%}>Á\ämÊ—f—pþ%d¥vkw\0o\âWöN¯\àm\Î\à¾†a÷À\ëÀ%}/\Ò69*\ì\Ú\î\0\ßÄ¯\í?\î\à	ø•ý£®xs¸¯ …úG‚;€Jz_¤*m\È]³’ðüOøŠŽ‹Àñ?\â;‚;€Jz_¤x!s¸§ …úG’v\ä\ÇEÿ\0OO\ÄˆÓ¯\îü¢]ˆ\Z\Ém­\Ì\Âc×¬W=\ÑU¿Ò›Ö¢%3©\è\å¼Û›þŸ)øx?¤•s\ïzN°¥\å`Bvú(lwKQm\n\ïzI`J\ËÁvT(0¡®¶1­_Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ù','download (3).jpg','image/jpeg',4);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `product_condition` tinyint NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` int NOT NULL,
  `category_id` int NOT NULL,
  `manufacturer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  KEY `FKljnead8q1652k9q5p0fe0o1g2` (`manufacturer_id`),
  CONSTRAINT `FKljnead8q1652k9q5p0fe0o1g2` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`product_condition` between 0 and 2))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'While the attraction from the set of 4 iPhone 12 versions has not cooled yet, Apple has brought users a new super product iPhone 13 series with many interesting improvements that will bring the most attractive experiences. for users.',0,'Iphone 13',30,990,1,2),(2,'The Galaxy S21 5G phone in the S21 series from Samsung stands out with its bezel-less design, impressive camera cluster and top powerful performance.',0,'Galaxy s21',20,788,2,2),(3,'High-end tablet with M1 chip',0,'Ipad Pro',25,1089,2,1),(4,'Advanced tablet with high performance',0,'Galaxy Tab S7',19,750,2,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$10$kY8z.LrA3w.xUs0RrnXhFuVE1v/D9brk/2VNorqkVSbyVCebdEcIm','ADMIN','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-12 21:05:00
