DROP DATABASE IF EXISTS villageGreenBdd;

CREATE DATABASE villageGreenBdd;

USE villageGreenBdd;

DROP TABLE IF EXISTS Supplier;
CREATE TABLE Supplier(
   sup_ID INT AUTO_INCREMENT NOT NULL,
   sup_name VARCHAR(100) NOT NULL,
   sup_location VARCHAR(100) NOT NULL,
   sup_Zipcode VARCHAR(10) NOT NULL,
   sup_city VARCHAR(100) NOT NULL,
   sup_phoneNumber INT NOT NULL,
   sup_contactMail VARCHAR(50) NOT NULL,
   sup_category TINYINT NOT NULL,
   PRIMARY KEY(sup_ID),
   UNIQUE(sup_phoneNumber),
   UNIQUE(sup_contactMail)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

INSERT INTO `supplier` ( `sup_name`, `sup_location`, `sup_ZipCode`, `sup_city`, `sup_phoneNumber`, `sup_contactMail`, `sup_category`) VALUES
('Algam', '2 rue de Milan', '44470' , 'Thouaré-sur-Loire', 0272240535 , 'algam@gmail.com', 2), 
('Gear4music', '4th Floor 1 Portland Street', 'M1-3BE' , 'Manchester', 0843545455 , 'info@gear4music.fr ', 2), 
('Yamaha', '7 rue Ambroise Croizat', '77183' , 'Croissy-Beauborg', 0143151522 , 'contact@yamaha.fr ', 1), 
('Thomann', 'Thomann GmbH Hans-Thomann-Straße 1', '96138 ' , 'Burgebrach', 0054544533 , 'france@thomann.de ', 1)



DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(
   emp_ID INT AUTO_INCREMENT NOT NULL,
   emp_name VARCHAR(50) NOT NULL,
   emp_lastname VARCHAR(50) NOT NULL,
   emp_birth INT NOT NULL,
   emp_role VARCHAR(100) NOT NULL,
   emp_department VARCHAR(80) NOT NULL,
   emp_phoneNumber INT NOT NULL,
   emp_contactMail VARCHAR(50) NOT NULL,
   emp_companyPhoneNumber INT NOT NULL,
   PRIMARY KEY(emp_ID),
   UNIQUE(emp_phoneNumber),
   UNIQUE(emp_contactMail)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

INSERT INTO `employee` (`emp_name`, `emp_lastname`, `emp_birth`, `emp_role`, `emp_department`, `emp_phoneNumber`, `emp_contactMail`, `emp_companyPhoneNumber`) VALUES
('Gros', 'Philippe', '1968-05-16', 'particular customer', 'commercial services' , 0616897981, 'p.gros@villagegreen.com', 0147809060),
('vandamme', 'jean-claude', '1962-10-17', 'professional customer', 'commercial services' , 0649789955, 'jc.vandamme@villagegreen.com', 0147809060),
('soli', 'Agnès', '1982-11-07', 'professional customer', 'Manager' , 0645689752, 'a.soli@villagegreen.com', 0147809060),
('heda', 'nesrine', '1987-02-23', 'professional customer', 'commercial services' , 0745456545, 'n.heda@villagegreen.com', 0147809060),
('haditou', 'eda', '1969-03-07', 'Direction', 'headmaster' , 0654326788, 'e.haditou@villagegreen.com', 0147809060),
('siruski', 'olaf', '1977-06-22', 'particular customer', 'manager' , 0616498933, 'o.siruski@villagegreen.com', 0147809060),
('blanc', 'pauline', '1994-08-22', 'particular customer', 'stage' , 0699897740, 'p.blanc@villagegreen.com', 0147809060)


DROP TABLE IF EXISTS Product;
CREATE TABLE Product(
   pro_ID INT AUTO_INCREMENT NOT NULL,
   pro_label VARCHAR(50) NOT NULL,
   pro_ref VARCHAR(10) NOT NULL,
   pro_picture VARCHAR(50),
   pro_description TEXT,
   pro_EAN VARCHAR(50) NOT NULL,
   pro_color VARCHAR(30),
   pro_dateIn DATETIME NOT NULL,
   pro_dateUpdate DATETIME,
   pro_cat_ID INT NOT NULL,
   pro_priceUnitHT DECIMAL(8,2) NOT NULL,
   pro_Stock INT NOT NULL,
   pro_StockAlert INT NOT NULL,
   pro_sup_ID INT NOT NULL,
   pro_emp_ID INT NOT NULL,
   PRIMARY KEY(pro_ID),
   FOREIGN KEY(pro_sup_ID) REFERENCES Supplier(sup_ID),
   FOREIGN KEY(pro_emp_ID) REFERENCES Employee(emp_ID)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

INSERT INTO `product` ( `pro_label`, `pro_ref`, `pro_picture`, `pro_description`, `pro_EAN`, `pro_color`, `pro_dateIn`, `pro_dateUpdate`, `pro_cat_ID`, `pro_priceUnitHT`, `pro_stock`, `pro_stockAlert`, `pro_sup_ID`, `pro_emp_ID`) VALUES
('Guitarre électrique Strat Sterling','GUIT01', 'png', "Inspirée des guitares vintages mais agrémentée de caractéristiques modernes, la Cutlass CT30 offre un son intemporel dans la paume de vos mains. La guitare dispose d\'une configuration de micros HSS ou SSS avec un switch 5 positions et un trémolo de style vintage. Disponible en Fiesta Red (SSS), Charcoal Frost (SSS), Daphne Blue (SSS), Vintage Cream (HSS) et Stealth Black (HSS).", '001156511', 'charcoal frost' , now(), null, 1, 365.00, 10, 4, 1,1 ),
('Guitarre électrique Ltd mh200','GUIT02','png', "Magnifique guitarre electrique rouge flamboyante", '045845646', 'blood red' , now(), null, 1, 499.00, 6, 2, 1,1 ),
('Guitarre électrique sterling jason richardson natural poplar','GUIT03', 'png', "Suite à la popularité du modèle emblématique de Jason Richardson sorti en 2019, Sterling présente maintenant la nouvelle Richardson Cutlass pour les guitaristes plus traditionnels. Dotée d'une corne inférieure profilée personnalisée pour l'accès aux frettes, d’un manche en érable torréfié avec touche en palissandre et d’une table en loupe de peuplier, cette Cutlass reprend tous les composants de l'originale mais dans une configuration 6 cordes. Cela comprend également deux humbuckers à haut rendement, un boost de 12 dB «Push-Push», une tonalité «Push-Push» coil-tap et un tremolo moderne.", '4542531564', 'brown' , now(), null, 1, 1099.99, 5, 2, 1,2 ),
('Batterie pearl decade maple jazz 18inch','BAT01', 'png', "Avec la Decade, on entre dans la catégorie où un batteur peut réellement commencer à faire sonner la batterie dans sa globalité, en termes de nuances de frappes, de possibilités d’accordages et d’homogénéité entre la caisse claire, la grosse caisse et les toms... Sur la durée, en changeant les peaux, on pourra même encore élargir le champ des possibles. Cela dit, avec les Remo Clear UT fournies - en particulier pour la grosse caisse de 18 x 14 pouces dotée d’une Powerstroke 3 et d’une peau de résonance percée - et la peau sablée pour la caisse claire, on a déjà de quoi se régaler. Et bien au-delà d’une décade ! ", '0126565644', 'black' , now(), null, 2, 999.00, 6, 3, 1,4 ),
('Batterie debut kit','BAT02', 'png', "
Alesis s'est associé à Melodics afin de fournir 60 leçons gratuites pour PC ou tablette. Melodics™ est une application qui permet d'améliorer son timing, d'élargir son vocabulaire rythmique.", '1251545465', 'black' , now(), null, 2, 249.50, 15, 5, 1,4 ),
('Nord Drum 3p - Pad de percussion électronique à modélisation','BAT03', 'png', "
Ne cherchez pas les échantillons de sons percussifs, il n'y en a pas ! En effet le moteur de synthèse du Nord Drum 3 P est entièrement tourné vers la modélisation analogique et s'il ne contient aucun des sons de percussion habituels, il s’avère l'appareil idéal pour jouer des sons électro. Vous accédez à diverses formes d'ondes analogiques de base, à des enveloppes, filtres et effets et tout cela en temps réel. Bien entendu, vous disposez tout de même de présets entièrement modifiables pour initier vos propres programmations. Vous l'aurez compris, ce Nord Drum 3P est aux pads électroniques ce qu'un clavier Nord Lead est aux synthétiseurs. Le mieux-disant… ", '1251545465', 'red black' , now(), null, 2, 699.00, 10, 4, 1,4 ),
('korg piano b2sp','PIAN01', 'png', "Une qualité acoustique due à sa technologie d'échantillonnage stéréo. S'y ajoutent la restitution du bruit généré par le relâchement de la pédale et même les résonances sympathiques des cordes ! Compact et bien pensé, il se montre idéal pour les apprentis pianistes ou les amateurs en quête d'un piano numérique de qualité pour leur domicile ou leur résidence secondaire.", '1587887465', 'white' , now(), null, 3, 589.00, 14, 5, 1,4 ),
('korg piano g1b air br','PIAN02', 'png', "La sonorité d’une note de piano est exceptionnellement riche et sophistiquée. Les pianistes peuvent en moduler le volume ainsi que le timbre en fonction de l’impulsion qu'ils exercent sur les touches. Le G1-Air dispose d'échantillons très longs, soigneusement enregistrés et les reproduit avec tous leurs détails. Il utilise en outre des technologies exclusives du Kronos pour délivrer des transitions douces entre chaque note jouée.", '4874545444', 'brown' , now(), null, 3, 1439.89, 7, 2, 1,4 ),
('nord piano 5 73','PIAN03', 'png', "La technologie unique Virtual Hammer Action, associée aux mouvements physiques du marteau, offre une authenticité et une réponse dynamique exceptionnelles, ce qui se traduit par une action de clavier qui gère le jeu dynamique avec un contrôle incroyable à tous les niveaux de vélocité.", '5484654514', 'red' , now(), null, 3, 2899.00, 3, 1, 1,4 ),
('m-audio axiom air mini 32','PIAN04', 'png', "M-Audio a ainsi réussi l'exploit de loger dans un clavier compact, 32 touches et 8 pads, tous sensibles à la vélocité, mais aussi 8 potentiomètres librement assignables aux numéros de contrôleurs Midi de votre choix, des touches de transport et de déplacement de curseur, de pitchbend et de modulation, de sustain et de changement d'octave. Le mieux, dans tout ça, c'est qu’en dépit des dimensions réduites de l'AirMini32, la disposition de tous ces atouts est parfaitement claire, ce qui lui confère une ergonomie irréprochable. ", '4556843547', 'black' , now(), null, 3, 69.00, 25, 10, 1,7 ),
('m-audio oxygen pro mini','PIAN05', 'png', "Vous avez envie de rejoindre le camp des professionnels avec un clavier de qualité, proposant de nombreuses fonctionnalités et un minimum de tracas de programmation de nombreux logiciels ? Alors la gamme des claviers-maîtres Oxygen Pro de M-Audio est faite pour vous. L'Oxygen Pro Mini, version à 32 touches au format mini, met à votre disposition une quantité impressionnante de fonctionnalités et une suite logicielle très complète pour booster votre créativité, ainsi qu'un workflow très intuitif vous permettant de vous concentrer sur la seule chose qui importe : votre créativité.", '647567457', 'black' , now(), null, 3, 110.00, 20, 10, 1,7 ),
('violon archer 44v-500','VIO01', 'jpeg', "Vous êtes à la recherche d'un instrument répondant aux exigences de votre apprentissage en constante évolution ? Ne cherchez plus, l'Archer 44V-500 de taille 4/4 est la réponse à vos prières. Cet instrument en bois massif est livré avec son archet en bois de feuillus et un étui rigide léger, soit tout ce qu'il vous faut pour passer au niveau suivant.", '454542544', 'wood' , now(), null, 4, 209.75, 30, 12, 2,1 ),
('stagg shaped violon electrique','VIO02', 'jpeg', "Commencez à expérimenter avec votre son dès aujourd'hui ! Le violon électrique Stagg Shaped est un moyen abordable d'amplifier votre son. Doté d'une silhouette de contemporary violon à côté d'un Noir brillantfinition, le violon électrique Stagg est vraiment un instrument qui fait tourner les têtes.", '5665656555', 'black ivory' , now(), null, 4, 235.25, 20, 8, 2,1 ),
('elkhart 100AS alto saxophone','SAX01', 'jpeg', "Ce saxophone Elkhart est un excellent achat pour ceux à la recherche de leur premier instrument. Il possède une superbe intonation, un mécanisme utile et facile d’utilisation ainsi qu’un prix attractif ce qui en fait un saxophone alto d’étude fantastique. Le corps en cuivre jaune du 100AS saxophone alto est renforcé avec des rainures ce qui le rend plus résistant et adapté à une pratique fréquente. La conception solide de ce saxophone en fait l’instrument idéal pour les joueurs intermédiaires et professionnels qui ont besoin d’un instrument de rechange avec un excellent rapport qualité/prix.", '666565555', 'gold' , now(), null, 5, 503.25, 12, 4, 2,2 ),
('noir et or alto saxophone','SAX02', 'jpeg', "Fiable, solide et abordable, le saxophone alto Gear4music est un instrument idéal pour les débutants complets et les joueurs de niveau intermédiaire. Il produit un son doux et offre une réponse au souffle idéale pour développer sa technique. Son robuste corps nervuré a été conçu pour résister à une utilisation régulière, ainsi qu'aux secousses induites par le transport. Le saxophone alto Gear4music est par ailleurs fourni avec une embouchure, un étui, une anche et une sangle, soit tout le nécessaire pour vous permettre de commencer à jouer dès sa réception.", '013121345', 'gold and black' , now(), null, 5, 349.99, 15, 5, 2,2 ),
('yanagisawa awo20pg','SAX03', 'jpeg', "Rejoignez le elite... Grâce à un cours de maître sur l'ingéniosité japonaise. C'est ce qui définit le Yanagisawa AWO20PG en rose gold. En comprenant les besoins des musiciens, Yanagisawa a su créer un saxophone alto en bronze dynamique pour ceux qui font partie du milieu professionnel.", '4156451515', 'gold pink' , now(), null, 5, 8345.99, 1, 0, 2,2 ),
('nuvo jsax 2.0','SAX04', 'jpeg', "Entrez dans le monde de la musique. Commencez à vous développer en tant que musicien dès aujourd'hui avec le jSax de Nuvo. En suivant les doigtés traditionnels du saxophone, le jSax permet aux enfants de développer leur embouchure et leurs capacités de jeu dès leur plus jeune âge. Doté d'un corps noir avec des garnitures noires, le jSax est garanti pour maintenir l'intérêt des jeunes joueurs.", '2435435435', 'black mat' , now(), null, 5, 99.99, 30, 10, 2,1 ),
('rosedale saxophone soprano','SAX05', 'jpeg', "Le saxophone soprano intermédiaire SP0201G est doté d'un corps en cuivre et produit un son rond, luxuriant et maturé à un prix imbattable, et son action permet un jeu incroyablement simple. Sa finition au vernis ainsi que son motif gravé à la main lui confèrent une touche d'élégance.
Le saxo soprano est livré avec un bocal droit et un bocal incurvé vous permettant de jouer dans différentes positions, un étui rigide de qualité, une anche, une sangle, un chiffon et une brosse de nettoyage.", '4545454525', 'gold pink' , now(), null, 5, 443.00, 10, 3, 2,1 ),
('xylophone 3 octaves','XYL01', 'jpeg', "Doté de 37 lames en acajou de haute qualité, le xylophone 3 octaves produit un son chatoyant, idéal pour les écoles et orchestres. Ses sonorités hautes en couleur lui permettront d'harmoniser les ensembles musicaux en tous genres. Facile à ranger et à transporter, le xylophone d'orchestre Gear4music est livré avec un étui de transport robuste, un support métallique pliant et une paire de mailloches, ainsi vous ne manquerez de rien pour commencer à jouer dès la réception.", '1221152131', 'brown black' , now(), null, 6, 235.00, 6, 2, 2,1 ),
('ozark 2246 bouzouki guitarre accoustique','GUIT04', 'jpeg', "Ce bouzouki à 8 cordes d'Ozark est doté d'un corps en forme de guitare unique qui produit un volume supplémentaire et un son riche. Il est équipé d'une table en épicéa massif pour une grande production sonore et est équipé d'un Fishmanunder saddle transducteur et d'un égaliseur. Le manche de guitare de largeur régulière rejoint le corps à la 14ème frette et comporte huit cordes en quatre rangs. Il s'agit d'un instrument de grande valeur fabriqué à partir de matériaux de haute qualité avec l'attention particulière portée au design qui est une caractéristique de tous les instruments Ozark.", '24154564', 'brown ligth' , now(), null, 1, 750.00, 12, 4, 2,2 ),
("sitar chevillier courbe à tête d\'oiseau",'GUIT05', 'jpeg', "Le sitar Gear4music possède 7 cordes mélodiques en acier qui surmontent ses frettes surélevées, et 11 cordes sympathiques (taraf) qui, lorsqu'elles sont accordées, vibrent en réponse aux vibration des cordes pincées. Les sons produits sont amplifiés par sa caisse de résonance (kadu ka tumba) en bois. Cet instrument aux sonorités authentiques trouvera sa place au sein de n'importe quel ensemble de musique classique indienne.
Fabriqué et décoré à la main
Fabriqué à la main par des techniciens experts au Royaume-Uni, ce sitar est un instrument unique, à l'apparence authentique et hautement décorative. Ses chevilles (kunti) et son chevillier ont été soigneusement confectionnés.", '46845454', 'brown sugar' , now(), null, 1, 583.00, 9, 3, 2,1 ),
("seagull m4 spruce eq dulcimer",'GUIT06', 'jpeg', "L'égaliseur Seagull M4 Spruce EQ est conçu pour attirer l'attention des débutants, des non-joueurs, des guitaristes et des amateurs de folk, offrant un instrument amusant, compact et portable qui est parfait pour les live arrangements, ainsi que pour créer de nouvelles mélodies et des sons plus uniques et mondains. Avec une table en épicéa massif et un corps en érable massif, l'égaliseur Seagull M4 Spruce EQ produit un son clair, brillant et richement dynamique avec une réponse incroyablement polyvalente, beaucoup de mordant et un excellent sustain. De plus, le design de la Seagull M4 est basé sur le dulcimer traditionnel, mais est construit avec des techniques modernes pour une meilleure jouabilité et portabilité. De plus, le Seagull M4 EQ est un instrument amusant, confortable et unique pour les débutants et les guitaristes, ainsi que pour les amateurs de dulcimer qui recherchent un son distinct à ajouter à leur installation musicale. Enfin, cet instrument accrocheur est également équipé d'une électronique en bande B et d'un système embarqué, idéal pour les live réglages et les séances d'entraînement amplifiées.", '984484488', 'brown ligth' , now(), null, 1, 355.00, 15, 5, 2,7 ),
("harmonica",'HARM01', 'jpeg', "L'harmonica Blues Deluxe de Fender est idéal aussi bien pour les débutants que pour les joueurs chevronnés ! Cet harmonica en tonalité de Do bénéficie d'une construction robuste dans une forme traditionnelle et délivre des sons lumineux avec une articulation nette. Il est livré avec un étui de protection. ", '94556488', 'silver metal' , now(), null, 7, 12.90, 150, 30, 2,7 ),
("tuba hybride playlite",'CUIV01', 'jpeg', "Le tuba hybride en Si bémol playLITE par Gear4music représente une alternative légère aux cuivres traditionnels. Doté d'un corps en plastique ABS, il est idéal pour les jeunes musiciens comme pour les professionnels à la recherche d'un instrument léger. Ses pistons rotatifs à revêtement interne en aluminium offrent une jouabilité rapide et très agréable. Le tuba à 4 pistons playLITE demeure un instrument authentique, notamment grâce à sa forme traditionnelle qui dégage un timbre réaliste avec une projection claire. Le tuba playLITE est fourni avec une embouchure en plastique et un étui à mousse rigide.", '123456444', 'black metal' , now(), null, 8, 990.99, 12, 4, 2,4 ),
("CFX Yamaha piano premium",'PIAN06', 'jpeg', "Avec ses 2,75 mètres de longueur, le CFX est un piano à queue de concert à part entière, caractérisé par une vaste palette sonore et la faculté de restituer les nuances d’expression les plus subtiles. Le son délivré est riche sur l’ensemble des registres afin d'accompagner un orchestre symphonique dans les salles les plus vastes. Le CFX est le modèle phare de Yamaha. Il marque une nouvelle étape dans l'histoire de la fabrication de piano de concert.", '014245465', 'black piano' , now(), null, 3, 153278.00, 1, 0, 3,4 ),
("S7X Yamaha piano premium",'PIAN07', 'jpeg', "Parfait équilibre entre richesse, chaleur, précision et puissance, le S7X donne aux pianistes une infinie liberté d’expression. Convient à la musique de chambre et aux grands salons. ", '57584545', 'black piano' , now(), null, 3, 72894.00, 1, 0, 3,4 ),
("YUS5 Yamaha piano droit",'PIAN08', 'jpeg', "Fabriqué avec un soin méticuleux à partir des matériaux les plus nobles, le modèle YUS5 est un piano droit à l'allure raffinée.", '124564854', 'Satin Walnut' , now(), null, 3, 16174.00, 2, 0, 3,4 ),
("Thorens TD 402 DD",'DJ01', 'jpg', "Platine vinyle à entrainement direct", '354545454', 'black silver' , now(), null, 9, 777.00, 4, 2, 4,2 ),
("Pro-Ject Debut RecordMaster II",'DJ02', 'jpg', "Platine vinyle audiophile avec enregistrement Hi-Res", '64541554', 'black walnut' , now(), null, 9, 349.00, 10, 3, 4,1),
("Thorens TD 1600",'DJ03', 'jpg', "Platine vinyle pro", '454545422', 'black walnut' , now(), null, 9, 2450.00, 3, 1, 4,2),
("Native Instruments Traktor S4 MK3",'DJ04', 'jpg', "Contrôleur DJ 4 canaux et interface audio", '124545454', 'black' , now(), null, 9, 745.00, 7, 2, 4,2),
("Native Instruments Traktor S2 MK3 Bundle",'DJ05', 'jpg', "Contrôleur DJ non pro", '45345684', 'black' , now(), null, 9, 266.00, 25, 10, 4,7),
("Sennheiser HD-25 Plus",'DJ06', 'jpg', "Casque DJ très bonne qualité à usage pro", '545464458', 'black' , now(), null, 9, 189.00, 55, 20, 4,4),
("Audio-Technica ATH-M70 X",'DJ07', 'jpg', "Casque studio / DJ", '475785785', 'black' , now(), null, 9, 255.00, 35, 12, 4,4),
("the t.bone HD 1500",'DJ08', 'jpg', "Casque loisir dj", '458768665', 'black' , now(), null, 9, 35.00, 60, 20, 4,7),
("Allen & Heath Xone 96",'DJ09', 'jpg', "Table de mixage DJ analogique", '567867868', 'silver' , now(), null, 9, 1555.00, 4, 2, 4,2),
("Behringer DX2000USB",'DJ10', 'jpg', "Table de mixage DJ loisir", '5875454', 'black carbon' , now(), null, 9, 225.00, 15, 5, 4,7),
("Rane Seventy-Two MKII",'DJ11', 'jpg', "Battle Mixer", '4658876578', 'black' , now(), null, 9, 1938.00, 2, 1, 4,2),
("Serato DJ Expansions",'DJ12', 'jpg', "Ensemble d'extensions logicielles Serato pour DJ Pro - Téléchargement", '4565783633', 'multi' , now(), null, 9, 279.00, 30, 10, 4,2),
("Boss RC-505 Bundle",'DJ13', 'jpg', "Ensemble effets sonors", '24115644', 'black' , now(), null, 9, 459.00, 26, 10, 4,2)



DROP TABLE IF EXISTS Client;
CREATE TABLE Client(
   cli_ID INT AUTO_INCREMENT NOT NULL,
   cli_name VARCHAR(80) NOT NULL,
   cli_lastname VARCHAR(80) NOT NULL,
   cli_birth DATE NOT NULL,
   cli_adress VARCHAR(100),
   cli_Zipcode VARCHAR(10),
   cli_city VARCHAR(80),
   cli_mail VARCHAR(80) NOT NULL,
   cli_phoneNumber VARCHAR(15),
   cli_memberName VARCHAR(50) NOT NULL,
   cli_password VARCHAR(50) NOT NULL,
   cli_newMemberDate DATETIME NOT NULL,
   cli_category TINYINT NOT NULL,
   PRIMARY KEY(cli_ID),
   UNIQUE(cli_mail),
   UNIQUE(cli_phoneNumber),
   UNIQUE(cli_memberName),
   UNIQUE(cli_password)
)ENGINE = INNODB DEFAULT CHARSET=utf8;



INSERT INTO client (cli_name, cli_lastname, cli_birth, cli_adress, cli_ZipCode, cli_city, cli_mail, cli_phoneNumber, cli_password, cli_newMemberDate, cli_category)
 VALUES
 ('Cooper', 'Dale', 'Grand Northern Hotel', 1234, 'Washington', 'United State', 'T9P[L%L.6#<#tjWJJfZE', '55589764', 'dale@gmail.com', '2021-03-18 07:15:25', CURRENT_TIME),
 ('Mister', 'Hyde', '1 plais de son âme', 59000, 'Lille', 'France', 'PQ!r~^64$%p/GAY$mA)B', '0645896235', 'MhM@gmail.com', '2021-03-26 07:15:25', CURRENT_TIME),
 ('Mollier', 'Mari', '16 avenu du bonheur', 59250, 'Halluin', 'France', 'P_/E~F&Um%#7:ZkTYd2<P', '0659474712', 'mollier@outlook.fr', '2021-04-06 12:12:35', CURRENT_TIME),
 ('Jean', 'Michel', '25 rue abbe delbende', 59510, 'Forest sur marque', 'France', '*+G/,e]!Mkq,n3@:=j&V', '07458129536', 'monsieurmichel@laposte.net', '2021-03-30 07:26:12', CURRENT_TIME);
