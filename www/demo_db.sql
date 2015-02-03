-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `empty`;
CREATE TABLE `empty` (
  `empty_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `surname` varchar(64) NOT NULL,
  PRIMARY KEY (`empty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `page` (`page_id`, `action`, `parent_id`, `name`, `sort`) VALUES
(1,	1,	0,	'Test page 1',	0),
(2,	1,	0,	'Test page 2',	80),
(3,	0,	4,	'Test page 3',	70),
(4,	0,	8,	'Test page 4',	60),
(5,	1,	8,	'Test page 5',	50),
(6,	1,	7,	'Test page 6',	30),
(7,	0,	9,	'Test page 7',	20),
(8,	0,	0,	'Test page 8',	40),
(9,	1,	0,	'Test page 9',	10),
(10,	1,	0,	'Test page 10',	90);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` int(10) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `surname` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `last_login` datetime NOT NULL,
  `amount` double NOT NULL,
  `avatar` varchar(128) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `timestamp` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` (`user_id`, `action`, `name`, `surname`, `email`, `last_login`, `amount`, `avatar`, `order`, `timestamp`) VALUES
(1,	NULL,	NULL,	'Doe',	'john.doe@test.xx',	'2014-09-01 06:27:32',	1561.456542,	'/avatar/01.png',	100,	1418255325),
(2,	1,	'Peter',	'Larson',	'peter.larson@test.xx',	'2014-09-09 13:37:32',	15220.654,	'/avatar/02.png',	160,	1418255330),
(3,	1,	'Claude',	'Graves',	'claude.graves@test.xx',	'2014-09-02 14:17:32',	9876.465498,	'/avatar/03.png',	180,	1418255311),
(4,	0,	'Stuart',	'Norman',	'stuart.norman@test.xx',	'2014-09-09 18:39:18',	98766.2131,	'/avatar/04.png',	120,	1418255328),
(5,	1,	'Kathy',	'Arnold',	'kathy.arnold@test.xx',	'2014-09-07 10:24:07',	456.987,	'/avatar/05.png',	140,	1418155313),
(6,	0,	'Jan',	'Wilson',	'jan.wilson@test.xx',	'2014-09-03 13:15:22',	123,	'/avatar/06.png',	150,	1418255318),
(7,	0,	'Alberta',	'Erickson',	'alberta.erickson@test.xx',	'2014-08-06 13:37:17',	98753.654,	'/avatar/07.png',	110,	1418255327),
(8,	1,	'Ada',	'Wells',	'ada.wells@test.xx',	'2014-08-12 11:25:16',	852.3654,	'/avatar/08.png',	70,	1418255332),
(9,	0,	'Ethel',	'Figueroa',	'ethel.figueroa@test.xx',	'2014-09-05 10:23:26',	45695.986,	'/avatar/09.png',	20,	1418255305),
(10,	1,	'Ian',	'Goodwin',	'ian.goodwin@test.xx',	'2014-09-04 12:26:19',	1236.9852,	'/avatar/10.png',	130,	1418255331),
(11,	1,	'Francis',	'Hayes',	'francis.hayes@test.xx',	'2014-09-03 10:16:17',	5498.345,	'/avatar/11.png',	0,	1418255293),
(12,	0,	'Erma',	'Burns',	'erma.burns@test.xx',	'2014-07-02 15:42:15',	63287.9852,	'/avatar/12.png',	60,	1418255316),
(13,	1,	'Kristina',	'Jenkins',	'kristina.jenkins@test.xx',	'2014-08-20 14:39:43',	74523.96549,	'/avatar/13.png',	40,	1418255334),
(14,	0,	'Virgil',	'Hunt',	'virgil.hunt@test.xx',	'2014-08-12 16:09:38',	65654.6549,	'/avatar/14.png',	30,	1418255276),
(15,	1,	'Max',	'Martin',	'max.martin@test.xx',	'2014-09-01 12:14:20',	541236.5495,	'/avatar/15.png',	170,	1418255317),
(16,	1,	'Melody',	'Manning',	'melody.manning@test.xx',	'2014-09-02 12:26:20',	9871.216,	'/avatar/16.png',	50,	1418255281),
(17,	1,	'Catherine',	'Todd',	'catherine.todd@test.xx',	'2014-06-11 15:14:39',	100.2,	'/avatar/17.png',	10,	1418255313),
(18,	0,	'Douglas',	'Stanley',	'douglas.stanley@test.xx',	'2014-04-16 15:22:18',	900,	'/avatar/18.png',	90,	1418255332),
(19,	1,	'Patti',	'Diaz',	'patti.diaz@test.xx',	'2014-09-11 12:17:16',	1500,	'/avatar/19.png',	80,	1418255275);

DROP TABLE IF EXISTS `user2group`;
CREATE TABLE `user2group` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `user_group_id` (`user_group_id`),
  CONSTRAINT `user2group_ibfk_3` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user2group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user2group` (`user_id`, `user_group_id`) VALUES
(1,	1),
(1,	2),
(2,	1);

DROP TABLE IF EXISTS `user_big`;
CREATE TABLE `user_big` (
  `user_big_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`user_big_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_big` (`user_big_id`, `name`, `surname`, `email`) VALUES
(1,	'John',	'Doe',	'john.doe@test.xx'),
(2,	'Peter',	'Larson',	'peter.larson@test.xx'),
(3,	'Claude',	'Graves',	'claude.graves@test.xx'),
(4,	'Stuart',	'Norman',	'stuart.norman@test.xx'),
(5,	'Kathy',	'Arnold',	'kathy.arnold@test.xx'),
(6,	'Jan',	'Wilson',	'jan.wilson@test.xx'),
(7,	'Alberta',	'Erickson',	'alberta.erickson@test.xx'),
(8,	'Ada',	'Wells',	'ada.wells@test.xx'),
(9,	'Ethel',	'Figueroa',	'ethel.figueroa@test.xx'),
(10,	'Ian',	'Goodwin',	'ian.goodwin@test.xx'),
(11,	'Francis',	'Hayes',	'francis.hayes@test.xx'),
(12,	'Erma',	'Burns',	'erma.burns@test.xx'),
(13,	'Kristina',	'Jenkins',	'kristina.jenkins@test.xx'),
(14,	'Virgil',	'Hunt',	'virgil.hunt@test.xx'),
(15,	'Max',	'Martin',	'max.martin@test.xx'),
(16,	'Melody',	'Manning',	'melody.manning@test.xx'),
(17,	'Catherine',	'Todd',	'catherine.todd@test.xx'),
(18,	'Douglas',	'Stanley',	'douglas.stanley@test.xx'),
(19,	'Patti',	'Diaz',	'patti.diaz@test.xx'),
(20,	'Valerie',	'Schwartz',	'valerie.schwartz@test.xx'),
(21,	'Stephanie',	'Schmidt',	'stephanie.schmidt@test.xx'),
(22,	'Tricia',	'Wheeler',	'tricia.wheeler@test.xx'),
(23,	'Natalie',	'Drake',	'natalie.drake@test.xx'),
(24,	'Jacquelyn',	'Wilkerson',	'jacquelyn.wilkerson@test.xx'),
(25,	'Marvin',	'Mccormick',	'marvin.mccormick@test.xx'),
(26,	'Jay',	'Craig',	'jay.craig@test.xx'),
(27,	'Randall',	'Rowe',	'randall.rowe@test.xx'),
(28,	'Douglas',	'Walker',	'douglas.walker@test.xx'),
(29,	'Albert',	'Tucker',	'albert.tucker@test.xx'),
(30,	'Kelvin',	'Garcia',	'kelvin.garcia@test.xx'),
(31,	'Guy',	'Flowers',	'guy.flowers@test.xx'),
(32,	'Freddie',	'Castro',	'freddie.castro@test.xx'),
(33,	'Paul',	'Gardner',	'paul.gardner@test.xx'),
(34,	'Laura',	'Garza',	'laura.garza@test.xx'),
(35,	'Dominick',	'Ballard',	'dominick.ballard@test.xx'),
(36,	'Anne',	'Holloway',	'anne.holloway@test.xx'),
(37,	'Derrick',	'Maldonado',	'derrick.maldonado@test.xx'),
(38,	'Bob',	'Tyler',	'bob.tyler@test.xx'),
(39,	'Wm',	'Mullins',	'wm.mullins@test.xx'),
(40,	'Karl',	'Edwards',	'karl.edwards@test.xx'),
(41,	'Lorraine',	'Carlson',	'lorraine.carlson@test.xx'),
(42,	'Carroll',	'Reese',	'carroll.reese@test.xx'),
(43,	'Andy',	'Gomez',	'andy.gomez@test.xx'),
(44,	'Rochelle',	'Pope',	'rochelle.pope@test.xx'),
(45,	'Tamara',	'Howard',	'tamara.howard@test.xx'),
(46,	'Lorena',	'Curtis',	'lorena.curtis@test.xx'),
(47,	'Ebony',	'Phillips',	'ebony.phillips@test.xx'),
(48,	'Chad',	'Andrews',	'chad.andrews@test.xx'),
(49,	'Miranda',	'Erickson',	'miranda.erickson@test.xx'),
(50,	'John',	'Ball',	'john.ball@test.xx'),
(51,	'Ken',	'Cain',	'ken.cain@test.xx'),
(52,	'Laverne',	'Lloyd',	'laverne.lloyd@test.xx'),
(53,	'Stacy',	'Perez',	'stacy.perez@test.xx'),
(54,	'Jason',	'Nguyen',	'jason.nguyen@test.xx'),
(55,	'Sylvia',	'Page',	'sylvia.page@test.xx'),
(56,	'Robin',	'Floyd',	'robin.floyd@test.xx'),
(57,	'Bobbie',	'Rose',	'bobbie.rose@test.xx'),
(58,	'James',	'Daniels',	'james.daniels@test.xx'),
(59,	'Melinda',	'Parsons',	'melinda.parsons@test.xx'),
(60,	'Alonzo',	'Powell',	'alonzo.powell@test.xx'),
(61,	'Erik',	'Stevenson',	'erik.stevenson@test.xx'),
(62,	'Micheal',	'Duncan',	'micheal.duncan@test.xx'),
(63,	'Tami',	'Lewis',	'tami.lewis@test.xx'),
(64,	'Rene',	'Griffin',	'rene.griffin@test.xx'),
(65,	'Kathryn',	'Russell',	'kathryn.russell@test.xx'),
(66,	'Rhonda',	'Garrett',	'rhonda.garrett@test.xx'),
(67,	'Wallace',	'Mendez',	'wallace.mendez@test.xx'),
(68,	'Ramiro',	'Fowler',	'ramiro.fowler@test.xx'),
(69,	'Elsa',	'Colon',	'elsa.colon@test.xx'),
(70,	'Owen',	'Curry',	'owen.curry@test.xx'),
(71,	'Amos',	'Goodman',	'amos.goodman@test.xx'),
(72,	'Olivia',	'Lyons',	'olivia.lyons@test.xx'),
(73,	'Robert',	'Wade',	'robert.wade@test.xx'),
(74,	'Courtney',	'Becker',	'courtney.becker@test.xx'),
(75,	'Pat',	'Olson',	'pat.olson@test.xx'),
(76,	'Erma',	'Torres',	'erma.torres@test.xx'),
(77,	'Melody',	'Hall',	'melody.hall@test.xx'),
(78,	'Donna',	'Baldwin',	'donna.baldwin@test.xx'),
(79,	'Cornelius',	'Larson',	'cornelius.larson@test.xx'),
(80,	'Roberta',	'Dennis',	'roberta.dennis@test.xx'),
(81,	'Velma',	'Howell',	'velma.howell@test.xx'),
(82,	'Brandon',	'Kim',	'brandon.kim@test.xx'),
(83,	'Erick',	'Hawkins',	'erick.hawkins@test.xx'),
(84,	'Al',	'Pittman',	'al.pittman@test.xx'),
(85,	'Dewey',	'Brock',	'dewey.brock@test.xx'),
(86,	'Jessie',	'Hopkins',	'jessie.hopkins@test.xx'),
(87,	'Kathy',	'Miles',	'kathy.miles@test.xx'),
(88,	'Harry',	'Gonzalez',	'harry.gonzalez@test.xx'),
(89,	'Anthony',	'Lawrence',	'anthony.lawrence@test.xx'),
(90,	'Orlando',	'Barker',	'orlando.barker@test.xx'),
(91,	'Mandy',	'Hampton',	'mandy.hampton@test.xx'),
(92,	'Darlene',	'Mcgee',	'darlene.mcgee@test.xx'),
(93,	'Matt',	'Grant',	'matt.grant@test.xx'),
(94,	'Leah',	'Knight',	'leah.knight@test.xx'),
(95,	'Jermaine',	'Harrison',	'jermaine.harrison@test.xx'),
(96,	'Jody',	'Sharp',	'jody.sharp@test.xx'),
(97,	'Guadalupe',	'Adkins',	'guadalupe.adkins@test.xx'),
(98,	'Whitney',	'Wright',	'whitney.wright@test.xx'),
(99,	'Wanda',	'Fletcher',	'wanda.fletcher@test.xx'),
(100,	'Debbie',	'Fields',	'debbie.fields@test.xx'),
(101,	'Shaun',	'Moore',	'shaun.moore@test.xx'),
(102,	'Jerry',	'Santos',	'jerry.santos@test.xx'),
(103,	'Meghan',	'Stevens',	'meghan.stevens@test.xx'),
(104,	'Shawn',	'Pratt',	'shawn.pratt@test.xx'),
(105,	'Deborah',	'Stewart',	'deborah.stewart@test.xx'),
(106,	'Gene',	'Greene',	'gene.greene@test.xx'),
(107,	'Melissa',	'Elliott',	'melissa.elliott@test.xx'),
(108,	'Peggy',	'Francis',	'peggy.francis@test.xx'),
(109,	'Rachel',	'Diaz',	'rachel.diaz@test.xx'),
(110,	'Oscar',	'Williams',	'oscar.williams@test.xx'),
(111,	'Gretchen',	'Moody',	'gretchen.moody@test.xx'),
(112,	'Lee',	'Jackson',	'lee.jackson@test.xx'),
(113,	'Bonnie',	'Webb',	'bonnie.webb@test.xx'),
(114,	'June',	'Taylor',	'june.taylor@test.xx'),
(115,	'Angela',	'Goodwin',	'angela.goodwin@test.xx'),
(116,	'Billy',	'Lawson',	'billy.lawson@test.xx'),
(117,	'Seth',	'Strickland',	'seth.strickland@test.xx'),
(118,	'Tony',	'Richards',	'tony.richards@test.xx');

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_group` (`id`, `name`, `description`) VALUES
(1,	'Test 1',	'Test 1 description'),
(2,	'Test 2',	'Test 2 description'),
(3,	'Test 3',	'Test 3 description'),
(4,	'Test 4',	'Test 4 description'),
(5,	'Test 5',	'Test 5 description'),
(6,	'Test 6',	'Test 6 description'),
(7,	'Test 7',	'Test 7 description');

DROP TABLE IF EXISTS `xpage`;
CREATE TABLE `xpage` (
  `xpage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`xpage_id`),
  KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `xpage` (`xpage_id`, `action`, `parent_id`, `name`, `sort`) VALUES
(1,	1,	NULL,	'Test page 1',	0),
(2,	1,	NULL,	'Test page 2',	80),
(3,	0,	4,	'Test page 3',	70),
(4,	0,	8,	'Test page 4',	60),
(5,	1,	8,	'Test page 5',	50),
(6,	1,	7,	'Test page 6',	30),
(7,	0,	9,	'Test page 7',	20),
(8,	0,	NULL,	'Test page 8',	40),
(9,	1,	NULL,	'Test page 9',	10),
(10,	1,	NULL,	'Test page 10',	90);

DROP TABLE IF EXISTS `_user`;
CREATE TABLE `_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` int(10) unsigned NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `surname` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `last_login` datetime NOT NULL,
  `amount` double NOT NULL,
  `avatar` varchar(128) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `timestamp` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `_user` (`user_id`, `action`, `name`, `surname`, `email`, `last_login`, `amount`, `avatar`, `order`, `timestamp`) VALUES
(1,	0,	NULL,	'Doe',	'john.doe@test.xx',	'2014-09-01 06:27:32',	1561.456542,	'/avatar/01.png',	100,	1418255325),
(2,	1,	'Peter',	'Larson',	'peter.larson@test.xx',	'2014-09-09 13:37:32',	15220.654,	'/avatar/02.png',	160,	1418255330),
(3,	1,	'Claude',	'Graves',	'claude.graves@test.xx',	'2014-09-02 14:17:32',	9876.465498,	'/avatar/03.png',	180,	1418255311),
(4,	0,	'Stuart',	'Norman',	'stuart.norman@test.xx',	'2014-09-09 18:39:18',	98766.2131,	'/avatar/04.png',	120,	1418255328),
(5,	1,	'Kathy',	'Arnold',	'kathy.arnold@test.xx',	'2014-09-07 10:24:07',	456.987,	'/avatar/05.png',	140,	1418155313),
(6,	0,	'Jan',	'Wilson',	'jan.wilson@test.xx',	'2014-09-03 13:15:22',	123,	'/avatar/06.png',	150,	1418255318),
(7,	0,	'Alberta',	'Erickson',	'alberta.erickson@test.xx',	'2014-08-06 13:37:17',	98753.654,	'/avatar/07.png',	110,	1418255327),
(8,	1,	'Ada',	'Wells',	'ada.wells@test.xx',	'2014-08-12 11:25:16',	852.3654,	'/avatar/08.png',	70,	1418255332),
(9,	0,	'Ethel',	'Figueroa',	'ethel.figueroa@test.xx',	'2014-09-05 10:23:26',	45695.986,	'/avatar/09.png',	20,	1418255305),
(10,	1,	'Ian',	'Goodwin',	'ian.goodwin@test.xx',	'2014-09-04 12:26:19',	1236.9852,	'/avatar/10.png',	130,	1418255331),
(11,	1,	'Francis',	'Hayes',	'francis.hayes@test.xx',	'2014-09-03 10:16:17',	5498.345,	'/avatar/11.png',	0,	1418255293),
(12,	0,	'Erma',	'Burns',	'erma.burns@test.xx',	'2014-07-02 15:42:15',	63287.9852,	'/avatar/12.png',	60,	1418255316),
(13,	1,	'Kristina',	'Jenkins',	'kristina.jenkins@test.xx',	'2014-08-20 14:39:43',	74523.96549,	'/avatar/13.png',	40,	1418255334),
(14,	0,	'Virgil',	'Hunt',	'virgil.hunt@test.xx',	'2014-08-12 16:09:38',	65654.6549,	'/avatar/14.png',	30,	1418255276),
(15,	1,	'Max',	'Martin',	'max.martin@test.xx',	'2014-09-01 12:14:20',	541236.5495,	'/avatar/15.png',	170,	1418255317),
(16,	1,	'Melody',	'Manning',	'melody.manning@test.xx',	'2014-09-02 12:26:20',	9871.216,	'/avatar/16.png',	50,	1418255281),
(17,	1,	'Catherine',	'Todd',	'catherine.todd@test.xx',	'2014-06-11 15:14:39',	100.2,	'/avatar/17.png',	10,	1418255313),
(18,	0,	'Douglas',	'Stanley',	'douglas.stanley@test.xx',	'2014-04-16 15:22:18',	900,	'/avatar/18.png',	90,	1418255332),
(19,	1,	'Patti',	'Diaz',	'patti.diaz@test.xx',	'2014-09-11 12:17:16',	1500,	'/avatar/19.png',	80,	1418255275);

-- 2015-02-01 14:11:48