
DROP TABLE DETAIL_ACHAT;

DROP TABLE ACHAT;

DROP TABLE APPARTIENT;

DROP TABLE SERIE;

DROP TABLE BD;

DROP TABLE CARTE;

DROP TABLE AUTEUR;

Drop TABLE EDITEUR;

DROP TABLE GENRE;


DROP TABLE DETAIL_ACHAT;

DROP TABLE ACHAT;

DROP TABLE APPARTIENT;

DROP TABLE SERIE;

DROP TABLE BD;

DROP TABLE CARTE;

DROP TABLE AUTEUR;

Drop TABLE EDITEUR;

DROP TABLE GENRE;

CREATE TABLE GENRE ( 
	no_genre number(3) NOT NULL , 
	libelle_genre VARCHAR (100) , 
	PRIMARY KEY (no_genre) 
);

CREATE TABLE EDITEUR ( 
	no_edit number(3)  NOT NULL, 
	nom_edit VARCHAR (100) , 
	PRIMARY KEY (no_edit) 
);

CREATE TABLE AUTEUR ( 
	no_auteur number(3) NOT NULL , 
	nom_auteur VARCHAR (100) , 
	prenom_auteur VARCHAR (100) , 
	PRIMARY KEY (no_auteur) 
);

CREATE TABLE CARTE ( 
	no_carte number(3) NOT NULL , 
	nom_tit VARCHAR (100) , 
	date_carte date , 
	nb_bons number(3), 
	mail VARCHAR(100), 
	PRIMARY KEY (no_carte) 
);

CREATE TABLE BD ( 
	no_BD number(3)  NOT NULL, 
	titre_bd VARCHAR (100)  , 
	anee_sortie number(4) , 
	prix_unit number(6,2) , 
	qte_stock number(3)  , 
	no_scen number(3) , 
	no_dess number(3), 
	no_gen number(3) , 
	no_edit number(3), 
	FOREIGN KEY (no_scen) REFERENCES AUTEUR(no_auteur), 
	FOREIGN KEY (no_dess) REFERENCES AUTEUR(no_auteur), 
	FOREIGN KEY (no_gen) REFERENCES GENRE(no_genre), 
	FOREIGN KEY (no_edit) REFERENCES EDITEUR(no_edit), 
	PRIMARY KEY (no_BD) 
);

CREATE TABLE SERIE ( 
	no_serie number(3)  NOT NULL, 
	nom_serie VARCHAR (100) , 
	no_createur number(3) , 
	FOREIGN KEY (no_createur) REFERENCES AUTEUR(no_auteur), 
	PRIMARY KEY (no_serie) 
);

CREATE TABLE APPARTIENT ( 
	no_bd number(3) NOT NULL , 
	nom_ordre number(3) , 
	no_serie number(3) , 
	PRIMARY KEY (no_bd), 
	FOREIGN KEY (no_bd) REFERENCES BD(no_bd), 
	FOREIGN KEY (no_serie) REFERENCES SERIE(no_serie) 
 
 
);

CREATE TABLE ACHAT ( 
	no_achat number(3) NOT NULL , 
	date_achat date , 
	nb_bons_util number(3), 
	no_carte number(3), 
	PRIMARY KEY (no_achat), 
	FOREIGN KEY (no_carte) REFERENCES CARTE(no_carte) 
 
);

CREATE TABLE DETAIL_ACHAT ( 
	no_achat number(3) NOT NULL , 
	no_bd number(3)  NOT NULL, 
	qte number(3), 
	PRIMARY KEY (no_achat,no_bd), 
	FOREIGN KEY (no_achat) REFERENCES ACHAT(no_achat), 
	FOREIGN KEY (no_bd) REFERENCES BD(no_bd) 
);


insert into  GENRE values(0,'humour');

insert into  GENRE values(1,'aventure');

insert into  GENRE values(2,'fantastique');

insert into  GENRE values(3,'manga');

insert into  GENRE values(4,'science-fiction');

insert into  GENRE values(5,'autobiographie');

insert into  EDITEUR values(0,'Albert René');

insert into  EDITEUR values(1,'Lucky Productions');

insert into  EDITEUR values(2,'Les Humanoïdes Associés');

insert into  EDITEUR values(3,'Casterman');

insert into  EDITEUR values(4,'Dargaud');

insert into  EDITEUR values(5,'Claude Lefrancq Éditeur (CLE)');

insert into  EDITEUR values(6,'Dupuis');

insert into  EDITEUR values(7,'Glénat');

insert into  EDITEUR values(8,'Ankama Éditions');

insert into  EDITEUR values(9,' 6 Pieds Sous Terre');

insert into  EDITEUR values(10,'Atrabile');

insert into  EDITEUR values(11,'Delcourt');

insert into  EDITEUR values(12,'Rue de Sèvres');

insert into  AUTEUR values(0,'Uderzo','');

insert into  AUTEUR values(1,'René','Goscinny');

insert into  AUTEUR values(2,'Didier','Conrad');

insert into  AUTEUR values(3,'Jean-Yves','Ferri');

insert into  AUTEUR values(4,'Morris','');

insert into  AUTEUR values(5,'bob','De Groote');

insert into  AUTEUR values(6,'Patrick','Nordmann');

insert into  AUTEUR values(7,'Achdé','');

insert into  AUTEUR values(8,'Laurent','Gerra');

insert into  AUTEUR values(9,'Daniel','Pennac');

insert into  AUTEUR values(10,'Jul','');

insert into  AUTEUR values(11,'Frank','Margerin');

insert into  AUTEUR values(12,'Hergé','');

insert into  AUTEUR values(13,'Fred','');

insert into  AUTEUR values(14,'Jacques','Geron');

insert into  AUTEUR values(15,'André-Paul','Duchâteau');

insert into  AUTEUR values(16,'Maurice','Leblanc');

insert into  AUTEUR values(17,'Magda','Seron');

insert into  AUTEUR values(18,'Denis','Lapière');

insert into  AUTEUR values(19,'Oda','Eiichiro');

insert into  AUTEUR values(20,'Bablet,','Mathieu');

insert into  AUTEUR values(21,'Bablet','Mathieu');

insert into  AUTEUR values(22,'Fabcaro','');

insert into  AUTEUR values(23,'Peeters','Frederik');

insert into  AUTEUR values(24,'Timothé','Le Boucher');

insert into  AUTEUR values(25,'Renner','Benjamin');

insert into  AUTEUR values(26,'McCloud','Scott');

insert into  CARTE values(0,'Marc Toussaint',TO_DATE('22/01/2021','DD/MM/YYYY'),5,'marco67@gmail.com');

insert into  CARTE values(1,'Joseph Reed',TO_DATE('24/01/2021','DD/MM/YYYY'),8,'joseph@orange.fr');

insert into  CARTE values(2,'Aline Martin',TO_DATE('25/01/2021','DD/MM/YYYY'),21,'alineMartin@gmail.com');

insert into  CARTE values(3,'Nathalie Petit',TO_DATE('25/01/2021','DD/MM/YYYY'),19,'nathalie.paris@outlook.com');

insert into  CARTE values(4,'George  Rousseau',TO_DATE('26/01/2021','DD/MM/YYYY'),11,'rous.george@gmail.com');

insert into  CARTE values(5,'Loic Muller',TO_DATE('26/01/2021','DD/MM/YYYY'),12,'loic.muller@gmail.com');

insert into  CARTE values(6,'Ruth Kohler',TO_DATE('27/01/2021','DD/MM/YYYY'),11,'ruth.koko@gmail.com');

insert into  CARTE values(7,'Sandie Marchal',TO_DATE('27/01/2021','DD/MM/YYYY'),7,'marchalsandie@orange.fr');

insert into  CARTE values(8,'Julien Leblanc',TO_DATE('28/01/2021','DD/MM/YYYY'),14,'juju.lb@orange.fr');

insert into  CARTE values(9,'Rémi Loyd',TO_DATE('29/01/2021','DD/MM/YYYY'),12,'remi.loyd@outlook.com');

insert into BD values(0,'Le Grand Fossé',1980,10.5,210,0,0,0,0);

insert into BD values(1,'L’Odyssée d’Astérix',1981,11.5,23,0,0,0,0);

insert into BD values(2,'Le fils d’Astérix',1983,12,45,0,0,0,0);

insert into BD values(3,'Astérix chez Rahàzade',1987,11.2,76,0,0,0,0);

insert into BD values(4,'La Rose et le Glaive',1991,10.5,56,0,0,0,0);

insert into BD values(5,'La Galère d’Obélix',1996,10.5,95,0,0,0,0);

insert into BD values(6,'Astérix et Latraviata',2001,10.5,86,0,0,0,0);

insert into BD values(7,'Astérix et la Rentrée Gauloise',1993,11.5,45,0,0,0,0);

insert into BD values(8,'Le Ciel lui tombe sur la tête',2005,12,112,0,0,0,0);

insert into BD values(9,'L’anniversaire d’Astérix et Obelix – Le Livre d’Or',2009,11.2,34,0,0,0,0);

insert into BD values(10,'Astérix chez les Pictes',2013,10.5,54,3,2,0,0);

insert into BD values(11,'Le Papyrus de César',2015,10.5,78,3,2,0,0);

insert into BD values(12,'Astérix et la Transitalique',2017,11.2,65,3,2,0,0);

insert into BD values(13,'La Fille de Vercingétorix',2019,10.5,55,3,2,0,0);

insert into BD values(14,'Asterix et le griffon',2021,10.5,332,3,2,0,0);

insert into BD values(15,'Marcel Dalton',1998,9.8,23,5,4,1,1);

insert into BD values(16,'Le prophète',2000,10.3,34,6,4,1,1);

insert into BD values(17,'L artiste-peintre',2001,11.2,45,5,4,1,1);

insert into BD values(18,'La légende de l Ouest',2002,10.4,56,6,4,1,1);

insert into BD values(19,'La belle Province',2004,9.8,67,8,7,1,1);

insert into BD values(20,'La corde au cou',2006,9.8,78,8,7,1,1);

insert into BD values(21,'L Homme de Washington',2008,10.3,89,8,7,1,1);

insert into BD values(22,'Lucky Luke contre Pinkerton',2010,11.2,98,9,7,1,1);

insert into BD values(23,'Cavalier seul',2012,10.4,76,9,7,1,1);

insert into BD values(24,'Les tontons Dalton',2014,9.8,65,8,7,1,1);

insert into BD values(25,'La Terre promise',2016,9.8,54,10,7,1,1);

insert into BD values(26,'Un cow-boy à Paris',2018,10.3,43,10,7,1,1);

insert into BD values(27,'Radio Lucien',1982,10.5,32,11,11,0,2);

insert into BD values(28,'Chez Lucien',1985,10.5,21,11,11,0,2);

insert into BD values(29,'Lulu s maque',1987,11.5,13,11,11,0,2);

insert into BD values(30,'Lucien se met au vert',1989,12,24,11,11,0,2);

insert into BD values(31,'Votez Rocky',1984,11.2,35,11,11,0,2);

insert into BD values(32,'Bananes métalliques',1982,10.5,46,11,11,0,2);

insert into BD values(33,'Ricky chez les Ricains',1998,10.5,47,11,11,0,2);

insert into BD values(34,'Week-end motard',2000,11.2,58,11,11,0,2);

insert into BD values(35,'Toujours la banane',2008,10.5,69,11,11,0,2);

insert into BD values(36,'Père et fils',2009,10.5,70,11,11,0,2);

insert into BD values(37,'L Etoile Mystérieuse',1942,9.8,75,12,12,1,3);

insert into BD values(38,'Le Secret de la Licorne',1943,10.3,86,12,12,1,3);

insert into BD values(39,'Le Trésor de Rackham le Rouge',1944,11.2,75,12,12,1,3);

insert into BD values(40,'Les Sept Boules de Cristal',1948,10.4,64,12,12,1,3);

insert into BD values(41,'Le Temple du Soleil',1949,9.8,53,12,12,1,3);

insert into BD values(42,'Au Pays de l Or Noir',1951,9.8,42,12,12,1,3);

insert into BD values(43,'Objectif Lune',1953,10.3,31,12,12,1,3);

insert into BD values(44,'On a marché sur la Lune',1954,11.2,14,12,12,1,3);

insert into BD values(45,'L Affaire Tournesol',1956,10.4,25,12,12,1,3);

insert into BD values(46,'Coke en Stock',1958,9.8,36,12,12,1,3);

insert into BD values(47,'Tintin au Tibet',1960,9.8,47,12,12,1,3);

insert into BD values(48,'Les Bijoux de la Castafiore',1963,10.3,58,12,12,1,3);

insert into BD values(49,'Vol 714 pour Sydney',1968,9.8,69,12,12,1,3);

insert into BD values(50,'Tintin et les Picaros',1976,10.3,70,12,12,1,3);

insert into BD values(51,'L île des brigadiers',1975,10.4,96,13,13,2,4);

insert into BD values(52,'"A l heure su second ""T"""',1975,9.8,85,13,13,2,4);

insert into BD values(53,'"L Arche du ""A"""',1976,9.8,74,13,13,2,4);

insert into BD values(54,'L Ane en atoll',1977,10.3,63,13,13,2,4);

insert into BD values(55,'La Mémémoire',1977,11.2,52,13,13,2,4);

insert into BD values(56,'Le Chat à neuf queues',1978,10.4,41,13,13,2,4);

insert into BD values(57,'Le Secret de Félicien',1981,9.8,54,13,13,2,4);

insert into BD values(58,'L Enfer des épouvantails',1983,9.8,43,13,13,2,4);

insert into BD values(59,'Le Diable du peintre',1987,10.3,32,13,13,2,4);

insert into BD values(60,'Le Train où vont les choses',2013,11.2,21,13,13,2,4);

insert into BD values(61,'Le bouchon de cristal',1989,12.2,13,15,14,1,5);

insert into BD values(62,'813, la double vie ',1990,13.35,24,15,14,1,5);

insert into BD values(63,'813, les trois crimes ',1991,14.3,35,15,14,1,5);

insert into BD values(64,'La demoiselle aux yeux verts',1992,14.85,46,15,14,1,5);

insert into BD values(65,'L aiguille creuse ',1993,15.2,47,15,14,1,5);

insert into BD values(66,'Victor de la Brigade mondaine ',1998,15.5,58,15,14,1,5);

insert into BD values(67,'Jouet d enfer',1991,7,69,18,17,2,6);

insert into BD values(68,'L île perdue',1992,6.85,70,18,17,2,6);

insert into BD values(69,'Le réveil',1993,7,75,18,17,2,6);

insert into BD values(70,'Le piège',1994,7.9,86,18,17,2,6);

insert into BD values(71,'Cauchemars',1996,6.8,75,18,17,2,6);

insert into BD values(72,'Le tueur',1997,7.15,64,18,17,2,6);

insert into BD values(73,'L innocence',1998,8.1,53,18,17,2,6);

insert into BD values(74,'Les yeux de feu',1999,7.55,42,18,17,2,6);

insert into BD values(75,'Message d outre-temps',2000,7,31,18,17,2,6);

insert into BD values(76,'Ange',2002,6.85,14,18,17,2,6);

insert into BD values(77,'Une vie éternelle',2004,7,25,18,17,2,6);

insert into BD values(78,'Assassin !',2006,7.9,36,18,17,2,6);

insert into BD values(79,'Une vie d enfer',2007,7.15,47,18,17,2,6);

insert into BD values(80,' à l aube d une grande aventure',2000,7.55,58,19,19,3,7);

insert into BD values(81,'OK, let s stand up ! ',2005,7,69,19,19,3,7);

insert into BD values(82,'Luffy Versus la bande à Baggy !! ',2013,7,70,19,19,3,7);

insert into BD values(83,'Piété filiale ',2003,7.15,96,19,19,3,7);

insert into BD values(84,'Attaque au clair de lune ',2013,7.55,85,19,19,3,7);

insert into BD values(85,'Pour qui sonne le glas ',2013,7,74,19,19,3,7);

insert into BD values(86,'La grande promesse',2001,6.85,63,19,19,3,7);

insert into BD values(87,'Le vieux schnock ',2001,7,52,19,19,3,7);

insert into BD values(88,' Je ne mourrai pas ! ',2013,7.9,41,19,19,3,7);

insert into BD values(89,' Une jeune fille en pleurs',2002,6.8,44,19,19,3,7);

insert into BD values(90,'Shangri-La',2016,9.9,12,21,20,4,8);

insert into BD values(91,'Zaï zaï zaï zaï',2015,13.6,26,22,22,0,9);

insert into BD values(92,'Pilules bleues',2001,14.5,14,13,13,5,10);

insert into BD values(93,'Ces jours qui disparaissent',2017,11.4,17,24,24,2,7);

insert into BD values(94,'Le Grand Méchant Renard (2015)',2014,16.7,38,25,25,0,11);

insert into BD values(95,'Le Sculpteur',2015,15.75,32,26,26,2,12);

insert into  SERIE values(0,'Astérix',1);

insert into  SERIE values(1,'Lucky Luke',4);

insert into  SERIE values(2,'Lucien',11);

insert into  SERIE values(3,'Tintin',12);

insert into  SERIE values(4,'Philémon',13);

insert into  SERIE values(5,'Arsène Lupin',16);

insert into  SERIE values(6,'Charly',18);

insert into  SERIE values(7,'One piece',19);

insert into APPARTIENT values(0,25,0);

insert into APPARTIENT values(1,26,0);

insert into APPARTIENT values(2,27,0);

insert into APPARTIENT values(3,28,0);

insert into APPARTIENT values(4,29,0);

insert into APPARTIENT values(5,30,0);

insert into APPARTIENT values(6,31,0);

insert into APPARTIENT values(7,32,0);

insert into APPARTIENT values(8,33,0);

insert into APPARTIENT values(9,34,0);

insert into APPARTIENT values(10,35,0);

insert into APPARTIENT values(11,36,0);

insert into APPARTIENT values(12,37,0);

insert into APPARTIENT values(13,38,0);

insert into APPARTIENT values(14,39,0);

insert into APPARTIENT values(15,68,1);

insert into APPARTIENT values(16,69,1);

insert into APPARTIENT values(17,70,1);

insert into APPARTIENT values(18,71,1);

insert into APPARTIENT values(19,72,1);

insert into APPARTIENT values(20,73,1);

insert into APPARTIENT values(21,74,1);

insert into APPARTIENT values(22,75,1);

insert into APPARTIENT values(23,76,1);

insert into APPARTIENT values(24,77,1);

insert into APPARTIENT values(25,78,1);

insert into APPARTIENT values(26,79,1);

insert into APPARTIENT values(27,1,2);

insert into APPARTIENT values(28,2,2);

insert into APPARTIENT values(29,3,2);

insert into APPARTIENT values(30,4,2);

insert into APPARTIENT values(31,5,2);

insert into APPARTIENT values(32,6,2);

insert into APPARTIENT values(33,7,2);

insert into APPARTIENT values(34,8,2);

insert into APPARTIENT values(35,9,2);

insert into APPARTIENT values(36,10,2);

insert into APPARTIENT values(37,10,3);

insert into APPARTIENT values(38,11,3);

insert into APPARTIENT values(39,12,3);

insert into APPARTIENT values(40,13,3);

insert into APPARTIENT values(41,14,3);

insert into APPARTIENT values(42,15,3);

insert into APPARTIENT values(43,16,3);

insert into APPARTIENT values(44,17,3);

insert into APPARTIENT values(45,18,3);

insert into APPARTIENT values(46,19,3);

insert into APPARTIENT values(47,20,3);

insert into APPARTIENT values(48,21,3);

insert into APPARTIENT values(49,22,3);

insert into APPARTIENT values(50,23,3);

insert into APPARTIENT values(51,6,4);

insert into APPARTIENT values(52,7,4);

insert into APPARTIENT values(53,8,4);

insert into APPARTIENT values(54,9,4);

insert into APPARTIENT values(55,10,4);

insert into APPARTIENT values(56,12,4);

insert into APPARTIENT values(57,13,4);

insert into APPARTIENT values(58,14,4);

insert into APPARTIENT values(59,15,4);

insert into APPARTIENT values(60,16,4);

insert into APPARTIENT values(61,1,5);

insert into APPARTIENT values(62,2,5);

insert into APPARTIENT values(63,3,5);

insert into APPARTIENT values(64,4,5);

insert into APPARTIENT values(65,5,5);

insert into APPARTIENT values(66,6,5);

insert into APPARTIENT values(67,1,6);

insert into APPARTIENT values(68,2,6);

insert into APPARTIENT values(69,3,6);

insert into APPARTIENT values(70,4,6);

insert into APPARTIENT values(71,5,6);

insert into APPARTIENT values(72,6,6);

insert into APPARTIENT values(73,7,6);

insert into APPARTIENT values(74,8,6);

insert into APPARTIENT values(75,9,6);

insert into APPARTIENT values(76,10,6);

insert into APPARTIENT values(77,11,6);

insert into APPARTIENT values(78,12,6);

insert into APPARTIENT values(79,13,6);

insert into APPARTIENT values(80,1,7);

insert into APPARTIENT values(81,10,7);

insert into APPARTIENT values(82,2,7);

insert into APPARTIENT values(83,3,7);

insert into APPARTIENT values(84,4,7);

insert into APPARTIENT values(85,5,7);

insert into APPARTIENT values(86,6,7);

insert into APPARTIENT values(87,7,7);

insert into APPARTIENT values(88,8,7);

insert into APPARTIENT values(89,9,7);

insert into APPARTIENT values(90,1,null);

insert into APPARTIENT values(91,1,null);

insert into APPARTIENT values(92,1,null);

insert into APPARTIENT values(93,1,null);

insert into APPARTIENT values(94,1,null);

insert into APPARTIENT values(95,1,null);

insert into  ACHAT values(0,TO_DATE('22/01/2021','DD/MM/YYYY'),0,0);

insert into  ACHAT values(1,TO_DATE('24/01/2021','DD/MM/YYYY'),0,1);

insert into  ACHAT values(2,TO_DATE('25/01/2021','DD/MM/YYYY'),0,2);

insert into  ACHAT values(3,TO_DATE('25/01/2021','DD/MM/YYYY'),0,3);

insert into  ACHAT values(4,TO_DATE('26/01/2021','DD/MM/YYYY'),0,4);

insert into  ACHAT values(5,TO_DATE('26/01/2021','DD/MM/YYYY'),0,5);

insert into  ACHAT values(6,TO_DATE('27/01/2021','DD/MM/YYYY'),0,6);

insert into  ACHAT values(7,TO_DATE('27/01/2021','DD/MM/YYYY'),0,7);

insert into  ACHAT values(8,TO_DATE('28/01/2021','DD/MM/YYYY'),0,8);

insert into  ACHAT values(9,TO_DATE('29/01/2021','DD/MM/YYYY'),0,9);

insert into  DETAIL_ACHAT values(0,25,1);

insert into  DETAIL_ACHAT values(0,26,2);

insert into  DETAIL_ACHAT values(0,27,1);

insert into  DETAIL_ACHAT values(0,28,1);

insert into  DETAIL_ACHAT values(1,12,1);

insert into  DETAIL_ACHAT values(1,14,2);

insert into  DETAIL_ACHAT values(1,28,2);

insert into  DETAIL_ACHAT values(1,30,1);

insert into  DETAIL_ACHAT values(1,38,1);

insert into  DETAIL_ACHAT values(1,56,1);

insert into  DETAIL_ACHAT values(2,4,1);

insert into  DETAIL_ACHAT values(2,12,2);

insert into  DETAIL_ACHAT values(2,14,2);

insert into  DETAIL_ACHAT values(2,21,1);

insert into  DETAIL_ACHAT values(2,28,2);

insert into  DETAIL_ACHAT values(2,30,2);

insert into  DETAIL_ACHAT values(2,38,1);

insert into  DETAIL_ACHAT values(2,54,1);

insert into  DETAIL_ACHAT values(2,56,1);

insert into  DETAIL_ACHAT values(2,72,2);

insert into  DETAIL_ACHAT values(2,79,3);

insert into  DETAIL_ACHAT values(2,84,2);

insert into  DETAIL_ACHAT values(2,86,1);

insert into  DETAIL_ACHAT values(3,10,1);

insert into  DETAIL_ACHAT values(3,18,1);

insert into  DETAIL_ACHAT values(3,30,2);

insert into  DETAIL_ACHAT values(3,37,2);

insert into  DETAIL_ACHAT values(3,43,2);

insert into  DETAIL_ACHAT values(3,54,1);

insert into  DETAIL_ACHAT values(3,71,1);

insert into  DETAIL_ACHAT values(3,84,2);

insert into  DETAIL_ACHAT values(3,85,3);

insert into  DETAIL_ACHAT values(3,86,4);

insert into  DETAIL_ACHAT values(4,75,1);

insert into  DETAIL_ACHAT values(4,76,1);

insert into  DETAIL_ACHAT values(4,79,1);

insert into  DETAIL_ACHAT values(4,81,2);

insert into  DETAIL_ACHAT values(4,84,1);

insert into  DETAIL_ACHAT values(4,85,2);

insert into  DETAIL_ACHAT values(4,88,2);

insert into  DETAIL_ACHAT values(4,89,1);

insert into  DETAIL_ACHAT values(5,57,2);

insert into  DETAIL_ACHAT values(5,58,1);

insert into  DETAIL_ACHAT values(5,59,1);

insert into  DETAIL_ACHAT values(5,64,1);

insert into  DETAIL_ACHAT values(5,65,2);

insert into  DETAIL_ACHAT values(5,69,3);

insert into  DETAIL_ACHAT values(5,70,1);

insert into  DETAIL_ACHAT values(5,71,1);

insert into  DETAIL_ACHAT values(6,78,1);

insert into  DETAIL_ACHAT values(6,80,2);

insert into  DETAIL_ACHAT values(6,82,3);

insert into  DETAIL_ACHAT values(6,85,2);

insert into  DETAIL_ACHAT values(6,88,1);

insert into  DETAIL_ACHAT values(6,89,2);

insert into  DETAIL_ACHAT values(7,3,1);

insert into  DETAIL_ACHAT values(7,4,1);

insert into  DETAIL_ACHAT values(7,5,1);

insert into  DETAIL_ACHAT values(7,29,1);

insert into  DETAIL_ACHAT values(7,30,2);

insert into  DETAIL_ACHAT values(7,31,1);

insert into  DETAIL_ACHAT values(8,15,1);

insert into  DETAIL_ACHAT values(8,16,1);

insert into  DETAIL_ACHAT values(8,17,1);

insert into  DETAIL_ACHAT values(8,18,1);

insert into  DETAIL_ACHAT values(8,19,1);

insert into  DETAIL_ACHAT values(8,20,1);

insert into  DETAIL_ACHAT values(8,21,1);

insert into  DETAIL_ACHAT values(8,22,2);

insert into  DETAIL_ACHAT values(8,23,1);

insert into  DETAIL_ACHAT values(8,24,2);

insert into  DETAIL_ACHAT values(8,25,1);

insert into  DETAIL_ACHAT values(8,26,1);

insert into  DETAIL_ACHAT values(9,21,1);

insert into  DETAIL_ACHAT values(9,22,2);

insert into  DETAIL_ACHAT values(9,23,2);

insert into  DETAIL_ACHAT values(9,37,1);

insert into  DETAIL_ACHAT values(9,38,1);

insert into  DETAIL_ACHAT values(9,39,1);

insert into  DETAIL_ACHAT values(9,63,2);

insert into  DETAIL_ACHAT values(9,64,1);

insert into  DETAIL_ACHAT values(9,65,1);

SELECT titre_bd FROM BD JOIN APPARTIENT USING(no_bd) JOIN SERIE USING(no_serie) 
WHERE nom_serie = 'One piece';

SELECT * FROM BD JOIN APPARTIENT USING(no_bd) JOIN SERIE USING(no_serie) 
WHERE nom_serie = 'Astérix' AND no_createur != no_dess;

Select * FROM AUTEUR 
JOIN BD 
ON(AUTEUR.no_auteur = BD.no_dess) 
JOIN APPARTIENT USING(no_bd) JOIN SERIE USING(no_serie) 
WHERE no_dess = no_scen AND no_dess != no_createur ;

SELECT COUNT(*)AS Titre_Hergé FROM BD JOIN APPARTIENT USING(no_bd) JOIN SERIE USING(no_serie) 
WHERE no_createur = (SELECT no_auteur FROM AUTEUR WHERE nom_auteur = 'Hergé');

SELECT DISTINCT nom_serie FROM SERIE JOIN APPARTIENT USING (no_serie) JOIN BD USING(no_bd) 
WHERE no_scen = no_createur  AND no_dess = no_createur;

SELECT DISTINCT NOM_TIT FROM DETAIL_ACHAT JOIN BD USING (no_bd) JOIN ACHAT USING(no_achat) JOIN CARTE USING(no_carte) 
JOIN APPARTIENT USING (no_bd) JOIN SERIE USING(no_serie) 
WHERE nom_serie = 'Astérix' 
------ 
SELECT NOM_TIT FROM( 
SELECT DISTINCT NOM_TIT,SUM(qte) AS nb FROM DETAIL_ACHAT JOIN BD USING (no_bd) JOIN ACHAT USING(no_achat) JOIN CARTE USING(no_carte) 
JOIN APPARTIENT USING (no_bd) JOIN SERIE USING(no_serie) 
WHERE nom_serie = 'Astérix' 
GROUP BY nom_tit) 
WHERE nb = (SELECT MAX(SUM(qte)) AS nb FROM DETAIL_ACHAT JOIN BD USING (no_bd) JOIN ACHAT USING(no_achat) JOIN CARTE USING(no_carte) 
JOIN APPARTIENT USING (no_bd) JOIN SERIE USING(no_serie) 
WHERE nom_serie = 'Astérix' 
GROUP BY nom_tit) 
--7) 
SELECT COUNT(*) AS apres_attaque FROM BD JOIN APPARTIENT USING(no_bd) JOIN SERIE USING(no_serie) 
WHERE nom_serie = 'One piece' AND nom_ordre > (SELECT nom_ordre FROM BD JOIN APPARTIENT USING(no_bd) JOIN SERIE USING(no_serie) WHERE titre_bd = 'Attaque au clair de lune ');

SELECT * FROM BD JOIN APPARTIENT USING (no_bd) JOIN SERIE USING(no_serie) 
WHERE no_bd NOT IN (SELECT no_bd FROM DETAIL_ACHAT) 
ORDER BY no_serie;

SELECT SUM(QTE) AS nb_bd_aline FROM DETAIL_ACHAT JOIN ACHAT USING (no_achat) JOIN CARTE USING(no_carte) 
WHERE nom_tit = 'Aline Martin' AND date_achat >= TO_DATE('01-01-21', 'DD-MM-YYYY');

SELECT (fanta*100/globale) FROM 
(SELECT SUM(qte*prix_unit)AS globale FROM DETAIL_ACHAT JOIN BD USING(no_bd) JOIN GENRE ON (BD.no_gen = GENRE.no_genre)), 
(SELECT SUM(qte*prix_unit)AS fanta  FROM DETAIL_ACHAT JOIN BD USING(no_bd) JOIN GENRE ON (BD.no_gen = GENRE.no_genre)WHERE libelle_genre = 'fantastique')  ;

SELECT * FROM DETAIL_ACHAT JOIN BD USING(no_bd) JOIN APPARTIENT USING(no_bd) JOIN SERIE USING(no_serie) 
WHERE qte >= 3 
Order by nom_serie;

SELECT  nom_serie,SUM(qte_stock),SUM(prix_unit*qte_stock) AS ValStock FROM  BD JOIN APPARTIENT USING(no_bd) JOIN SERIE USING(no_serie) 
GROUP BY nom_serie;

SELECT  nom_serie FROM( 
SELECT  nom_serie,COUNT(DISTINCT no_dess) AS nb_dess FROM  BD JOIN APPARTIENT USING(no_bd) JOIN SERIE USING(no_serie) 
GROUP BY nom_serie) 
WHERE nb_dess >= 2;

UPDATE BD 
SET QTE_STOCK = QTE_STOCK-1 
WHERE TITRE_BD = 'L’anniversaire d’Astérix et Obelix – Le Livre d’Or' 
OR 
 TITRE_BD = 'Astérix chez les Pictes' 
OR 
 TITRE_BD = 'Astérix et la Transitalique' 
OR 
 TITRE_BD = 'La Fille de Vercingétorix' 
OR 
 TITRE_BD = 'Asterix et le griffon';

UPDATE BD 
SET QTE_STOCK = QTE_STOCK-2 
WHERE TITRE_BD = 'Le Papyrus de César';

UPDATE CARTE 
SET NB_BONS = 7 
WHERE nom_tit = 'Aline Martin';
