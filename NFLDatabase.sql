CREATE DATABASE IF NOT EXISTS NFLManagements;
USE NFLManagements;
 
DROP TABLE IF EXISTS Injuries;
DROP TABLE IF EXISTS PlayerStats;
DROP TABLE IF EXISTS Games;
DROP TABLE IF EXISTS Contracts;
DROP TABLE IF EXISTS Coaches;
DROP TABLE IF EXISTS Stadiums;
DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Teams;


CREATE TABLE Teams (
    TeamID INT AUTO_INCREMENT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Conference VARCHAR(50),
    Division VARCHAR(50)
);


CREATE TABLE Stadiums (
    StadiumID INT AUTO_INCREMENT PRIMARY KEY,
    StadiumName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);


CREATE TABLE Players (
    PlayerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    JerseyNumber INT,
    DateOfBirth DATE,
    TeamID INT NOT NULL,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID),
    UNIQUE (FirstName, LastName, TeamID)
);


CREATE TABLE Coaches (
    CoachID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Role VARCHAR(100) NOT NULL,
    TeamID INT NOT NULL,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);


CREATE TABLE Contracts (
    ContractID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Salary DECIMAL(12,2) NOT NULL,
    SigningBonus DECIMAL(12,2),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);


CREATE TABLE Games (
    GameID INT AUTO_INCREMENT PRIMARY KEY,
    GameDate DATE NOT NULL,
    HomeTeamID INT NOT NULL,
    AwayTeamID INT NOT NULL,
    StadiumID INT NOT NULL,
    HomeScore INT,
    AwayScore INT,
    FOREIGN KEY (HomeTeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (StadiumID) REFERENCES Stadiums(StadiumID)
);


CREATE TABLE PlayerStats (
    StatID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerID INT NOT NULL,
    GameID INT NOT NULL,
    PassingYards INT DEFAULT 0,
    RushingYards INT DEFAULT 0,
    ReceivingYards INT DEFAULT 0,
    Touchdowns INT DEFAULT 0,
    Tackles INT DEFAULT 0,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (GameID) REFERENCES Games(GameID)
);


CREATE TABLE Injuries (
    InjuryID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerID INT NOT NULL,
    InjuryType VARCHAR(100) NOT NULL,
    InjuryDate DATE NOT NULL,
    RecoveryDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);



-- TEAMS DATA
INSERT INTO Teams (TeamName, City, Conference, Division) VALUES
-- AFC E
('Buffalo Bills','Buffalo','AFC','East'),
('Miami Dolphins','Miami Gardens','AFC','East'),
('New England Patriots','Foxborough','AFC','East'),
('New York Jets','East Rutherford','AFC','East'),
-- AFC N
('Baltimore Ravens','Baltimore','AFC','North'),
('Cincinnati Bengals','Cincinnati','AFC','North'),
('Cleveland Browns','Cleveland','AFC','North'),
('Pittsburgh Steelers','Pittsburgh','AFC','North'),
-- AFC S
('Houston Texans','Houston','AFC','South'),
('Indianapolis Colts','Indianapolis','AFC','South'),
('Jacksonville Jaguars','Jacksonville','AFC','South'),
('Tennessee Titans','Nashville','AFC','South'),
-- AFC W
('Denver Broncos','Denver','AFC','West'),
('Kansas City Chiefs','Kansas City','AFC','West'),
('Las Vegas Raiders','Las Vegas','AFC','West'),
('Los Angeles Chargers','Los Angeles','AFC','West'),
-- NFC E
('Dallas Cowboys','Arlington','NFC','East'),
('New York Giants','East Rutherford','NFC','East'),
('Philadelphia Eagles','Philadelphia','NFC','East'),
('Washington Commanders','Landover','NFC','East'),
-- NFC N
('Chicago Bears','Chicago','NFC','North'),
('Detroit Lions','Detroit','NFC','North'),
('Green Bay Packers','Green Bay','NFC','North'),
('Minnesota Vikings','Minneapolis','NFC','North'),
-- NFC S
('Atlanta Falcons','Atlanta','NFC','South'),
('Carolina Panthers','Charlotte','NFC','South'),
('New Orleans Saints','New Orleans','NFC','South'),
('Tampa Bay Buccaneers','Tampa','NFC','South'),
-- NFC W
('Arizona Cardinals','Glendale','NFC','West'),
('Los Angeles Rams','Inglewood','NFC','West'),
('San Francisco 49ers','Santa Clara','NFC','West'),
('Seattle Seahawks','Seattle','NFC','West');




INSERT INTO Stadiums (StadiumName, City, Capacity, TeamID) VALUES
('Highmark Stadium','Orchard Park',71608,1),
('Hard Rock Stadium','Miami Gardens',65326,2),
('Gillette Stadium','Foxborough',65878,3),
('MetLife Stadium','East Rutherford',82500,4),

('M&T Bank Stadium','Baltimore',71008,5),
('Paycor Stadium','Cincinnati',65515,6),
('Huntington Bank Field','Cleveland',67895,7),
('Acrisure Stadium','Pittsburgh',68400,8),

('NRG Stadium','Houston',72220,9),
('Lucas Oil Stadium','Indianapolis',67000,10),
('EverBank Stadium','Jacksonville',69132,11),
('Nissan Stadium','Nashville',69143,12),

('Empower Field at Mile High','Denver',76125,13),
('GEHA Field at Arrowhead Stadium','Kansas City',76416,14),
('Allegiant Stadium','Las Vegas',65000,15),
('SoFi Stadium','Inglewood',70000,16),

('AT&T Stadium','Arlington',80000,17),
('MetLife Stadium','East Rutherford',82500,18),
('Lincoln Financial Field','Philadelphia',67594,19),
('Northwest Stadium','Landover',67000,20),

('Soldier Field','Chicago',61500,21),
('Ford Field','Detroit',65000,22),
('Lambeau Field','Green Bay',81441,23),
('U.S. Bank Stadium','Minneapolis',66655,24),

('Mercedes-Benz Stadium','Atlanta',71000,25),
('Bank of America Stadium','Charlotte',75523,26),
('Caesars Superdome','New Orleans',73208,27),
('Raymond James Stadium','Tampa',65890,28),

('State Farm Stadium','Glendale',63400,29),
('SoFi Stadium','Inglewood',70000,30),
('Levi''s Stadium','Santa Clara',68500,31),
('Lumen Field','Seattle',68740,32);




INSERT INTO Coaches (FirstName, LastName, Role, TeamID) VALUES
('Sean','McDermott','Head Coach',1),
('Mike','McDaniel','Head Coach',2),
('Mike','Vrabel','Head Coach',3),
('Aaron','Glenn','Head Coach',4),

('John','Harbaugh','Head Coach',5),
('Zac','Taylor','Head Coach',6),
('Kevin','Stefanski','Head Coach',7),
('Mike','Tomlin','Head Coach',8),

('DeMeco','Ryans','Head Coach',9),
('Shane','Steichen','Head Coach',10),
('Liam','Coen','Head Coach',11),
('Brian','Callahan','Head Coach',12),

('Sean','Payton','Head Coach',13),
('Andy','Reid','Head Coach',14),
('Pete','Carroll','Head Coach',15),
('Jim','Harbaugh','Head Coach',16),

('Brian','Schottenheimer','Head Coach',17),
('Brian','Daboll','Head Coach',18),
('Nick','Sirianni','Head Coach',19),
('Dan','Quinn','Head Coach',20),

('Ben','Johnson','Head Coach',21),
('Dan','Campbell','Head Coach',22),
('Matt','LaFleur','Head Coach',23),
('Kevin','O''Connell','Head Coach',24),

('Raheem','Morris','Head Coach',25),
('Dave','Canales','Head Coach',26),
('Kellen','Moore','Head Coach',27),
('Todd','Bowles','Head Coach',28),

('Jonathan','Gannon','Head Coach',29),
('Sean','McVay','Head Coach',30),
('Kyle','Shanahan','Head Coach',31),
('Mike','Macdonald','Head Coach',32);




INSERT INTO Players (PlayerID, FirstName, LastName, Position, JerseyNumber, DateOfBirth, TeamID) VALUES

(1,'Josh','Allen','QB',17,'1996-05-21',1),
(2,'James','Cook','RB',4,NULL,1),
(3,'Khalil','Shakir','WR',10,NULL,1),
(4,'Dalton','Kincaid','TE',86,NULL,1),
(5,'Dion','Dawkins','OT',73,NULL,1),

(6,'Tua','Tagovailoa','QB',1,'1998-03-02',2),
(7,'De''Von','Achane','RB',28,NULL,2),
(8,'Tyreek','Hill','WR',10,NULL,2),
(9,'Jaylen','Waddle','WR',17,NULL,2),
(10,'Malik','Washington','WR',6,NULL,2),

(11,'Drake','Maye','QB',10,NULL,3),
(12,'Rhamondre','Stevenson','RB',38,NULL,3),
(13,'Stefon','Diggs','WR',8,NULL,3),
(14,'DeMario','Douglas','WR',81,NULL,3),
(15,'Hunter','Henry','TE',85,NULL,3),

(16,'Justin','Fields','QB',7,NULL,4),
(17,'Breece','Hall','RB',20,NULL,4),
(18,'Garrett','Wilson','WR',5,NULL,4),
(19,'Allen','Lazard','WR',10,NULL,4),
(20,'Jeremy','Ruckert','TE',89,NULL,4),


(21,'Lamar','Jackson','QB',8,NULL,5),
(22,'Derrick','Henry','RB',22,NULL,5),
(23,'Zay','Flowers','WR',4,NULL,5),
(24,'Rashod','Bateman','WR',7,NULL,5),
(25,'Mark','Andrews','TE',89,NULL,5),

(26,'Joe','Burrow','QB',9,NULL,6),
(27,'Chase','Brown','RB',30,NULL,6),
(28,'Ja''Marr','Chase','WR',1,NULL,6),
(29,'Tee','Higgins','WR',5,NULL,6),
(30,'Mike','Gesicki','TE',88,NULL,6),

(31,'Joe','Flacco','QB',15,NULL,7),
(32,'Jerome','Ford','RB',34,NULL,7),
(33,'Jerry','Jeudy','WR',3,NULL,7),
(34,'Cedric','Tillman','WR',19,NULL,7),
(35,'David','Njoku','TE',85,NULL,7),

(36,'Mason','Rudolph','QB',2,NULL,8),
(37,'Jaylen','Warren','RB',30,NULL,8),
(38,'DK','Metcalf','WR',4,NULL,8),
(39,'Calvin','Austin III','WR',19,NULL,8),
(40,'Pat','Freiermuth','TE',88,NULL,8),


(41,'C.J.','Stroud','QB',7,NULL,9),
(42,'Joe','Mixon','RB',28,NULL,9),
(43,'Nico','Collins','WR',12,NULL,9),
(44,'Christian','Kirk','WR',13,NULL,9),
(45,'Dalton','Schultz','TE',86,NULL,9),

(46,'Anthony','Richardson','QB',5,NULL,10),
(47,'Jonathan','Taylor','RB',28,NULL,10),
(48,'Michael','Pittman Jr.','WR',11,NULL,10),
(49,'Josh','Downs','WR',1,NULL,10),
(50,'Mo','Alie-Cox','TE',81,NULL,10),

(51,'Trevor','Lawrence','QB',16,NULL,11),
(52,'Travis','Etienne Jr.','RB',1,NULL,11),
(53,'Brian','Thomas Jr.','WR',7,NULL,11),
(54,'Dyami','Brown','WR',5,NULL,11),
(55,'Brenton','Strange','TE',85,NULL,11),

(56,'Cam','Ward','QB',1,NULL,12),
(57,'Tony','Pollard','RB',20,NULL,12),
(58,'Calvin','Ridley','WR',0,NULL,12),
(59,'Elic','Ayomanor','WR',5,NULL,12),
(60,'Chigoziem','Okonkwo','TE',85,NULL,12),


(61,'Bo','Nix','QB',10,NULL,13),
(62,'Tyler','Badie','RB',28,NULL,13),
(63,'Courtland','Sutton','WR',14,NULL,13),
(64,'Devaughn','Vele','WR',17,NULL,13),
(65,'Evan','Engram','TE',1,NULL,13),

(66,'Patrick','Mahomes','QB',15,NULL,14),
(67,'Isiah','Pacheco','RB',10,NULL,14),
(68,'Rashee','Rice','WR',4,NULL,14),
(69,'Xavier','Worthy','WR',1,NULL,14),
(70,'Travis','Kelce','TE',87,NULL,14),

(71,'Geno','Smith','QB',7,NULL,15),
(72,'Ashton','Jeanty','RB',2,NULL,15),
(73,'Jakobi','Meyers','WR',16,NULL,15),
(74,'Jack','Bech','WR',18,NULL,15),
(75,'Brock','Bowers','TE',89,NULL,15),

(76,'Justin','Herbert','QB',10,NULL,16),
(77,'Najee','Harris','RB',22,NULL,16),
(78,'Ladd','McConkey','WR',15,NULL,16),
(79,'Quentin','Johnston','WR',1,NULL,16),
(80,'Will','Dissly','TE',81,NULL,16),


(81,'Dak','Prescott','QB',4,NULL,17),
(82,'Javonte','Williams','RB',33,NULL,17),
(83,'CeeDee','Lamb','WR',88,NULL,17),
(84,'George','Pickens','WR',13,NULL,17),
(85,'Jake','Ferguson','TE',87,NULL,17),

(86,'Russell','Wilson','QB',3,NULL,18),
(87,'Tyrone','Tracy Jr.','RB',29,NULL,18),
(88,'Malik','Nabers','WR',1,NULL,18),
(89,'Darius','Slayton','WR',86,NULL,18),
(90,'Theo','Johnson','TE',84,NULL,18),

(91,'Jalen','Hurts','QB',1,NULL,19),
(92,'Saquon','Barkley','RB',26,NULL,19),
(93,'A.J.','Brown','WR',11,NULL,19),
(94,'DeVonta','Smith','WR',6,NULL,19),
(95,'Dallas','Goedert','TE',88,NULL,19),

(96,'Jayden','Daniels','QB',5,NULL,20),
(97,'Brian','Robinson Jr.','RB',8,NULL,20),
(98,'Terry','McLaurin','WR',17,NULL,20),
(99,'Deebo','Samuel','WR',1,NULL,20),
(100,'Zach','Ertz','TE',86,NULL,20),


(101,'Caleb','Williams','QB',18,NULL,21),
(102,'D''Andre','Swift','RB',4,NULL,21),
(103,'DJ','Moore','WR',2,NULL,21),
(104,'Rome','Odunze','WR',15,NULL,21),
(105,'Cole','Kmet','TE',85,NULL,21),

(106,'Jared','Goff','QB',16,NULL,22),
(107,'Jahmyr','Gibbs','RB',26,NULL,22),
(108,'Amon-Ra','St. Brown','WR',14,NULL,22),
(109,'Jameson','Williams','WR',9,NULL,22),
(110,'Sam','LaPorta','TE',87,NULL,22),

(111,'Jordan','Love','QB',10,NULL,23),
(112,'Josh','Jacobs','RB',8,NULL,23),
(113,'Jayden','Reed','WR',11,NULL,23),
(114,'Romeo','Doubs','WR',87,NULL,23),
(115,'Tucker','Kraft','TE',85,NULL,23),

(116,'J.J.','McCarthy','QB',9,NULL,24),
(117,'Aaron','Jones Sr.','RB',33,NULL,24),
(118,'Justin','Jefferson','WR',18,NULL,24),
(119,'Jordan','Addison','WR',3,NULL,24),
(120,'T.J.','Hockenson','TE',87,NULL,24),


(121,'Michael','Penix Jr.','QB',9,NULL,25),
(122,'Bijan','Robinson','RB',7,NULL,25),
(123,'Drake','London','WR',5,NULL,25),
(124,'Darnell','Mooney','WR',1,NULL,25),
(125,'Kyle','Pitts','TE',8,NULL,25),

(126,'Bryce','Young','QB',9,NULL,26),
(127,'Chuba','Hubbard','RB',30,NULL,26),
(128,'Adam','Thielen','WR',19,NULL,26),
(129,'Xavier','Legette','WR',17,NULL,26),
(130,'Ja''Tavion','Sanders','TE',0,NULL,26),

(131,'Derek','Carr','QB',4,NULL,27),
(132,'Alvin','Kamara','RB',41,NULL,27),
(133,'Chris','Olave','WR',12,NULL,27),
(134,'Rashid','Shaheed','WR',22,NULL,27),
(135,'Juwan','Johnson','TE',83,NULL,27),

(136,'Baker','Mayfield','QB',6,NULL,28),
(137,'Bucky','Irving','RB',7,NULL,28),
(138,'Mike','Evans','WR',13,NULL,28),
(139,'Chris','Godwin','WR',14,NULL,28),
(140,'Cade','Otton','TE',88,NULL,28),


(141,'Kyler','Murray','QB',1,NULL,29),
(142,'James','Conner','RB',6,NULL,29),
(143,'Marvin','Harrison Jr.','WR',18,NULL,29),
(144,'Michael','Wilson','WR',14,NULL,29),
(145,'Trey','McBride','TE',85,NULL,29),

(146,'Matthew','Stafford','QB',9,NULL,30),
(147,'Kyren','Williams','RB',23,NULL,30),
(148,'Puka','Nacua','WR',17,NULL,30),
(149,'Davante','Adams','WR',15,NULL,30),
(150,'Tyler','Higbee','TE',89,NULL,30),

(151,'Brock','Purdy','QB',13,NULL,31),
(152,'Christian','McCaffrey','RB',23,NULL,31),
(153,'Brandon','Aiyuk','WR',11,NULL,31),
(154,'Jauan','Jennings','WR',15,NULL,31),
(155,'George','Kittle','TE',85,NULL,31),

(156,'Sam','Darnold','QB',14,NULL,32),
(157,'Kenneth','Walker III','RB',9,NULL,32),
(158,'Jaxon','Smith-Njigba','WR',11,NULL,32),
(159,'Cooper','Kupp','WR',10,NULL,32),
(160,'Noah','Fant','TE',87,NULL,32);




INSERT INTO Contracts (PlayerID, StartDate, EndDate, Salary, SigningBonus) VALUES
(1,'2021-08-06','2028-12-31',43000000.00,NULL),
(6,'2024-07-26','2028-12-31',53100000.00,NULL),
(11,'2024-05-28','2028-12-31',9159941.00,23467100.00),
(16,'2025-03-10','2026-12-31',20000000.00,NULL),

(21,'2023-04-27','2027-12-31',52000000.00,72500000.00), 
(26,'2023-09-07','2029-12-31',55000000.00,NULL),       
(31,'2025-04-11','2025-12-31',4000000.00,NULL),        
(36,'2025-03-13','2026-12-31',4000000.00,4500000.00),   

(41,'2023-07-24','2027-12-31',9075000.00,23380000.00),  
(46,'2023-07-24','2027-12-31',8497500.00,21720000.00), 
(51,'2024-06-13','2029-12-31',55000000.00,NULL),        
(56,'2025-05-21','2029-12-31',12209901.00,32159712.00), 

(61,'2024-05-10','2028-12-31',4653292.00,10356848.00), 
(66,'2020-07-06','2031-12-31',45000000.00,NULL),        
(71,'2025-04-03','2027-12-31',42750000.00,NULL),        
(76,'2023-07-25','2029-12-31',52500000.00,NULL),       

(81,'2024-09-08','2028-12-31',60000000.00,80000000.00), 
(86,'2025-03-25','2025-12-31',10500000.00,NULL),       
(91,'2023-04-17','2028-12-31',51000000.00,23294000.00), 
(96,'2024-06-14','2028-12-31',9437500.00,24300000.00),  

(101,'2024-07-16','2028-12-31',9872500.00,25500000.00), 
(106,'2024-05-13','2027-12-31',53000000.00,NULL),       
(111,'2024-07-26','2028-12-31',55000000.00,75000000.00),
(116,'2024-07-19','2028-12-31',5463699.00,12714396.00), 

(121,'2024-06-21','2028-12-31',5700000.00,NULL),       
(126,'2023-07-21','2027-12-31',9490000.00,24600000.00),
(131,'2023-03-06','2026-12-31',37500000.00,60000000.00),
(136,'2024-03-10','2026-12-31',33333333.00,NULL),       

(141,'2022-07-21','2028-12-31',46100000.00,NULL),    
(146,'2025-05-05','2026-12-31',44000000.00,NULL),      
(151,'2025-05-16','2030-12-31',53000000.00,NULL),      
(156,'2025-03-10','2027-12-31',33500000.00,NULL);      




INSERT INTO Games (GameDate, HomeTeamID, AwayTeamID, StadiumID, HomeScore, AwayScore) VALUES
-- week 1
('2025-09-04', 19, 17, 19, 24, 20),  
('2025-09-05', 16, 14, 16, 27, 21), 
('2025-09-07', 25, 28, 25, 20, 23),  
('2025-09-07', 7, 6, 7, 16, 17),     
('2025-09-07', 10, 2, 10, 33, 8),    
('2025-09-07', 11, 26, 11, 26, 10), 
('2025-09-07', 3, 15, 3, 13, 20),    
('2025-09-07', 27, 29, 27, 13, 20),  
('2025-09-07', 4, 8, 4, 32, 34),    
('2025-09-07', 20, 18, 20, 21, 6),  
('2025-09-07', 13, 12, 13, 20, 12),  
('2025-09-07', 32, 31, 32, 13, 17),  
('2025-09-07', 23, 22, 23, 27, 13),  
('2025-09-07', 30, 9, 30, 14, 9),   
('2025-09-07', 1, 5, 1, 41, 40),     
('2025-09-08', 21, 24, 21, 24, 27), 
-- week 2
('2025-09-11', 23, 20, 23, 27, 18),  
('2025-09-14', 5, 7, 5, 41, 17),    
('2025-09-14', 6, 11, 6, 31, 27),   
('2025-09-14', 17, 18, 17, 40, 37), 
('2025-09-14', 22, 21, 22, 52, 21),  
('2025-09-14', 2, 3, 2, 27, 33),     
('2025-09-14', 27, 31, 27, 21, 26),  
('2025-09-14', 4, 1, 4, 10, 30),   
('2025-09-14', 8, 32, 8, 17, 31),    
('2025-09-14', 12, 30, 12, 19, 33),
('2025-09-14', 29, 26, 29, 27, 22),   
('2025-09-14', 10, 13, 10, 29, 28),  
('2025-09-14', 14, 19, 14, 17, 20), 
('2025-09-14', 24, 25, 24, 6, 22),  
('2025-09-15', 9, 28, 9, 19, 20),    
('2025-09-15', 15, 16, 15, 9, 20), 
-- week 3
('2025-09-18', 1, 2, 1, 31, 21),  
('2025-09-21', 26, 25, 26, 30, 0),  
('2025-09-21', 7, 23, 7, 13, 10),   
('2025-09-21', 11, 9, 11, 17, 10), 
('2025-09-21', 24, 6, 24, 48, 10), 
('2025-09-21', 3, 8, 3, 14, 21),   
('2025-09-21', 19, 30, 19, 33, 26), 
('2025-09-21', 28, 4, 28, 29, 27),  
('2025-09-21', 12, 10, 12, 20, 41),
('2025-09-21', 20, 15, 20, 41, 24), 
('2025-09-21', 16, 13, 16, 23, 20), 
('2025-09-21', 32, 27, 32, 44, 13), 
('2025-09-21', 21, 17, 21, 31, 14), 
('2025-09-21', 31, 29, 31, 16, 15),
('2025-09-21', 18, 14, 18, 9, 22),  
('2025-09-22', 5, 22, 5, 30, 38),
-- week 4
('2025-09-25', 29, 32, 29, 20, 23),  
('2025-09-28', 8, 24, 8, 24, 21),   
('2025-09-28', 25, 20, 25, 34, 27), 
('2025-09-28', 1, 27, 1, 31, 19),    
('2025-09-28', 22, 7, 22, 34, 10),   
('2025-09-28', 9, 12, 9, 26, 0),    
('2025-09-28', 3, 26, 3, 42, 13),    
('2025-09-28', 18, 16, 18, 21, 18),  
('2025-09-28', 28, 19, 28, 25, 31),  
('2025-09-28', 30, 10, 30, 27, 20),
('2025-09-28', 31, 11, 31, 21, 26),  
('2025-09-28', 14, 5, 14, 37, 20), 
('2025-09-28', 15, 21, 15, 24, 25), 
('2025-09-28', 17, 23, 17, 40, 40), 
('2025-09-29', 2, 4, 2, 27, 21),    
('2025-09-29', 13, 6, 13, 28, 3),
-- week 5
('2025-10-02', 30, 31, 30, 23, 26),
('2025-10-05', 7, 24, 7, 17, 21),
('2025-10-05', 5, 9, 5, 10, 44),
('2025-10-05', 26, 2, 26, 27, 24),
('2025-10-05', 10, 15, 10, 40, 6),
('2025-10-05', 27, 18, 27, 26, 14),
('2025-10-05', 4, 17, 4, 22, 37),
('2025-10-05', 19, 13, 19, 17, 21),
('2025-10-05', 29, 12, 29, 21, 22),
('2025-10-05', 32, 28, 32, 35, 38),
('2025-10-05', 6, 22, 6, 24, 37),
('2025-10-05', 16, 20, 16, 10, 27),
('2025-10-05', 1, 3, 1, 20, 23),
('2025-10-06', 11, 14, 11, 31, 28),
-- week 6
('2025-10-09', 18, 19, 18, 34, 17),
('2025-10-12', 4, 13, 4, 11, 13),
('2025-10-12', 5, 30, 5, 3, 17),
('2025-10-12', 26, 17, 26, 30, 27),
('2025-10-12', 10, 29, 10, 31, 27),
('2025-10-12', 11, 32, 11, 12, 20),
('2025-10-12', 2, 16, 2, 27, 29),
('2025-10-12', 8, 7, 8, 23, 9),
('2025-10-12', 27, 3, 27, 19, 25),
('2025-10-12', 15, 12, 15, 20, 10),
('2025-10-12', 28, 31, 28, 30, 19),
('2025-10-12', 23, 6, 23, 27, 18),
('2025-10-12', 14, 22, 14, 30, 17),
('2025-10-13', 25, 1, 25, 24, 14),
('2025-10-13', 20, 21, 20, 24, 25),
-- week 7
('2025-10-16', 6, 8, 6, 33, 31),
('2025-10-19', 11, 30, 11, 7, 35),
('2025-10-19', 21, 27, 21, 26, 14),
('2025-10-19', 7, 2, 7, 31, 6),
('2025-10-19', 14, 15, 14, 31, 0),
('2025-10-19', 24, 19, 24, 22, 28),
('2025-10-19', 4, 26, 4, 6, 13),
('2025-10-19', 12, 3, 12, 13, 31),
('2025-10-19', 13, 18, 13, 33, 32),
('2025-10-19', 16, 10, 16, 24, 38),
('2025-10-19', 29, 23, 29, 23, 27),
('2025-10-19', 17, 20, 17, 44, 22),
('2025-10-19', 31, 25, 31, 20, 10),
('2025-10-20', 22, 28, 22, 24, 9),
('2025-10-20', 32, 9, 32, 27, 19),
-- week 8
('2025-10-23', 16, 24, 16, 37, 10),
('2025-10-26', 25, 2, 25, 10, 34),
('2025-10-26', 5, 21, 5, 30, 16),
('2025-10-26', 26, 1, 26, 9, 40),
('2025-10-26', 6, 4, 6, 38, 39),
('2025-10-26', 9, 31, 9, 26, 15),
('2025-10-26', 3, 7, 3, 32, 13),
('2025-10-26', 19, 18, 19, 38, 20),
('2025-10-26', 27, 28, 27, 3, 23),
('2025-10-26', 13, 17, 13, 44, 24),
('2025-10-26', 10, 12, 10, 38, 14),
('2025-10-26', 8, 23, 8, 25, 35),
('2025-10-27', 14, 20, 14, 28, 7),
-- week 9
('2025-10-30', 2, 5, 2, 20, 24),
('2025-11-02', 6, 21, 6, 27, 17),
('2025-11-02', 22, 24, 22, 31, 23),
('2025-11-02', 23, 26, 23, 34, 20),
('2025-11-02', 9, 13, 9, 10, 17),
('2025-11-02', 3, 25, 3, 28, 20),
('2025-11-02', 18, 31, 18, 16, 27),
('2025-11-02', 8, 10, 8, 24, 27),
('2025-11-02', 12, 16, 12, 16, 27),
('2025-11-02', 30, 27, 30, 35, 17),
('2025-11-02', 15, 11, 15, 13, 20),
('2025-11-02', 1, 14, 1, 17, 27),
('2025-11-02', 20, 32, 20, 24, 13),
('2025-11-03', 17, 29, 17, 31, 14),
-- week 10
('2025-11-06', 13, 15, 13, 10, 7),
('2025-11-09', 10, 25, 10, 31, 25),
('2025-11-09', 26, 27, 26, 7, 17),
('2025-11-09', 21, 18, 21, 24, 20),
('2025-11-09', 9, 11, 9, 36, 29),
('2025-11-09', 2, 1, 2, 30, 13),
('2025-11-09', 24, 5, 24, 24, 14),
('2025-11-09', 4, 7, 4, 14, 17),
('2025-11-09', 28, 3, 28, 24, 20),
('2025-11-09', 32, 29, 32, 27, 17),
('2025-11-09', 31, 30, 31, 30, 27),
('2025-11-09', 20, 22, 20, 10, 24),
('2025-11-09', 16, 8, 16, 27, 13),
('2025-11-10', 23, 19, 23, 20, 17),
-- week 11
('2025-11-13', 3, 4, 3, 27, 14),
('2025-11-16', 2, 20, 2, 23, 20),
('2025-11-16', 25, 26, 25, 13, 27),
('2025-11-16', 1, 28, 1, 34, 31),
('2025-11-16', 11, 16, 11, 20, 17),
('2025-11-16', 24, 21, 24, 17, 13),
('2025-11-16', 18, 23, 18, 10, 27),
('2025-11-16', 8, 6, 8, 28, 17),
('2025-11-16', 12, 9, 12, 13, 16),
('2025-11-16', 29, 31, 29, 17, 24),
('2025-11-16', 30, 32, 30, 31, 24),
('2025-11-16', 7, 5, 7, 17, 31),
('2025-11-16', 13, 14, 13, 22, 19),
('2025-11-16', 19, 22, 19, 27, 24),
('2025-11-17', 15, 17, 15, 20, 17),
-- week 12 
('2025-11-20', 9, 1, 9, 20, 27),
('2025-11-23', 5, 4, 5, 27, 14),
('2025-11-23', 21, 8, 21, 17, 24),
('2025-11-23', 6, 3, 6, 30, 13),
('2025-11-23', 22, 18, 22, 41, 13),
('2025-11-23', 23, 24, 23, 27, 24),
('2025-11-23', 14, 10, 14, 30, 20),
('2025-11-23', 12, 32, 12, 13, 27),
('2025-11-23', 29, 11, 29, 24, 20),
('2025-11-23', 15, 7, 15, 17, 13),
('2025-11-23', 17, 19, 17, 20, 31),
('2025-11-23', 27, 25, 27, 17, 24),
('2025-11-23', 30, 28, 30, 27, 20),
('2025-11-24', 31, 26, 31, 34, 17),
-- week 13 
('2025-11-27', 19, 21, 19, 15, 24),
('2025-11-27', 22, 23, 22, 24, 31),
('2025-11-27', 17, 14, 17, 31, 28),
('2025-11-30', 26, 30, 26, 31, 28),
('2025-11-30', 7, 31, 7, 8, 26),
('2025-11-30', 10, 9, 10, 16, 20),
('2025-11-30', 2, 27, 2, 21, 17),
('2025-11-30', 4, 25, 4, 27, 24),
('2025-11-30', 28, 29, 28, 20, 17),
('2025-11-30', 12, 11, 12, 3, 25),
('2025-11-30', 32, 24, 32, 26, 0),
('2025-11-30', 16, 15, 16, 31, 14),
('2025-11-30', 8, 1, 8, 7, 26),
('2025-11-30', 20, 13, 20, 26, 27),
('2025-12-01', 3, 18, 3, 33, 15),
('2025-11-30', 5, 6, 5, 14, 32),
-- week 14
('2025-12-04', 22, 17, 22, 34, 20),
('2025-12-07', 25, 32, 25, 13, 17),
('2025-12-07', 5, 8, 5, 23, 27),
('2025-12-07', 7, 12, 7, 17, 20),
('2025-12-07', 11, 10, 11, 36, 19),
('2025-12-07', 24, 20, 24, 27, 24),
('2025-12-07', 4, 2, 4, 10, 34),
('2025-12-07', 28, 27, 28, 28, 13),
('2025-12-07', 1, 6, 1, 28, 24),
('2025-12-07', 15, 13, 15, 17, 24),
('2025-12-07', 23, 21, 23, 30, 17),
('2025-12-07', 29, 30, 29, 17, 31),
('2025-12-07', 14, 9, 14, 27, 24),
('2025-12-08', 16, 19, 16, 20, 27),
-- week 15 
('2025-12-11', 28, 25, 28, 28, 29),
('2025-12-14', 21, 7, 21, 31, 3),
('2025-12-14', 6, 5, 6, 0, 24),
('2025-12-14', 9, 29, 9, 40, 20),
('2025-12-14', 11, 4, 11, 48, 20),
('2025-12-14', 14, 16, 14, 13, 16),
('2025-12-14', 3, 1, 3, 31, 35),
('2025-12-14', 18, 20, 18, 21, 29),
('2025-12-14', 19, 15, 19, 31, 0),
('2025-12-14', 13, 23, 13, 34, 26),
('2025-12-14', 30, 22, 30, 41, 34),
('2025-12-14', 27, 26, 27, 20, 17),
('2025-12-14', 32, 10, 32, 18, 16),
('2025-12-14', 31, 12, 31, 37, 24),
('2025-12-14', 17, 24, 17, 26, 34),
('2025-12-15', 8, 2, 8, 28, 15),
-- week 16
('2025-12-18', 32, 30, 32, 38, 37),
('2025-12-21', 20, 19, 20, 18, 29),
('2025-12-21', 21, 23, 21, 22, 16),
('2025-12-21', 26, 28, 26, 23, 20),
('2025-12-21', 7, 1, 7, 20, 23),
('2025-12-21', 17, 16, 17, 17, 34),
('2025-12-21', 18, 24, 18, 13, 16),
('2025-12-21', 12, 14, 12, 26, 9),
('2025-12-21', 2, 6, 2, 21, 45),
('2025-12-21', 29, 25, 29, 19, 26),
('2025-12-21', 13, 11, 13, 20, 34),
('2025-12-21', 22, 8, 22, 24, 29),
('2025-12-21', 27, 4, 27, 17, 27),
('2025-12-21', 9, 15, 9, 23, 21),
('2025-12-21', 5, 3, 5, 24, 28),
('2025-12-22', 10, 31, 10, 27, 48),
-- week 17 
('2025-12-25', 20, 17, 20, 23, 30),
('2025-12-25', 24, 22, 24, 23, 10),
('2025-12-25', 14, 13, 14, 13, 20),
('2025-12-27', 16, 9, 16, 16, 20),
('2025-12-27', 23, 5, 23, 24, 41),
('2025-12-28', 26, 32, 26, 10, 27),
('2025-12-28', 6, 29, 6, 37, 14),
('2025-12-28', 7, 8, 7, 13, 6),
('2025-12-28', 10, 11, 10, 17, 23),
('2025-12-28', 2, 28, 2, 20, 17),
('2025-12-28', 4, 3, 4, 10, 42),
('2025-12-28', 12, 27, 12, 26, 34),
('2025-12-28', 15, 18, 15, 10, 34),
('2025-12-28', 1, 19, 1, 12, 13),
('2025-12-28', 31, 21, 31, 42, 38),
('2025-12-29', 25, 30, 25, 27, 24),
-- week 18
('2026-01-03', 28, 26, 28, 16, 14),
('2026-01-03', 31, 32, 31, 3, 13),
('2026-01-04', 25, 27, 25, 19, 17),
('2026-01-04', 6, 7, 6, 18, 20),
('2026-01-04', 9, 10, 9, 38, 30),
('2026-01-04', 11, 12, 11, 41, 7),
('2026-01-04', 24, 23, 24, 16, 3),
('2026-01-04', 18, 17, 18, 34, 17),
('2026-01-04', 1, 4, 1, 35, 8),
('2026-01-04', 21, 22, 21, 16, 19),
('2026-01-04', 13, 16, 13, 19, 3),
('2026-01-04', 30, 29, 30, 37, 20),
('2026-01-04', 15, 14, 15, 14, 12),
('2026-01-04', 3, 2, 3, 38, 10),
('2026-01-04', 19, 20, 19, 17, 24),
('2026-01-04', 8, 5, 8, 26, 24);


INSERT INTO PlayerStats (PlayerID, GameID, PassingYards, RushingYards, ReceivingYards, Touchdowns, Tackles) VALUES

(66,2,258,57,0,2,0),
(76,2,318,32,0,3,0),
(31,4,290,6,0,1,0),
(26,4,113,3,0,1,0),
(6,5,114,7,0,1,0),
(51,6,178,12,0,1,0),
(11,7,287,11,0,1,0),
(71,7,362,10,0,1,0),
(16,9,218,48,0,3,0),
(61,11,176,18,0,1,0),
(56,11,112,0,0,0,0),
(41,14,188,32,0,0,0),
(1,15,394,30,0,4,0),
(21,15,209,70,0,3,0),

(21,18,225,13,0,4,0),
(31,18,199,8,0,1,0),
(26,19,76,0,0,1,0),
(51,19,271,4,0,3,0),
(6,22,315,0,0,2,0),
(11,22,230,31,0,3,0),
(16,24,27,49,0,0,0),
(1,24,148,59,0,0,0),
(61,28,206,20,0,3,0),
(66,29,187,66,0,2,0),
(41,31,207,27,0,1,0),
(76,32,242,31,0,2,0),
(71,32,180,20,0,0,0),

(1,33,213,25,0,3,0),    
(6,33,146,10,0,2,0),     
(121,34,172,9,0,0,0),    
(31,35,142,0,0,0,0),      
(111,35,183,18,0,1,0),   
(11,36,268,45,0,2,0),     
(41,36,204,22,0,1,0),     
(91,39,226,40,0,4,0),     
(146,39,196,0,0,2,0),     
(136,40,233,44,0,1,0),   
(56,41,219,12,0,1,0),
(71,42,289,5,0,3,0),      
(76,43,300,6,0,1,0),     
(61,43,153,33,0,1,0),   
(156,44,218,0,0,2,0),    
(101,45,298,12,0,4,0),   
(81,45,251,0,0,1,0),     
(141,46,159,37,0,1,0),  
(66,47,224,2,0,1,0),     
(21,48,288,35,0,3,0),    
(106,48,202,6,0,1,0),    

(141,49,200,41,0,2,0),
(156,49,242,24,0,1,0),
(121,51,313,2,0,2,0),
(1,52,209,45,0,3,0),
(106,53,168,0,0,2,0),
(31,53,184,-1,0,0,0),
(41,54,233,11,0,2,0),
(56,54,108,22,0,0,0),
(11,55,203,11,0,3,0),
(126,55,150,3,0,1,0),
(76,56,203,24,0,1,0),
(136,57,289,13,0,2,0),
(91,57,130,62,0,2,0),
(146,58,375,4,0,3,0),
(151,59,309,13,0,2,0),
(51,59,174,7,0,1,0),
(66,60,270,5,0,4,0),
(21,60,147,48,0,1,0),
(71,61,117,31,0,2,0),
(101,61,212,13,0,1,0),
(81,62,319,2,0,4,0),
(111,62,337,28,0,3,0),
(6,63,177,6,0,2,0),
(16,63,226,81,0,2,0),
(61,64,326,7,0,3,0),

(146,65,389,0,0,3,0),    
(41,67,244,30,0,4,0),    
(126,68,198,1,0,2,0),    
(6,68,256,5,0,3,0),      
(46,69,9,0,0,0,0),      
(71,69,228,8,0,0,0),     
(16,71,283,26,0,2,0),   
(81,71,237,28,0,4,0),   
(91,72,280,3,0,2,0),     
(61,72,242,22,0,1,0),    
(141,73,220,25,0,1,0),   
(56,73,265,-6,0,0,0),    
(156,74,341,0,0,4,0),    
(136,74,379,15,0,2,0),   
(106,75,258,-2,0,3,0),   
(76,76,166,60,0,1,0),    
(96,76,231,39,0,1,0),    
(1,77,253,53,0,2,0),    
(11,77,273,12,0,0,0),   
(51,78,221,54,0,3,0),   
(66,78,318,60,0,2,0), 

(91,79,283,13,0,2,0),    
(16,80,45,31,0,0,0),     
(61,80,174,24,0,1,0),     
(146,81,181,1,0,1,0),     
(31,82,219,0,0,2,0),     
(81,82,261,-1,0,3,0),    
(51,84,258,9,0,2,0),      
(156,84,295,2,0,2,0),     
(56,85,222,0,0,1,0),     
(6,85,205,4,0,1,0),      
(76,86,264,2,0,2,0),      
(71,86,174,-3,0,1,0), 
(11,88,261,28,0,3,0),    
(136,89,256,14,0,2,0),    
(111,90,259,26,0,1,0),    
(106,90,203,7,0,2,0),    
(66,91,257,32,0,4,0),     
(121,92,250,6,0,1,0),     
(1,92,180,42,0,2,0),     
(96,93,211,52,0,3,0),    
(101,93,252,-2,0,2,0);   

ALTER TABLE PlayerStats
ADD CONSTRAINT uq_player_game UNIQUE (PlayerID, GameID);


-- INJURIES DATA
INSERT INTO Injuries (PlayerID, InjuryType, InjuryDate, RecoveryDate, Status) VALUES
(9,   'Shoulder',        '2025-09-18', NULL, 'Questionable'), 
(16,  'Concussion',      '2025-09-21', NULL, 'Out'),          
(37,  'Knee',            '2025-09-28', NULL, 'Questionable'),
(80,  'Knee',            '2025-09-28', NULL, 'Out'),          
(87,  'Shoulder',        '2025-09-28', NULL, 'Out'),         
(96,  'Knee',            '2025-09-28', NULL, 'Out'),          
(98,  'Quadricep',       '2025-09-28', NULL, 'Out'),         
(113, 'Foot, Shoulder',  '2025-09-21', NULL, 'Out'),         
(116, 'Ankle',           '2025-09-28', NULL, 'Out'),         
(127, 'Calf',            '2025-09-28', NULL, 'Questionable'),
(129, 'Hamstring',       '2025-09-28', NULL, 'Out'),        
(130, 'Ankle',           '2025-09-28', NULL, 'Out'),          
(136, 'Biceps',          '2025-09-28', NULL, 'Questionable'), 
(138, 'Hamstring',       '2025-09-28', NULL, 'Out'),         
(139, 'Ankle',           '2025-09-15', NULL, 'Out'),          
(149, 'Hamstring',       '2025-09-28', NULL, 'Questionable'), 
(150, 'Hip',             '2025-09-28', NULL, 'Questionable'), 


(151, 'Toe',             '2025-10-02', NULL, 'Out'),         
(150, 'Hip',             '2025-10-02', NULL, 'Doubtful'),    
(116, 'Ankle',           '2025-10-05', NULL, 'Out'),          
(127, 'Calf',            '2025-10-05', NULL, 'Out'),         
(130, 'Ankle',           '2025-10-05', NULL, 'Out'),          
(21,  'Hamstring',       '2025-10-05', NULL, 'Out'),         
(75,  'Knee',            '2025-10-05', NULL, 'Questionable'),
(83,  'Ankle',           '2025-10-05', NULL, 'Out'),         
(98,  'Quadricep',       '2025-10-05', NULL, 'Out'),          
(138, 'Hamstring',       '2025-10-05', NULL, 'Out'),          
(154, 'Ankle, Rib',      '2025-10-02', NULL, 'Out'),          
(42,  'Ankle',           '2025-10-05', NULL, 'Questionable'), 
(35,  'Ankle',           '2025-10-05', NULL, 'Questionable'), 
(155, 'Foot',            '2025-10-05', NULL, 'Questionable'),
(157, 'Shoulder',        '2025-10-05', NULL, 'Questionable'), 


(21,  'Hamstring',       '2025-10-12', NULL, 'Out'),         
(83,  'Ankle',           '2025-10-12', NULL, 'Out'),         
(98,  'Quadricep',       '2025-10-12', NULL, 'Out'),         
(138, 'Hamstring',       '2025-10-12', NULL, 'Out'),         
(139, 'Fibula',          '2025-10-12', NULL, 'Out'),         
(137, 'Foot, Shoulder',  '2025-10-12', NULL, 'Out'),          
(127, 'Calf',            '2025-10-12', NULL, 'Out'),        
(130, 'Ankle',           '2025-10-12', NULL, 'Questionable'), 
(75,  'Knee',            '2025-10-12', NULL, 'Out'),          
(154, 'Ankle, Rib',      '2025-10-12', NULL, 'Questionable'), 
(17,  'Hamstring',       '2025-10-12', NULL, 'Questionable'), 
(133, 'Hamstring',       '2025-10-12', NULL, 'Questionable'), 
(132, 'Ankle',           '2025-10-12', NULL, 'Questionable'), 
(88,  'Groin',           '2025-10-12', NULL, 'Questionable'), 
(149, 'Illness, Wrist',  '2025-10-12', NULL, 'Questionable'); 

SELECT * FROM Teams;
SELECT * FROM Coaches;
SELECT * FROM PlayerStats;
SELECT * FROM Injuries;

SELECT Players.FirstName, Players.LastName, Teams.TeamName
FROM Players
JOIN Teams ON Players.TeamID = Teams.TeamID;

SELECT Players.FirstName, Players.LastName, Contracts.Salary
FROM Contracts
JOIN Players ON Contracts.PlayerID = Players.PlayerID;


SELECT Players.FirstName, Players.LastName, Injuries.InjuryType, Injuries.Status
FROM Injuries
JOIN Players ON Injuries.PlayerID = Players.PlayerID;



SELECT 
    p.PlayerID,
    p.FirstName,
    p.LastName,
    t.TeamName,
    SUM(ps.PassingYards) AS TotalPassingYards
FROM PlayerStats ps
JOIN Players p ON ps.PlayerID = p.PlayerID
JOIN Teams t ON p.TeamID = t.TeamID
WHERE p.Position = 'QB'
GROUP BY p.PlayerID, p.FirstName, p.LastName, t.TeamName
ORDER BY TotalPassingYards DESC;


SELECT 
    p.PlayerID,
    p.FirstName,
    p.LastName,
    ROUND(AVG(ps.PassingYards), 2) AS AvgPassingYards
FROM PlayerStats ps
JOIN Players p ON ps.PlayerID = p.PlayerID
WHERE p.Position = 'QB'
GROUP BY p.PlayerID, p.FirstName, p.LastName
ORDER BY AvgPassingYards DESC;


SELECT
    g.GameID,
    g.GameDate,
    home.TeamName AS HomeTeam,
    away.TeamName AS AwayTeam,
    g.HomeScore,
    g.AwayScore,
    CASE
        WHEN g.HomeScore > g.AwayScore THEN home.TeamName
        WHEN g.AwayScore > g.HomeScore THEN away.TeamName
        ELSE 'Tie'
    END AS WinningTeam
FROM Games g
JOIN Teams home ON g.HomeTeamID = home.TeamID
JOIN Teams away ON g.AwayTeamID = away.TeamID
ORDER BY g.GameDate, g.GameID;

SELECT 
    WinningTeam,
    COUNT(*) AS TotalWins
FROM (
    SELECT 
        CASE
            WHEN g.HomeScore > g.AwayScore THEN home.TeamName
            WHEN g.AwayScore > g.HomeScore THEN away.TeamName
            ELSE NULL
        END AS WinningTeam
    FROM Games g
    JOIN Teams home ON g.HomeTeamID = home.TeamID
    JOIN Teams away ON g.AwayTeamID = away.TeamID
) AS GameWinners
WHERE WinningTeam IS NOT NULL
GROUP BY WinningTeam
ORDER BY TotalWins DESC;

SELECT
    p.FirstName,
    p.LastName,
    t.TeamName,
    SUM(
        CASE
            WHEN (g.HomeTeamID = p.TeamID AND g.HomeScore > g.AwayScore)
              OR (g.AwayTeamID = p.TeamID AND g.AwayScore > g.HomeScore)
            THEN 1
            ELSE 0
        END
    ) AS TeamWins,
    SUM(ps.Touchdowns) AS TotalTouchdowns,
    SUM(ps.PassingYards) AS TotalPassingYards
FROM PlayerStats ps
JOIN Players p ON ps.PlayerID = p.PlayerID
JOIN Teams t ON p.TeamID = t.TeamID
JOIN Games g ON ps.GameID = g.GameID
WHERE p.Position = 'QB'
GROUP BY p.PlayerID, p.FirstName, p.LastName, t.TeamName
ORDER BY TeamWins DESC, TotalTouchdowns DESC, TotalPassingYards DESC;







