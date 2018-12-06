/*
Navicat MySQL Data Transfer

Source Server         : 47.106.93.181_3306
Source Server Version : 50723
Source Host           : 47.106.93.181:3306
Source Database       : ten

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-11-30 15:03:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Code
-- ----------------------------
DROP TABLE IF EXISTS `Code`;
CREATE TABLE `Code` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `ctype` varchar(255) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Code
-- ----------------------------

-- ----------------------------
-- Table structure for t_common
-- ----------------------------
DROP TABLE IF EXISTS `t_common`;
CREATE TABLE `t_common` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `ctype` varchar(255) DEFAULT NULL,
  `ctext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_common
-- ----------------------------
INSERT INTO `t_common` VALUES ('1', '出租类型', '租房');
INSERT INTO `t_common` VALUES ('2', '出租类型', '新房');
INSERT INTO `t_common` VALUES ('3', '出租类型', '二手房');
INSERT INTO `t_common` VALUES ('4', '朝向', '东');
INSERT INTO `t_common` VALUES ('5', '朝向', '南');
INSERT INTO `t_common` VALUES ('6', '朝向', '西');
INSERT INTO `t_common` VALUES ('7', '朝向', '北');
INSERT INTO `t_common` VALUES ('8', '装修', '精装修');
INSERT INTO `t_common` VALUES ('9', '装修', '中装修');
INSERT INTO `t_common` VALUES ('10', '装修', '简单装修');

-- ----------------------------
-- Table structure for t_follow
-- ----------------------------
DROP TABLE IF EXISTS `t_follow`;
CREATE TABLE `t_follow` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `houseid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FK67D58DDC2BD07D70` (`houseid`),
  KEY `FK67D58DDC17CFDD3C` (`userid`),
  CONSTRAINT `FK67D58DDC17CFDD3C` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`),
  CONSTRAINT `FK67D58DDC2BD07D70` FOREIGN KEY (`houseid`) REFERENCES `t_house` (`houseid`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_follow
-- ----------------------------
INSERT INTO `t_follow` VALUES ('50', '6', '16', null);
INSERT INTO `t_follow` VALUES ('59', '1', '3', null);
INSERT INTO `t_follow` VALUES ('67', '2', '19', null);
INSERT INTO `t_follow` VALUES ('68', '2', '22', null);
INSERT INTO `t_follow` VALUES ('72', '1', '17', null);
INSERT INTO `t_follow` VALUES ('76', '4', '57', null);
INSERT INTO `t_follow` VALUES ('77', '4', '63', null);
INSERT INTO `t_follow` VALUES ('81', '4', '1', null);
INSERT INTO `t_follow` VALUES ('82', '11', '57', null);
INSERT INTO `t_follow` VALUES ('83', '4', '59', null);
INSERT INTO `t_follow` VALUES ('84', '1', '73', null);
INSERT INTO `t_follow` VALUES ('89', '1', '64', null);

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `houseid` int(11) NOT NULL AUTO_INCREMENT,
  `housename` varchar(255) DEFAULT NULL,
  `rentmoney` int(11) DEFAULT NULL,
  `renttype` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `mediumid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `orientation` int(11) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `renovate` int(11) DEFAULT NULL,
  `haddress` varchar(255) DEFAULT NULL,
  `releaseTime` varchar(255) DEFAULT NULL,
  `hstatus` varchar(255) DEFAULT NULL,
  `discreption` varchar(20000) DEFAULT NULL,
  `regionid` int(11) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`houseid`),
  KEY `FKA05D0395FE6D3846` (`orientation`),
  KEY `FKA05D0395A652343B` (`houseid`),
  KEY `FKA05D0395375E0206` (`renovate`),
  KEY `FKA05D0395AC893C4` (`typeid`),
  KEY `FKA05D0395441D868E` (`regionid`),
  KEY `FKA05D039537A3E869` (`renttype`),
  KEY `FKA05D03952F123B50` (`mediumid`),
  KEY `FKA05D03953DFA9E7E` (`tid`),
  KEY `FKA05D0395543BC334` (`cid`),
  CONSTRAINT `FKA05D03952F123B50` FOREIGN KEY (`mediumid`) REFERENCES `t_medium` (`mediumid`),
  CONSTRAINT `FKA05D0395375E0206` FOREIGN KEY (`renovate`) REFERENCES `t_common` (`cid`),
  CONSTRAINT `FKA05D039537A3E869` FOREIGN KEY (`renttype`) REFERENCES `t_common` (`cid`),
  CONSTRAINT `FKA05D03953DFA9E7E` FOREIGN KEY (`tid`) REFERENCES `t_housetype` (`tid`),
  CONSTRAINT `FKA05D0395441D868E` FOREIGN KEY (`regionid`) REFERENCES `t_region` (`regionid`),
  CONSTRAINT `FKA05D0395543BC334` FOREIGN KEY (`cid`) REFERENCES `t_common` (`cid`),
  CONSTRAINT `FKA05D0395AC893C4` FOREIGN KEY (`typeid`) REFERENCES `t_housetype` (`tid`),
  CONSTRAINT `FKA05D0395FE6D3846` FOREIGN KEY (`orientation`) REFERENCES `t_common` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('1', '秋名山', '1000', '1', '20', '3', '2', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', '房子是二房一厅一厨一卫一阳台的全明房型，需爬楼梯 - 楼梯楼2楼。\r\n1.房内配套设施齐全：冷暖空调、影视系统、基本日用品（牙刷牙膏、洗发水护发素、沐浴露、浴巾、拖鞋、水杯等）一应俱全。厨房用品（灶具、炊具、厨具、餐具）齐全，并备有基本佐料，亲们带上随身物品即可入住，家里备有饮料、咖啡、茶饮、零食等，亲们可视需要自助取用。\r\n2.主卧室：1.8米大床+舒适床垫，新古典设计配合暖光源，睡得安心舒服。\r\n次卧室：1.5米大床+舒适床垫，古典与时尚的设计，和谐温馨。\r\n3.洗手间：干湿分区、独立淋浴间、24小时热水、专业的洗护用品，让您尽情放松，焕发活力。\r\n4.百兆入户光纤极速WIFI，进入房子后客人首先根据账号密码链接WIFI，就能体验极速畅快的上网感受。\r\n5.43寸高清网络电视机、 百兆高速，休闲时可在家靠在沙发上看看电视、电影或听听音乐。在夜深时请配合调低音量，避免影响周边邻居休息。\r\n6.遥控器在电视机柜上，使用完毕后，请帮忙关闭电源并将遥控器放回原位，下次使用即可轻松找到遥控器。\r\n7.冰箱：纯净水、可乐、茶等饮料或食品，均可视需自行取用，像家一样就好。\r\n8.阳台：洗衣晾衣，解决下榻期间的洗衣问题，也可坐在吧椅上晒晒太阳发发呆，或与三五亲朋好友品茶/咖啡闲聊人生趣事，回味往昔美好。', '3', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('2', '静江豪景', '8000000', '2', '30', '2', '1', '5', '2', '9', '思明区望海路71号', '2018-11-21', '下架', 'sfg', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('3', '中凯城市之光', '400000', '3', '40', '2', '2', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'g', '1', 'images\\fang1.jpg', null, null);
INSERT INTO `t_house` VALUES ('4', '未来城市', '800', '1', '50', '3', '3', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'gf', '1', 'images\\fang1.jpg', null, null);
INSERT INTO `t_house` VALUES ('5', '水塘小区', '6000000', '2', '60', '2', '1', '5', '2', '9', '思明区望海路71号', '2018-11-21', '下架', 'gf', '3', 'images\\fang3.jpg', null, null);
INSERT INTO `t_house` VALUES ('6', '优秀', '700000', '3', '70', '3', '1', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'ds', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('7', '汇星广场', '1200', '1', '80', '2', '2', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'gds', '1', 'images\\fang1.jpg', null, null);
INSERT INTO `t_house` VALUES ('8', '虹桥乐亭', '9000000', '2', '90', '2', '3', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang4.jpg', null, null);
INSERT INTO `t_house` VALUES ('9', '优秀', '500000', '3', '100', '2', '2', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('10', '龙景嘉园', '1300', '1', '110', '2', '2', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang4.jpg', null, null);
INSERT INTO `t_house` VALUES ('11', '优秀', '1200000', '2', '120', '3', '5', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('12', '优秀', '600000', '3', '130', '3', '4', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('13', '金水湾', '1500', '1', '140', '3', '1', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('14', '优秀', '400000', '2', '150', '2', '5', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('15', '优秀', '460000', '3', '160', '3', '2', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('16', '学府商街', '1600', '1', '170', '2', '1', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('17', '优秀', '580000', '2', '180', '3', '2', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('18', '优秀', '590000', '3', '190', '3', '5', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', '小家碧玉', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('19', '水岸新城', '1800', '1', '20000', '2', '4', '5', '2', '9', '思明区望海路71号', '2018-11-21', '上架', 'dsg', '1', 'images\\fang2.jpg', null, null);
INSERT INTO `t_house` VALUES ('22', '鹊桥仙境', '900000', '2', '100', '1', '1', '4', '2', '8', '思明区观日路71号', '2018-11-21', '上架', 'sdadad', null, 'images\\fang5.jpg', null, null);
INSERT INTO `t_house` VALUES ('23', '桃花坞', '800000', '3', '150', '1', '2', '4', '2', '8', '思明区观日路71号', '2018-11-21', '上架', 'asdasda', null, 'images\\fang5.jpg', null, null);
INSERT INTO `t_house` VALUES ('55', ' 家家海景房，天天好心情', '2000', '1', '130', '13', '3', '5', '6', '8', '思明 前埔 前埔家家海景', '2018-11-27', '上架', '会展中心附近，带入户花园，有三阳台，可看海景，部分家具家电。', '1', 'upload/1543289371220_104.jpg', null, null);
INSERT INTO `t_house` VALUES ('56', '江山帝景，不一样的你', '2100', '1', '135', '13', '3', '5', '28', '8', '思明区会展中心江山帝景', '2018-11-27', '上架', '小区地理位置优越，出行方便，周边超市银行，酒店及健身器材完善成熟。小区自带园林，儿童游乐设施，老人康体设施齐全。\r\n交通：会展中心公交车站途径公交车：17路19路29路91路98路948路。\r\n小区附近有前埔医院，中国建设银行等。', '1', 'upload/1543296716541_203.jpg', null, null);
INSERT INTO `t_house` VALUES ('57', '水晶世界的美丽', '2700', '1', '35', '13', '5', '5', '8', '10', '思明区观音山水晶国际', '2018-11-27', '上架', '真实图片，有厨房，可煮饭，采光好，可押一付一，性价比很高的房子。', '1', 'upload/1543296938476_3.jpg', null, null);
INSERT INTO `t_house` VALUES ('58', '罗宾森璀璨新城', '3000', '1', '40', '13', '32', '7', '28', '8', '思明区罗宾森璀璨新城2期', '2018-11-27', '上架', '火车站新楼盘，小区品质高，管理到位。隔间出租，独门独户。另有隔间带独卫出租，1500起。交通四通八达，适合年轻人居住。', '1', 'upload/1543297269887_406.jpg', null, null);
INSERT INTO `t_house` VALUES ('59', '罗宾森璀璨新城2期', '1400', '1', '30', '13', '1', '6', '15', '9', '罗宾森璀璨新城2期', '2018-11-27', '下架', '户型朝南，全天采光。家具电器齐全，拎包就能入住。干净，整洁舒适，性价比高，交通购物便利。', '1', 'upload/1543297506239_502.jpg', null, null);
INSERT INTO `t_house` VALUES ('60', '东辉光场', '1100', '2', '30', '13', '5', '5', '13', '10', '东辉光场', '2018-11-27', '上架', '邻居大妈亲情回馈，大学生在邻居大妈租房免押金！这是东辉光场单间，这附近的单间还有很多。所有房子都亲自实地勘察过，放心租住。', '2', 'upload/1543297702791_604.jpg', null, null);
INSERT INTO `t_house` VALUES ('61', '江浦南里', '480000', '2', '70', '13', '2', '4', '3', '10', '江浦南里', '2018-11-27', '上架', '邻居大妈，这里让您无忧无虑，租房其实不难，只是没有找到合适的而已。生活因发现而改变，生活中总有一些美丽未曾发现，总有一些浪漫未曾领略，这里可以让您的生活领略充满美丽的浪漫。', '2', 'upload/1543297920449_7.jpg', null, null);
INSERT INTO `t_house` VALUES ('62', '古龙公寓', '1000000', '3', '80', '13', '33', '6', '3', '9', '古龙公寓', '2018-11-27', '上架', '交通便利，周边配套齐全，附近公交车很多，出行很方便。我们将以一颗诚实的心，全心全意为您找到合适的房源。', '1', 'upload/1543298082821_8.jpg', null, null);
INSERT INTO `t_house` VALUES ('63', '康乐新村1期', '450', '1', '120', '13', '4', '7', '3', '9', '康乐新村1期', '2018-11-27', '下架', '塘边地铁口，3房加一大书房，光线采光好，价格实惠。', '3', 'upload/1543298765694_908.jpg', null, null);
INSERT INTO `t_house` VALUES ('64', '国宝新城', '470000', '2', '160', '13', '34', '5', '15', '8', '国宝新城', '2018-11-27', '上架', '房屋朝向南北，格局方正，使用率高，客厅宽敞舒适，落地阳台让充足的阳光不留余地的照进来，卧室舒适，面积合理，厨房宽敞，让您和您的家人有足够的空间展现私家厨艺；连接客厅和厨房之间的是您和家人享受美味的餐厅，让您热情的招待亲朋好友。', '1', 'upload/1543298992227_1001.jpg', null, null);
INSERT INTO `t_house` VALUES ('65', '龙湖嘉誉西门', '840000', '2', '50', '13', '1', '4', '5', '9', '龙湖嘉誉西门', '2018-11-27', '上架', '附近交通发达，购物方便，就医方便。', '3', 'upload/1543299166806_1101.jpg', null, null);
INSERT INTO `t_house` VALUES ('66', '阳光城翡丽海岸', '360000', '2', '120', '13', '2', '7', '5', '10', '阳光城翡丽海岸', '2018-11-27', '上架', '附近公园环境优美，商场购物方便', '3', 'upload/1543299351646_1205.jpg', null, null);
INSERT INTO `t_house` VALUES ('68', '家家海景房，天天好心情', '1300000', '3', '40', '13', '1', '5', '12', '10', '汇景新城（翔安 新店）', '2018-11-27', '上架', '正规单身公寓，楼下就是汇景商场，生活便利。朝南户型，业主居家精装修，保养的很好，可直接拎包入住', '6', 'upload/1543300100815_1301.jpg', null, null);
INSERT INTO `t_house` VALUES ('69', '南中大地广场  ', '20000', '2', '160', '11', '8', '5', '20', '8', '南中大地广场  ', '2018-11-27', '下架', '从空间设计、业态规划、景观设置等诸多方面，打造以消费者为主题的购物休闲环境，是一个极具吸引力的大型商业休闲中心。 南中大地广场 地处厦门中山路核心区位，铺铺临街金店面。项目引入奥特莱斯品牌折扣直销中心，荟萃国际高端品牌，天天超低折扣销售，有望再掀厦门中山路人气狂潮。 [公园式购物环境] 南中大地广场精心设计多层次公园景观，珍贵植物错落有致，点缀雕塑，结合小品，形成立体的休闲景观空间，为顾客营造轻松、休闲、公园式的购物环境，让顾客在体味时尚缤纷购物乐趣的同时，感受极致浪漫的热带风情。 [多元化业态] 奥特莱斯购物中心，美食天地，休闲会馆酒店，时尚精品、流行前线，中山路大型停车场.南中大地广场还特别规划了中山商圈其余SHOPPINGMALL所没有的大型综合运动体验中心——百事可乐运动城，本中心规划有攀岩、篮球等多达16项的运动项目，通过不定期举办各项赛事，再结合超大规模的KTV娱乐场所、顶层空中休闲区及万国美食天地等商家的丰富资源，将会在厦门繁华中心掀起一股前所未有的“财富大运动”。是中山路商圈内迄今为止最具特色、最具影响力的运动、娱乐、购物中心。另外，休闲会馆酒店、流行时尚精品店也是项目业态完善的一个重要体现。值得一提的是，南中大地广场特别规划了中山路步行街配套大型停车场，规划了近500个车位', '1', 'upload/nan.jpg', null, null);
INSERT INTO `t_house` VALUES ('73', '莲花三村', '360000', '3', '97', '11', '24', '4', '9', '10', '流芳里', '2018-11-28', '上架', '莲花新城三期位于厦门市集美集美新城，由厦门住宅建设集团有限公司建成，总建筑面积167900，总占地面积69342，共计房屋1076户。', '1', 'upload/er1.jpg', null, null);
INSERT INTO `t_house` VALUES ('74', '瑞景公园', '13600000', '3', '164', '11', '8', '6', '21', '9', '瑞景公园', '2018-11-28', '上架', '瑞景的地理位置“瑞景公园”位于厦门本岛东部洪文片区，距厦门国际会展中心和环岛路仅2公里，周边配套设施齐全，地理位置优越。', '1', 'upload/er2.jpg', null, null);
INSERT INTO `t_house` VALUES ('75', '海峡国际二期', '435000', '3', '206', '13', '4', '7', '18', '8', '海峡国际二期', '2018-11-28', '上架', '海峡国际社区二期', '1', 'upload/er3.jpg', null, null);
INSERT INTO `t_house` VALUES ('79', '软件园二期软件', '2000', '1', '300', '13', '17', '5', '30', '8', '大', '2018-11-30', '下架', '1111111', '2', 'upload/1543544540728_QQ图片20181129173001.png', null, null);
INSERT INTO `t_house` VALUES ('80', '软件园二期软件', '2000', '1', '300', '13', '17', '4', '30', '8', '软件园二期软件观日路2号', '2018-11-30', '下架', '111', '1', 'upload/1543545403962_QQ图片20181129172258.png', null, null);
INSERT INTO `t_house` VALUES ('81', '软件园二期二期', '111', '1', '111', '13', '1', '6', '30', '8', '软件园二期12号楼', '2018-11-30', '下架', '1111', '3', 'upload/1543548536106_11.jpg', null, null);

-- ----------------------------
-- Table structure for t_housetype
-- ----------------------------
DROP TABLE IF EXISTS `t_housetype`;
CREATE TABLE `t_housetype` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `room` int(11) DEFAULT NULL,
  `hall` int(11) DEFAULT NULL,
  `toilet` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_housetype
-- ----------------------------
INSERT INTO `t_housetype` VALUES ('1', '1', '1', '1');
INSERT INTO `t_housetype` VALUES ('2', '2', '1', '1');
INSERT INTO `t_housetype` VALUES ('3', '3', '2', '2');
INSERT INTO `t_housetype` VALUES ('4', '4', '2', '2');
INSERT INTO `t_housetype` VALUES ('5', '1', '0', '1');
INSERT INTO `t_housetype` VALUES ('8', '6', '2', '2');
INSERT INTO `t_housetype` VALUES ('13', '7', '3', '1');
INSERT INTO `t_housetype` VALUES ('15', '5', '3', '5');
INSERT INTO `t_housetype` VALUES ('16', '1', '4', '2');
INSERT INTO `t_housetype` VALUES ('17', '1', '0', '0');
INSERT INTO `t_housetype` VALUES ('23', '1', '1', '2');
INSERT INTO `t_housetype` VALUES ('24', '4', '2', '0');
INSERT INTO `t_housetype` VALUES ('25', '3', '3', '4');
INSERT INTO `t_housetype` VALUES ('32', '3', '3', '2');
INSERT INTO `t_housetype` VALUES ('33', '3', '2', '1');
INSERT INTO `t_housetype` VALUES ('34', '5', '2', '2');
INSERT INTO `t_housetype` VALUES ('35', '1', '1', '0');

-- ----------------------------
-- Table structure for t_image
-- ----------------------------
DROP TABLE IF EXISTS `t_image`;
CREATE TABLE `t_image` (
  `imageid` int(11) NOT NULL AUTO_INCREMENT,
  `urladdress` varchar(255) DEFAULT NULL,
  `houseid` int(11) DEFAULT NULL,
  PRIMARY KEY (`imageid`),
  KEY `FKA069E5D02BD07D70` (`houseid`),
  KEY `FKA069E5D05C2DBCEB` (`imageid`),
  CONSTRAINT `FKA069E5D02BD07D70` FOREIGN KEY (`houseid`) REFERENCES `t_house` (`houseid`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_image
-- ----------------------------
INSERT INTO `t_image` VALUES ('1', 'images/fang1.jpg', '1');
INSERT INTO `t_image` VALUES ('2', 'images/fang2.jpg', '1');
INSERT INTO `t_image` VALUES ('78', 'upload/1543289352216_101.jpg', '55');
INSERT INTO `t_image` VALUES ('79', 'upload/1543289358426_102.jpg', '55');
INSERT INTO `t_image` VALUES ('80', 'upload/1543289371032_107.jpg', '55');
INSERT INTO `t_image` VALUES ('81', 'upload/1543289371095_数据1.jpg', '55');
INSERT INTO `t_image` VALUES ('82', 'upload/1543289371220_104.jpg', '55');
INSERT INTO `t_image` VALUES ('83', 'upload/1543289371251_103.jpg', '55');
INSERT INTO `t_image` VALUES ('84', 'upload/1543296716115_201.jpg', '56');
INSERT INTO `t_image` VALUES ('85', 'upload/1543296716292_204.jpg', '56');
INSERT INTO `t_image` VALUES ('86', 'upload/1543296716323_202.jpg', '56');
INSERT INTO `t_image` VALUES ('87', 'upload/1543296716510_206.jpg', '56');
INSERT INTO `t_image` VALUES ('88', 'upload/1543296716541_203.jpg', '56');
INSERT INTO `t_image` VALUES ('89', 'upload/1543296938011_301.jpg', '57');
INSERT INTO `t_image` VALUES ('90', 'upload/1543296938135_303.jpg', '57');
INSERT INTO `t_image` VALUES ('91', 'upload/1543296938366_305.jpg', '57');
INSERT INTO `t_image` VALUES ('92', 'upload/1543296938476_数据3.jpg', '57');
INSERT INTO `t_image` VALUES ('93', 'upload/1543297269496_403.jpg', '58');
INSERT INTO `t_image` VALUES ('94', 'upload/1543297269622_407.jpg', '58');
INSERT INTO `t_image` VALUES ('95', 'upload/1543297269653_数据4.jpg', '58');
INSERT INTO `t_image` VALUES ('96', 'upload/1543297269715_408.jpg', '58');
INSERT INTO `t_image` VALUES ('97', 'upload/1543297269887_406.jpg', '58');
INSERT INTO `t_image` VALUES ('98', 'upload/1543297505864_数据5.jpg', '59');
INSERT INTO `t_image` VALUES ('99', 'upload/1543297506052_504.jpg', '59');
INSERT INTO `t_image` VALUES ('100', 'upload/1543297506130_507.jpg', '59');
INSERT INTO `t_image` VALUES ('101', 'upload/1543297506193_503.jpg', '59');
INSERT INTO `t_image` VALUES ('102', 'upload/1543297506239_502.jpg', '59');
INSERT INTO `t_image` VALUES ('103', 'upload/1543297702025_数据6.jpg', '60');
INSERT INTO `t_image` VALUES ('104', 'upload/1543297702416_601.jpg', '60');
INSERT INTO `t_image` VALUES ('105', 'upload/1543297702494_605.jpg', '60');
INSERT INTO `t_image` VALUES ('106', 'upload/1543297702572_603.jpg', '60');
INSERT INTO `t_image` VALUES ('107', 'upload/1543297702791_604.jpg', '60');
INSERT INTO `t_image` VALUES ('108', 'upload/1543297920058_702.jpg', '61');
INSERT INTO `t_image` VALUES ('109', 'upload/1543297920121_703.jpg', '61');
INSERT INTO `t_image` VALUES ('110', 'upload/1543297920214_706.jpg', '61');
INSERT INTO `t_image` VALUES ('111', 'upload/1543297920387_707.jpg', '61');
INSERT INTO `t_image` VALUES ('112', 'upload/1543297920449_数据7.jpg', '61');
INSERT INTO `t_image` VALUES ('113', 'upload/1543298082571_805.jpg', '62');
INSERT INTO `t_image` VALUES ('114', 'upload/1543298082759_804.jpg', '62');
INSERT INTO `t_image` VALUES ('115', 'upload/1543298082790_803.jpg', '62');
INSERT INTO `t_image` VALUES ('116', 'upload/1543298082837_802.jpg', '62');
INSERT INTO `t_image` VALUES ('117', 'upload/1543298082821_数据8.jpg', '62');
INSERT INTO `t_image` VALUES ('118', 'upload/1543298765428_901.jpg', '63');
INSERT INTO `t_image` VALUES ('119', 'upload/1543298765632_904.jpg', '63');
INSERT INTO `t_image` VALUES ('120', 'upload/1543298765600_903.jpg', '63');
INSERT INTO `t_image` VALUES ('121', 'upload/1543298765537_902.jpg', '63');
INSERT INTO `t_image` VALUES ('122', 'upload/1543298765694_908.jpg', '63');
INSERT INTO `t_image` VALUES ('123', 'upload/1543298991797_1009.jpg', '64');
INSERT INTO `t_image` VALUES ('124', 'upload/1543298991930_1006.jpg', '64');
INSERT INTO `t_image` VALUES ('125', 'upload/1543298991961_1002.jpg', '64');
INSERT INTO `t_image` VALUES ('126', 'upload/1543298992180_1008.jpg', '64');
INSERT INTO `t_image` VALUES ('127', 'upload/1543298992227_1001.jpg', '64');
INSERT INTO `t_image` VALUES ('128', 'upload/1543299166540_1105.jpg', '65');
INSERT INTO `t_image` VALUES ('129', 'upload/1543299166619_1103.jpg', '65');
INSERT INTO `t_image` VALUES ('130', 'upload/1543299166666_1104.jpg', '65');
INSERT INTO `t_image` VALUES ('131', 'upload/1543299166712_1102.jpg', '65');
INSERT INTO `t_image` VALUES ('132', 'upload/1543299166806_1101.jpg', '65');
INSERT INTO `t_image` VALUES ('133', 'upload/1543299351365_1201.jpg', '66');
INSERT INTO `t_image` VALUES ('134', 'upload/1543299351458_1202.jpg', '66');
INSERT INTO `t_image` VALUES ('135', 'upload/1543299351615_1204.jpg', '66');
INSERT INTO `t_image` VALUES ('136', 'upload/1543299351631_1203.jpg', '66');
INSERT INTO `t_image` VALUES ('137', 'upload/1543299351646_1205.jpg', '66');
INSERT INTO `t_image` VALUES ('143', 'upload/1543300100702_06cc7db9-3b38-42f8-a58c-d382fc75fc48.jpg', '68');
INSERT INTO `t_image` VALUES ('144', 'upload/1543300100733_1312.jpg', '68');
INSERT INTO `t_image` VALUES ('145', 'upload/1543300100733_1308.jpg', '68');
INSERT INTO `t_image` VALUES ('146', 'upload/1543300100846_1318.jpg', '68');
INSERT INTO `t_image` VALUES ('147', 'upload/1543300100815_1301.jpg', '68');
INSERT INTO `t_image` VALUES ('156', 'upload/nan1.jpg', '69');
INSERT INTO `t_image` VALUES ('157', 'upload/nan2.jpg', '69');
INSERT INTO `t_image` VALUES ('158', 'upload/nan3.jpg', '69');
INSERT INTO `t_image` VALUES ('159', 'upload/nan.jpg', '69');
INSERT INTO `t_image` VALUES ('167', 'upload/er12.jpg', '73');
INSERT INTO `t_image` VALUES ('168', 'upload/er14.jpg', '73');
INSERT INTO `t_image` VALUES ('169', 'upload/er13.jpg', '73');
INSERT INTO `t_image` VALUES ('170', 'upload/er15.jpg', '73');
INSERT INTO `t_image` VALUES ('171', 'upload/er16.jpg', '73');
INSERT INTO `t_image` VALUES ('172', 'upload/er21.jpg', '74');
INSERT INTO `t_image` VALUES ('173', 'upload/er22.jpg', '74');
INSERT INTO `t_image` VALUES ('174', 'upload/er23.jpg', '74');
INSERT INTO `t_image` VALUES ('175', 'upload/er25.jpg', '74');
INSERT INTO `t_image` VALUES ('176', 'upload/er26.jpg', '74');
INSERT INTO `t_image` VALUES ('177', 'upload/er31.jpg', '75');
INSERT INTO `t_image` VALUES ('178', 'upload/er32.jpg', '75');
INSERT INTO `t_image` VALUES ('179', 'upload/er33.jpg', '75');
INSERT INTO `t_image` VALUES ('180', 'upload/er34.jpg', '75');
INSERT INTO `t_image` VALUES ('181', 'upload/er35.jpg', '75');
INSERT INTO `t_image` VALUES ('182', 'upload/er36.jpg', '75');
INSERT INTO `t_image` VALUES ('183', 'upload/er37.jpg', '75');
INSERT INTO `t_image` VALUES ('190', 'upload/1543544540452_medium3.jpg', '79');
INSERT INTO `t_image` VALUES ('191', 'upload/1543544540584_QQ图片20181129173503.png', '79');
INSERT INTO `t_image` VALUES ('192', 'upload/1543544540728_QQ图片20181129173001.png', '79');
INSERT INTO `t_image` VALUES ('193', 'upload/1543545028130_medium2.jpg', '80');
INSERT INTO `t_image` VALUES ('194', 'upload/1543545400956_QQ图片20181129171618.png', '80');
INSERT INTO `t_image` VALUES ('195', 'upload/1543545403962_QQ图片20181129172258.png', '80');
INSERT INTO `t_image` VALUES ('196', 'upload/1543548536106_11.jpg', '81');

-- ----------------------------
-- Table structure for t_inform
-- ----------------------------
DROP TABLE IF EXISTS `t_inform`;
CREATE TABLE `t_inform` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `mediumid` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `FK6CE351942F123B50` (`mediumid`),
  KEY `FK6CE3519417CFDD3C` (`userid`),
  CONSTRAINT `FK6CE3519417CFDD3C` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`),
  CONSTRAINT `FK6CE351942F123B50` FOREIGN KEY (`mediumid`) REFERENCES `t_medium` (`mediumid`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inform
-- ----------------------------
INSERT INTO `t_inform` VALUES ('128', '3', '2', '未读');
INSERT INTO `t_inform` VALUES ('131', '4', '2', '未读');
INSERT INTO `t_inform` VALUES ('132', '13', '2', '未读');
INSERT INTO `t_inform` VALUES ('133', '13', '13', '未读');
INSERT INTO `t_inform` VALUES ('134', '13', '2', '未读');

-- ----------------------------
-- Table structure for t_medium
-- ----------------------------
DROP TABLE IF EXISTS `t_medium`;
CREATE TABLE `t_medium` (
  `mediumid` int(11) NOT NULL AUTO_INCREMENT,
  `quyu` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`mediumid`),
  KEY `FK7336E1A017CFDD3C` (`userid`),
  CONSTRAINT `FK7336E1A017CFDD3C` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_medium
-- ----------------------------
INSERT INTO `t_medium` VALUES ('1', '集美区', '10');
INSERT INTO `t_medium` VALUES ('2', '集美区', '5');
INSERT INTO `t_medium` VALUES ('3', '智慧园', '2');
INSERT INTO `t_medium` VALUES ('11', '思明区, 湖里区, 同安区', '1');
INSERT INTO `t_medium` VALUES ('13', '思明区, 湖里区, 集美区', '4');
INSERT INTO `t_medium` VALUES ('24', '集美区', '6');
INSERT INTO `t_medium` VALUES ('25', '思明区, 集美区, 同安区', '13');
INSERT INTO `t_medium` VALUES ('26', '思明区, 集美区, 同安区', '14');
INSERT INTO `t_medium` VALUES ('27', '思明区, 集美区', '15');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `menuid` int(11) NOT NULL AUTO_INCREMENT,
  `murl` varchar(255) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `mpid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------

-- ----------------------------
-- Table structure for t_power
-- ----------------------------
DROP TABLE IF EXISTS `t_power`;
CREATE TABLE `t_power` (
  `powerid` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `purl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`powerid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_power
-- ----------------------------
INSERT INTO `t_power` VALUES ('1', '管理员', null);
INSERT INTO `t_power` VALUES ('2', '经纪人', null);
INSERT INTO `t_power` VALUES ('3', '普通用户', null);

-- ----------------------------
-- Table structure for t_region
-- ----------------------------
DROP TABLE IF EXISTS `t_region`;
CREATE TABLE `t_region` (
  `regionid` int(11) NOT NULL AUTO_INCREMENT,
  `regionname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`regionid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_region
-- ----------------------------
INSERT INTO `t_region` VALUES ('1', '思明区');
INSERT INTO `t_region` VALUES ('2', '湖里区');
INSERT INTO `t_region` VALUES ('3', '集美区');
INSERT INTO `t_region` VALUES ('4', '海沧区');
INSERT INTO `t_region` VALUES ('5', '同安区');
INSERT INTO `t_region` VALUES ('6', '翔安区');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `powerid` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `headimage` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `follow` varchar(255) DEFAULT NULL,
  `uaddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `FKCB63CCB6D3891BFA` (`powerid`),
  CONSTRAINT `FKCB63CCB6D3891BFA` FOREIGN KEY (`powerid`) REFERENCES `t_power` (`powerid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '小明', 'asd1234', '2', '15842120822', '男', '26', 'images/medium5.jpg', '1234567891@qq.com', '人才服务经理', null, '宝龙一城');
INSERT INTO `t_user` VALUES ('2', '马六', 'aaaaaa', '3', '15842120822', '女', '23', 'images/22.jpg', '1234567891@qq.com', '程序员', null, '集美区');
INSERT INTO `t_user` VALUES ('3', '小吴', '222', '2', '15842120888', '男', '22', 'images/icon1.jpg', '1234567891@qq.com', 'java讲师', null, '万达广场');
INSERT INTO `t_user` VALUES ('4', '张三', '111', '2', '15842128000', '男', '22', 'upload/zhangsang.jpg', '739702769@qq.com', '程序员', null, '软件园2期');
INSERT INTO `t_user` VALUES ('5', '小张张', 'aaa111', '2', '15842120820', '男', '32', 'images/medium4.jpg', '15770774755@163.com', '资深程序员', null, '软件园二期');
INSERT INTO `t_user` VALUES ('6', '小a', '222', '2', '15842120822', '男', '23', 'images/medium3.jpg', '1234569871@qq.com', '程序员', null, 'aaaaaa');
INSERT INTO `t_user` VALUES ('10', '李四', 'aaa1', '2', '15842120821', '男', '40', 'images/medium5.jpg', '15979436283@163.com', '程序员', null, '集美区');
INSERT INTO `t_user` VALUES ('11', '哈哈', 'b12345', '3', '15842120820', '男', '23', 'upload/medium3.jpg', '2860645826@qq.com', '初级程序员', null, '望海路12楼');
INSERT INTO `t_user` VALUES ('12', '王五', 'aaa111', '1', '15842120820', '男', '32', 'images/medium4.jpg', '124569871@qq.com', '资深程序员', null, '软件园二期');
INSERT INTO `t_user` VALUES ('13', '小张', 'a12345', '3', '15842120899', '女', '23', 'upload/fang3.jpg', '2860645216@qq.com', '初级程序员', null, '软件园2期望海路13号');
INSERT INTO `t_user` VALUES ('14', '小李', 'li111', '2', '15842120712', '女', '23', 'upload/fangt1.jpg', '2860645656@qq.com', '初级程序员', null, '软件园2期望海路13号');
INSERT INTO `t_user` VALUES ('15', '李宏杰', 'aaa111', '2', '15842120820', '女', '23', 'upload/1543547979199_11.jpg', '2860645816@qq.com', '学生', null, '软件园2期');
