
create table Users (
  UserID SERIAL PRIMARY KEY,
  Name VARCHAR(100) Not Null,
  RollNumber VARCHAR(20) UNIQUE Not Null,
  Email VARCHAR(100) UNIQUE Not Null
);
CREATE DATABASE `smartbookdiscoveryandfeedbacksystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

create table Authors (
  AuthorID SERIAL PRIMARY KEY,
  Name VARCHAR(100) UNIQUE Not Null
);

create table Publishers (
  PublisherID SERIAL PRIMARY KEY,
  Name VARCHAR(100) UNIQUE Not Null
);

create table Books (
  BookID SERIAL PRIMARY KEY,
  Title VARCHAR(255) Not Null,
  ISBN VARCHAR(20) UNIQUE Not Null,
  AuthorID INT REFERENCES Authors(AuthorID),
  PublisherID INT REFERENCES Publishers(PublisherID),
  Edition VARCHAR(20),
  Year INT
);

create table LibraryAvailability (
  BookID INT PRIMARY KEY REFERENCES Books(BookID),
  IsAvailable BOOLEAN DEFAULT TRUE,
  NoOfCopies INT DEFAULT 1 CHECK (NoOfCopies >= 0),
  ShelfLocation VARCHAR(50)
);

create table topics (
  topicID SERIAL PRIMARY KEY,
  Name VARCHAR(50) UNIQUE Not Null
);

create table Booktopics (
  BookID INT REFERENCES Books(BookID),
  topicID INT REFERENCES topics(topicID),
  PRIMARY KEY (BookID, topicID)
);
create table Reviews (
  ReViewID SERIAL PRIMARY KEY,
  BookID INT REFERENCES Books(BookID),
  UserID INT REFERENCES Users(UserID),
  Rating INT CHECK (Rating BETWEEN 1 AND 5),
  Comment TEXT,
  Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_User_book_reView UNIQUE (BookID, UserID)
);
ALTER TABLE Reviews
ADD COLUMN ReViewText TEXT ;

create table Votes (
  VoteID SERIAL PRIMARY KEY,
  ReViewID INT REFERENCES Reviews(ReViewID),
  UserID INT REFERENCES Users(UserID),
  VoteType VARCHAR(5) CHECK (VoteType IN ('Up', 'Down')),
  CONSTRAINT unique_vote_per_reView UNIQUE (ReViewID, UserID)
);






insert INto Users (Name, RollNumber, Email) VALUES ('Dheeraj Bhasuru', '23MAB0A42', 'dheerajb@nitw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('Srinivas Bhupati', '23MAB0A13', 'srinubhupati@nitw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('Vaastav', '23MAB0A06', 'tvaastav@nitw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('Satvik', '23MAB0A11', 'Satvik@nitw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('Pranathi', '23MAB0A14', 'Pranathi@nitw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('OmVenkat', '23CSB0B05', 'om@nitw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('keshav', '23CSB0B08', 'keshav@nitw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('sudhanush', '23CSB0B14', 'sudhanush@nitw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('hemath', '23CSB0B26', 'Hemanth@itw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('Tharun', '23CSB0B25', 'tharun@nitw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('Suhasitha', '23CSB0B27', 'Suhasitha@nitw.ac.in');
insert INto Users (Name, RollNumber, Email) VALUES ('Hari', '23CSB0B28', 'Hari@nitw.ac.in');


insert INto topics (topicID, Name) VALUES (1, 'Mathematics');
insert INto topics (topicID, Name) VALUES (2, 'Computer Science');
insert INto topics (topicID, Name) VALUES (3, 'Machine Learning');
insert INto topics (topicID, Name) VALUES (4, 'Statistics');
insert INto topics (topicID, Name) VALUES (5, 'ECE');
insert INto topics (topicID, Name) VALUES (6, 'EEE');
insert INto topics (topicID, Name) VALUES (7, 'Mechanical');
insert INto topics (topicID, Name) VALUES (8, 'Miscellaneous');

insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mathematics Book 1', '978-3515636423', 4, 4, '4th', 2011);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mathematics Book 2', '978-4595193116', 9, 1, '5th', 2004);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mathematics Book 3', '978-3273284494', 4, 3, '5th', 2001);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mathematics Book 4', '978-8718238391', 3, 1, '3th', 2008);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mathematics Book 5', '978-4500170751', 6, 4, '4th', 2007);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mathematics Book 6', '978-5751723838', 10, 5, '5th', 2017);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mathematics Book 7', '978-1808208429', 4, 4, '2th', 2001);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mathematics Book 8', '978-3396410351', 6, 4, '4th', 2017);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mathematics Book 9', '978-2911576198', 10, 3, '5th', 2004);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mathematics Book 10', '978-1995906140', 2, 3, '5th', 2007);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 1', '978-9466620422', 1, 1, '2th', 2007);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 2', '978-9357738518', 7, 2, '1th', 2004);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 3', '978-7421028749', 8, 2, '3th', 2019);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 4', '978-1855580231', 7, 1, '3th', 2004);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 5', '978-1517051041', 5, 2, '2th', 2010);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 6', '978-3345377508', 10, 2, '1th', 2017);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 7', '978-7141880644', 1, 4, '5th', 2023);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 8', '978-6647807926', 4, 1, '2th', 2021);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 9', '978-5983571807', 8, 5, '2th', 2008);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 10', '978-4432651034', 1, 1, '2th', 2009);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 11', '978-9800527907', 8, 4, '1th', 2016);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 12', '978-3460952184', 4, 4, '1th', 2007);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 13', '978-1389556018', 10, 2, '1th', 2003);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 14', '978-7497588509', 6, 2, '2th', 2002);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 15', '978-7360259598', 9, 3, '1th', 2012);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 16', '978-7734661799', 9, 5, '3th', 2007);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 17', '978-6788584424', 8, 2, '1th', 2013);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 18', '978-9872723611', 4, 2, '1th', 2005);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 19', '978-5571745250', 10, 3, '5th', 2006);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 20', '978-4908597594', 3, 5, '2th', 2017);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 21', '978-5847039535', 9, 1, '3th', 2015);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 22', '978-1084869149', 9, 3, '2th', 2011);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 23', '978-2381762044', 10, 4, '3th', 2001);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 24', '978-2860044811', 10, 3, '4th', 2015);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 25', '978-3148462996', 5, 4, '4th', 2023);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 26', '978-4740593828', 9, 3, '4th', 2020);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 27', '978-8107303009', 7, 4, '5th', 2021);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 28', '978-6639802562', 5, 4, '1th', 2017);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 29', '978-1035870410', 1, 5, '4th', 2003);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 30', '978-8570511399', 7, 5, '2th', 2021);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 31', '978-9782459231', 9, 1, '3th', 2002);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 32', '978-9229594088', 10, 3, '3th', 2018);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 33', '978-2106488566', 3, 2, '3th', 2011);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 34', '978-1165864492', 8, 2, '3th', 2004);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 35', '978-4065815676', 1, 2, '3th', 2012);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 36', '978-4998194600', 7, 4, '5th', 2020);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 37', '978-4309339397', 4, 3, '1th', 2000);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 38', '978-3821771248', 9, 1, '3th', 2004);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 39', '978-5195137162', 2, 1, '3th', 2014);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 40', '978-4799611210', 10, 2, '4th', 2014);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 41', '978-8691324799', 4, 5, '3th', 2015);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 42', '978-9060581863', 10, 2, '5th', 2010);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 43', '978-6057504225', 4, 2, '3th', 2012);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 44', '978-9809482654', 10, 3, '4th', 2005);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 45', '978-5759378321', 3, 4, '4th', 2012);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 46', '978-4167872691', 7, 4, '3th', 2019);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 47', '978-6837665064', 1, 5, '5th', 2012);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 48', '978-7238543630', 3, 4, '5th', 2006);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 49', '978-1004041276', 5, 3, '5th', 2010);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 50', '978-2317201135', 6, 3, '4th', 2022);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 51', '978-1899301736', 8, 4, '5th', 2009);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 52', '978-8677728948', 3, 2, '2th', 2014);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 53', '978-7482114681', 10, 3, '1th', 2009);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 54', '978-1155365243', 7, 5, '1th', 2011);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 55', '978-1657252602', 2, 1, '1th', 2001);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 56', '978-6798197180', 7, 5, '4th', 2012);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 57', '978-8967545085', 8, 5, '1th', 2001);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 58', '978-8637153426', 9, 5, '2th', 2006);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 59', '978-3365517680', 5, 2, '1th', 2024);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 60', '978-5704696257', 9, 3, '1th', 2016);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 61', '978-6546710996', 9, 2, '4th', 2020);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 62', '978-8364974624', 4, 2, '1th', 2003);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 63', '978-5102018503', 8, 4, '1th', 2002);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 64', '978-1812388987', 4, 2, '5th', 2016);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 65', '978-8573249829', 5, 2, '4th', 2024);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 66', '978-3617246873', 1, 1, '3th', 2018);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 67', '978-8907521763', 9, 2, '3th', 2004);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 68', '978-7016074855', 4, 1, '4th', 2006);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 69', '978-8453236160', 4, 5, '4th', 2018);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 70', '978-2661968782', 8, 5, '3th', 2007);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 71', '978-8497157189', 7, 2, '1th', 2019);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 72', '978-1579964002', 1, 1, '4th', 2022);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 73', '978-6151024150', 3, 1, '1th', 2008);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 74', '978-3660619342', 10, 2, '4th', 2014);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 75', '978-6900540781', 5, 1, '4th', 2014);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 76', '978-8899771598', 4, 1, '5th', 2022);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 77', '978-2492743813', 7, 5, '1th', 2019);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 78', '978-3317210904', 5, 5, '1th', 2010);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 79', '978-5763233476', 2, 3, '2th', 2013);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 80', '978-8533084133', 6, 3, '5th', 2018);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 81', '978-8591529684', 3, 4, '5th', 2008);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 82', '978-1154685788', 9, 3, '3th', 2006);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 83', '978-9840052011', 4, 1, '1th', 2021);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 84', '978-1657915616', 3, 2, '2th', 2012);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 85', '978-9518872049', 3, 3, '4th', 2002);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 86', '978-6630717973', 5, 3, '5th', 2019);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 87', '978-3970264180', 5, 5, '5th', 2002);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 88', '978-7557888434', 7, 5, '1th', 2019);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 89', '978-9922303869', 8, 4, '1th', 2011);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 90', '978-8429576941', 8, 4, '4th', 2009);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 91', '978-7156676249', 8, 2, '2th', 2012);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 92', '978-6656888303', 3, 2, '5th', 2017);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 93', '978-9626210036', 6, 2, '4th', 2001);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 94', '978-3507418928', 8, 1, '4th', 2004);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 95', '978-6374351231', 3, 5, '1th', 2004);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 96', '978-9392525512', 6, 4, '2th', 2006);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 97', '978-4686072988', 2, 2, '1th', 2002);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 98', '978-7129591724', 1, 1, '2th', 2008);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 99', '978-5561669224', 9, 2, '3th', 2003);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('CSE Book 100', '978-2883085393', 7, 2, '3th', 2024);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Machine Learning Book 1', '978-4711754228', 10, 1, '5th', 2005);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Machine Learning Book 2', '978-4112970996', 10, 3, '3th', 2013);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Machine Learning Book 3', '978-7438354650', 1, 4, '3th', 2011);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Machine Learning Book 4', '978-3606661776', 7, 3, '1th', 2019);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Machine Learning Book 5', '978-5762088358', 5, 5, '3th', 2016);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Machine Learning Book 6', '978-6596719861', 10, 5, '1th', 2005);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Machine Learning Book 7', '978-5510966421', 1, 1, '3th', 2023);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Machine Learning Book 8', '978-6447650467', 5, 5, '4th', 2002);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Machine Learning Book 9', '978-5366002118', 3, 1, '5th', 2007);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Machine Learning Book 10', '978-6963990947', 1, 4, '4th', 2011);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Statistics Book 1', '978-5338641119', 2, 4, '4th', 2003);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Statistics Book 2', '978-7986650069', 4, 1, '5th', 2019);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Statistics Book 3', '978-4939369292', 4, 1, '3th', 2002);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Statistics Book 4', '978-1880366476', 3, 2, '3th', 2020);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Statistics Book 5', '978-6501206006', 4, 1, '3th', 2010);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Statistics Book 6', '978-8816035958', 2, 3, '4th', 2014);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Statistics Book 7', '978-1452911893', 1, 4, '2th', 2017);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Statistics Book 8', '978-2663330249', 5, 4, '5th', 2023);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Statistics Book 9', '978-5000605583', 4, 5, '4th', 2017);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Statistics Book 10', '978-7027162930', 10, 5, '3th', 2018);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('ECE Book 1', '978-1072056760', 8, 2, '1th', 2005);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('ECE Book 2', '978-9324625840', 10, 3, '1th', 2008);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('ECE Book 3', '978-2363353724', 7, 1, '4th', 2005);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('ECE Book 4', '978-9251977253', 4, 3, '5th', 2011);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('ECE Book 5', '978-3777350598', 8, 2, '1th', 2016);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('ECE Book 6', '978-3894072204', 7, 4, '1th', 2015);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('ECE Book 7', '978-4431754707', 2, 2, '2th', 2004);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('ECE Book 8', '978-6258054131', 3, 4, '4th', 2003);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('ECE Book 9', '978-6711856668', 6, 2, '3th', 2001);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('ECE Book 10', '978-5082624661', 8, 1, '2th', 2016);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('EEE Book 1', '978-2289906582', 7, 4, '1th', 2018);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('EEE Book 2', '978-4870319505', 5, 5, '2th', 2019);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('EEE Book 3', '978-4423279899', 2, 5, '2th', 2005);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('EEE Book 4', '978-9004726298', 4, 3, '1th', 2005);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('EEE Book 5', '978-8703469167', 9, 5, '4th', 2003);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('EEE Book 6', '978-3962667275', 8, 1, '4th', 2008);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('EEE Book 7', '978-5265672685', 6, 2, '2th', 2001);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('EEE Book 8', '978-9841460747', 1, 5, '1th', 2018);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('EEE Book 9', '978-1271516844', 3, 4, '5th', 2008);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('EEE Book 10', '978-9646691400', 6, 2, '1th', 2021);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mechanical Book 1', '978-1090459131', 9, 3, '4th', 2019);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mechanical Book 2', '978-2069622848', 2, 5, '4th', 2020);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mechanical Book 3', '978-2484132098', 4, 2, '1th', 2007);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mechanical Book 4', '978-8784752094', 7, 5, '3th', 2017);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mechanical Book 5', '978-4557145484', 4, 3, '2th', 2024);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mechanical Book 6', '978-4174720069', 5, 3, '5th', 2008);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mechanical Book 7', '978-4575555795', 7, 3, '4th', 2014);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mechanical Book 8', '978-9064403577', 6, 4, '5th', 2018);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mechanical Book 9', '978-7914772983', 9, 2, '5th', 2003);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Mechanical Book 10', '978-3279552390', 1, 5, '3th', 2013);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Miscellaneous Book 1', '978-3148494280', 8, 4, '3th', 2010);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Miscellaneous Book 2', '978-6839235230', 8, 5, '5th', 2009);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Miscellaneous Book 3', '978-3343447548', 3, 5, '2th', 2015);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Miscellaneous Book 4', '978-5434010068', 6, 4, '2th', 2006);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Miscellaneous Book 5', '978-8726381557', 3, 1, '4th', 2024);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Miscellaneous Book 6', '978-2134512836', 6, 1, '1th', 2022);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Miscellaneous Book 7', '978-4483280835', 3, 2, '2th', 2007);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Miscellaneous Book 8', '978-5904214333', 5, 4, '4th', 2001);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Miscellaneous Book 9', '978-4053688892', 9, 5, '3th', 2015);
insert INto Books (Title, ISBN, AuthorID, PublisherID, Edition, Year) VALUES ('Miscellaneous Book 10', '978-2031405439', 2, 3, '2th', 2011);

-- Link Books to topics
insert INto Booktopics (BookID, topicID) VALUES (1, 1);
insert INto Booktopics (BookID, topicID) VALUES (2, 1);
insert INto Booktopics (BookID, topicID) VALUES (3, 1);
insert INto Booktopics (BookID, topicID) VALUES (4, 1);
insert INto Booktopics (BookID, topicID) VALUES (5, 1);
insert INto Booktopics (BookID, topicID) VALUES (6, 1);
insert INto Booktopics (BookID, topicID) VALUES (7, 1);
insert INto Booktopics (BookID, topicID) VALUES (8, 1);
insert INto Booktopics (BookID, topicID) VALUES (9, 1);
insert INto Booktopics (BookID, topicID) VALUES (10, 1);
insert INto Booktopics (BookID, topicID) VALUES (11, 2);
insert INto Booktopics (BookID, topicID) VALUES (12, 2);
insert INto Booktopics (BookID, topicID) VALUES (13, 2);
insert INto Booktopics (BookID, topicID) VALUES (14, 2);
insert INto Booktopics (BookID, topicID) VALUES (15, 2);
insert INto Booktopics (BookID, topicID) VALUES (16, 2);
insert INto Booktopics (BookID, topicID) VALUES (17, 2);
insert INto Booktopics (BookID, topicID) VALUES (18, 2);
insert INto Booktopics (BookID, topicID) VALUES (19, 2);
insert INto Booktopics (BookID, topicID) VALUES (20, 2);
insert INto Booktopics (BookID, topicID) VALUES (21, 2);
insert INto Booktopics (BookID, topicID) VALUES (22, 2);
insert INto Booktopics (BookID, topicID) VALUES (23, 2);
insert INto Booktopics (BookID, topicID) VALUES (24, 2);
insert INto Booktopics (BookID, topicID) VALUES (25, 2);
insert INto Booktopics (BookID, topicID) VALUES (26, 2);
insert INto Booktopics (BookID, topicID) VALUES (27, 2);
insert INto Booktopics (BookID, topicID) VALUES (28, 2);
insert INto Booktopics (BookID, topicID) VALUES (29, 2);
insert INto Booktopics (BookID, topicID) VALUES (30, 2);
insert INto Booktopics (BookID, topicID) VALUES (31, 2);
insert INto Booktopics (BookID, topicID) VALUES (32, 2);
insert INto Booktopics (BookID, topicID) VALUES (33, 2);
insert INto Booktopics (BookID, topicID) VALUES (34, 2);
insert INto Booktopics (BookID, topicID) VALUES (35, 2);
insert INto Booktopics (BookID, topicID) VALUES (36, 2);
insert INto Booktopics (BookID, topicID) VALUES (37, 2);
insert INto Booktopics (BookID, topicID) VALUES (38, 2);
insert INto Booktopics (BookID, topicID) VALUES (39, 2);
insert INto Booktopics (BookID, topicID) VALUES (40, 2);
insert INto Booktopics (BookID, topicID) VALUES (41, 2);
insert INto Booktopics (BookID, topicID) VALUES (42, 2);
insert INto Booktopics (BookID, topicID) VALUES (43, 2);
insert INto Booktopics (BookID, topicID) VALUES (44, 2);
insert INto Booktopics (BookID, topicID) VALUES (45, 2);
insert INto Booktopics (BookID, topicID) VALUES (46, 2);
insert INto Booktopics (BookID, topicID) VALUES (47, 2);
insert INto Booktopics (BookID, topicID) VALUES (48, 2);
insert INto Booktopics (BookID, topicID) VALUES (49, 2);
insert INto Booktopics (BookID, topicID) VALUES (50, 2);
insert INto Booktopics (BookID, topicID) VALUES (51, 2);
insert INto Booktopics (BookID, topicID) VALUES (52, 2);
insert INto Booktopics (BookID, topicID) VALUES (53, 2);
insert INto Booktopics (BookID, topicID) VALUES (54, 2);
insert INto Booktopics (BookID, topicID) VALUES (55, 2);
insert INto Booktopics (BookID, topicID) VALUES (56, 2);
insert INto Booktopics (BookID, topicID) VALUES (57, 2);
insert INto Booktopics (BookID, topicID) VALUES (58, 2);
insert INto Booktopics (BookID, topicID) VALUES (59, 2);
insert INto Booktopics (BookID, topicID) VALUES (60, 2);
insert INto Booktopics (BookID, topicID) VALUES (61, 2);
insert INto Booktopics (BookID, topicID) VALUES (62, 2);
insert INto Booktopics (BookID, topicID) VALUES (63, 2);
insert INto Booktopics (BookID, topicID) VALUES (64, 2);
insert INto Booktopics (BookID, topicID) VALUES (65, 2);
insert INto Booktopics (BookID, topicID) VALUES (66, 2);
insert INto Booktopics (BookID, topicID) VALUES (67, 2);
insert INto Booktopics (BookID, topicID) VALUES (68, 2);
insert INto Booktopics (BookID, topicID) VALUES (69, 2);
insert INto Booktopics (BookID, topicID) VALUES (70, 2);
insert INto Booktopics (BookID, topicID) VALUES (71, 2);
insert INto Booktopics (BookID, topicID) VALUES (72, 2);
insert INto Booktopics (BookID, topicID) VALUES (73, 2);
insert INto Booktopics (BookID, topicID) VALUES (74, 2);
insert INto Booktopics (BookID, topicID) VALUES (75, 2);
insert INto Booktopics (BookID, topicID) VALUES (76, 2);
insert INto Booktopics (BookID, topicID) VALUES (77, 2);
insert INto Booktopics (BookID, topicID) VALUES (78, 2);
insert INto Booktopics (BookID, topicID) VALUES (79, 2);
insert INto Booktopics (BookID, topicID) VALUES (80, 2);
insert INto Booktopics (BookID, topicID) VALUES (81, 2);
insert INto Booktopics (BookID, topicID) VALUES (82, 2);
insert INto Booktopics (BookID, topicID) VALUES (83, 2);
insert INto Booktopics (BookID, topicID) VALUES (84, 2);
insert INto Booktopics (BookID, topicID) VALUES (85, 2);
insert INto Booktopics (BookID, topicID) VALUES (86, 2);
insert INto Booktopics (BookID, topicID) VALUES (87, 2);
insert INto Booktopics (BookID, topicID) VALUES (88, 2);
insert INto Booktopics (BookID, topicID) VALUES (89, 2);
insert INto Booktopics (BookID, topicID) VALUES (90, 2);
insert INto Booktopics (BookID, topicID) VALUES (91, 2);
insert INto Booktopics (BookID, topicID) VALUES (92, 2);
insert INto Booktopics (BookID, topicID) VALUES (93, 2);
insert INto Booktopics (BookID, topicID) VALUES (94, 2);
insert INto Booktopics (BookID, topicID) VALUES (95, 2);
insert INto Booktopics (BookID, topicID) VALUES (96, 2);
insert INto Booktopics (BookID, topicID) VALUES (97, 2);
insert INto Booktopics (BookID, topicID) VALUES (98, 2);
insert INto Booktopics (BookID, topicID) VALUES (99, 2);
insert INto Booktopics (BookID, topicID) VALUES (100, 2);
insert INto Booktopics (BookID, topicID) VALUES (101, 2);
insert INto Booktopics (BookID, topicID) VALUES (102, 2);
insert INto Booktopics (BookID, topicID) VALUES (103, 2);
insert INto Booktopics (BookID, topicID) VALUES (104, 2);
insert INto Booktopics (BookID, topicID) VALUES (105, 2);
insert INto Booktopics (BookID, topicID) VALUES (106, 2);
insert INto Booktopics (BookID, topicID) VALUES (107, 2);
insert INto Booktopics (BookID, topicID) VALUES (108, 2);
insert INto Booktopics (BookID, topicID) VALUES (109, 2);
insert INto Booktopics (BookID, topicID) VALUES (110, 2);
insert INto Booktopics (BookID, topicID) VALUES (111, 3);
insert INto Booktopics (BookID, topicID) VALUES (112, 3);
insert INto Booktopics (BookID, topicID) VALUES (113, 3);
insert INto Booktopics (BookID, topicID) VALUES (114, 3);
insert INto Booktopics (BookID, topicID) VALUES (115, 3);
insert INto Booktopics (BookID, topicID) VALUES (116, 3);
insert INto Booktopics (BookID, topicID) VALUES (117, 3);
insert INto Booktopics (BookID, topicID) VALUES (118, 3);
insert INto Booktopics (BookID, topicID) VALUES (119, 3);
insert INto Booktopics (BookID, topicID) VALUES (120, 3);
insert INto Booktopics (BookID, topicID) VALUES (121, 4);
insert INto Booktopics (BookID, topicID) VALUES (122, 4);
insert INto Booktopics (BookID, topicID) VALUES (123, 4);
insert INto Booktopics (BookID, topicID) VALUES (124, 4);
insert INto Booktopics (BookID, topicID) VALUES (125, 4);
insert INto Booktopics (BookID, topicID) VALUES (126, 4);
insert INto Booktopics (BookID, topicID) VALUES (127, 4);
insert INto Booktopics (BookID, topicID) VALUES (128, 4);
insert INto Booktopics (BookID, topicID) VALUES (129, 4);
insert INto Booktopics (BookID, topicID) VALUES (130, 4);
insert INto Booktopics (BookID, topicID) VALUES (131, 5);
insert INto Booktopics (BookID, topicID) VALUES (132, 5);
insert INto Booktopics (BookID, topicID) VALUES (133, 5);
insert INto Booktopics (BookID, topicID) VALUES (134, 5);
insert INto Booktopics (BookID, topicID) VALUES (135, 5);
insert INto Booktopics (BookID, topicID) VALUES (136, 5);
insert INto Booktopics (BookID, topicID) VALUES (137, 5);
insert INto Booktopics (BookID, topicID) VALUES (138, 5);
insert INto Booktopics (BookID, topicID) VALUES (139, 5);
insert INto Booktopics (BookID, topicID) VALUES (140, 5);
insert INto Booktopics (BookID, topicID) VALUES (141, 6);
insert INto Booktopics (BookID, topicID) VALUES (142, 6);
insert INto Booktopics (BookID, topicID) VALUES (143, 6);
insert INto Booktopics (BookID, topicID) VALUES (144, 6);
insert INto Booktopics (BookID, topicID) VALUES (145, 6);
insert INto Booktopics (BookID, topicID) VALUES (146, 6);
insert INto Booktopics (BookID, topicID) VALUES (147, 6);
insert INto Booktopics (BookID, topicID) VALUES (148, 6);
insert INto Booktopics (BookID, topicID) VALUES (149, 6);
insert INto Booktopics (BookID, topicID) VALUES (150, 6);
insert INto Booktopics (BookID, topicID) VALUES (151, 7);
insert INto Booktopics (BookID, topicID) VALUES (152, 7);
insert INto Booktopics (BookID, topicID) VALUES (153, 7);
insert INto Booktopics (BookID, topicID) VALUES (154, 7);
insert INto Booktopics (BookID, topicID) VALUES (155, 7);
insert INto Booktopics (BookID, topicID) VALUES (156, 7);
insert INto Booktopics (BookID, topicID) VALUES (157, 7);
insert INto Booktopics (BookID, topicID) VALUES (158, 7);
insert INto Booktopics (BookID, topicID) VALUES (159, 7);
insert INto Booktopics (BookID, topicID) VALUES (160, 7);
insert INto Booktopics (BookID, topicID) VALUES (161, 2);
insert INto Booktopics (BookID, topicID) VALUES (162, 2);
insert INto Booktopics (BookID, topicID) VALUES (163, 2);
insert INto Booktopics (BookID, topicID) VALUES (164, 2);
insert INto Booktopics (BookID, topicID) VALUES (165, 2);
insert INto Booktopics (BookID, topicID) VALUES (166, 2);
insert INto Booktopics (BookID, topicID) VALUES (167, 2);
insert INto Booktopics (BookID, topicID) VALUES (168, 2);
insert INto Booktopics (BookID, topicID) VALUES (169, 2);
insert INto Booktopics (BookID, topicID) VALUES (170, 2);



insert INto Authors (AuthorID, Name) VALUES (1, 'Donald Knuth');
insert INto Authors (AuthorID, Name) VALUES (2, 'Robert Sedgewick');
insert INto Authors (AuthorID, Name) VALUES (3, 'Thomas H. Cormen');
insert INto Authors (AuthorID, Name) VALUES (4, 'Gilbert Strang');
insert INto Authors (AuthorID, Name) VALUES (5, 'Ian Goodfellow');
insert INto Authors (AuthorID, Name) VALUES (6, 'Stuart Russell');
insert INto Authors (AuthorID, Name) VALUES (7, 'Peter Norvig');
insert INto Authors (AuthorID, Name) VALUES (8, 'David J. Griffiths');
insert INto Authors (AuthorID, Name) VALUES (9, 'Richard Feynman');
insert INto Authors (AuthorID, Name) VALUES (10, 'Walter Rudin');
insert INto Authors (AuthorID, Name) VALUES (11, 'Sheldon Ross');
insert INto Authors (AuthorID, Name) VALUES (12, 'Abraham Silberschatz');
insert INto Authors (AuthorID, Name) VALUES (13, 'John E. Hopcroft');
insert INto Authors (AuthorID, Name) VALUES (14, 'Jeffrey Ullman');
insert INto Authors (AuthorID, Name) VALUES (15, 'Dennis Ritchie');
insert INto Authors (AuthorID, Name) VALUES (16, 'Brian Kernighan');
insert INto Authors (AuthorID, Name) VALUES (17, 'Michael Sipser');
insert INto Authors (AuthorID, Name) VALUES (18, 'Andrew Ng');
insert INto Authors (AuthorID, Name) VALUES (19, 'Yann LeCun');
insert INto Authors (AuthorID, Name) VALUES (20, 'Christopher Bishop');



insert INto Publishers (PublisherID, Name) VALUES (1, 'O''Reilly Media');
insert INto Publishers (PublisherID, Name) VALUES (2, 'Pearson Education');
insert INto Publishers (PublisherID, Name) VALUES (3, 'MIT Press');
insert INto Publishers (PublisherID, Name) VALUES (4, 'Cambridge University Press');
insert INto Publishers (PublisherID, Name) VALUES (5, 'McGraw-Hill');
insert INto Publishers (PublisherID, Name) VALUES (6, 'Packt Publishing');
insert INto Publishers (PublisherID, Name) VALUES (7, 'CRC Press');
insert INto Publishers (PublisherID, Name) VALUES (8, 'Wiley');
insert INto Publishers (PublisherID, Name) VALUES (9, 'Springer');
insert INto Publishers (PublisherID, Name) VALUES (10, 'Oxford University Press');
insert INto Publishers (PublisherID, Name) VALUES (11, 'Morgan Kaufmann');
insert INto Publishers (PublisherID, Name) VALUES (12, 'Elsevier');
insert INto Publishers (PublisherID, Name) VALUES (13, 'Apress');
insert INto Publishers (PublisherID, Name) VALUES (14, 'Addison-Wesley');
insert INto Publishers (PublisherID, Name) VALUES (15, 'Jones & Bartlett Learning');
insert INto Publishers (PublisherID, Name) VALUES (16, 'Tata McGraw-Hill India');
insert INto Publishers (PublisherID, Name) VALUES (17, 'Narosa Publishing House');
insert INto Publishers (PublisherID, Name) VALUES (18, 'PHI Learning');
insert INto Publishers (PublisherID, Name) VALUES (19, 'Indian Academy Press');
insert INto Publishers (PublisherID, Name) VALUES (20, 'IEEE Publishing');

insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (1, 1, 1, 'Must-read for algorithms!', 5);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (2, 2, 2, 'Great introduction to programming.', 4);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (3, 3, 3, 'Explains concepts very clearly.', 5);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (4, 4, 4, 'A bit tough, but rewarding.', 4);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (5, 5, 5, 'Excellent for linear algebra.', 5);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (6, 6, 6, 'Good ML coverage.', 4);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (7, 7, 7, 'Classic AI textbook.', 5);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (8, 8, 8, 'Very theoretical.', 3);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (9, 9, 9, 'Good for quantum beginners.', 4);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (10, 10, 10, 'too dense, needs background.', 2);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (11, 11, 11, 'Statistics made easy.', 5);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (12, 12, 12, 'Database theory explained well.', 4);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (13, 13, 13, 'A must for networks.', 5);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (14, 14, 14, 'ECE-focused and helpful.', 4);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (15, 15, 15, 'Covers Mech basics nicely.', 3);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (16, 16, 16, 'Useful for GATE prep.', 4);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (17, 17, 17, 'Good problem sets.', 5);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (18, 18, 18, 'Readable and practical.', 4);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (19, 19, 19, 'Old but gold.', 3);
insert INto Reviews (ReViewID, BookID, UserID, ReViewText, Rating) VALUES (20, 20, 20, 'Not detailed enough.', 2);


insert INto LibraryAvailability (BookID, IsAvailable) VALUES (1, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (2, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (3, FALSE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (4, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (5, FALSE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (6, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (7, FALSE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (8, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (9, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (10, FALSE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (11, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (12, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (13, FALSE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (14, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (15, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (16, FALSE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (17, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (18, FALSE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (19, TRUE);
insert INto LibraryAvailability (BookID, IsAvailable) VALUES (20, TRUE);



insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (1, 1, 2, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (2, 1, 3, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (3, 2, 1, 'DOWN');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (4, 2, 4, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (5, 3, 5, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (6, 3, 6, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (7, 4, 1, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (8, 5, 2, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (9, 5, 3, 'DOWN');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (10, 6, 6, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (11, 6, 7, 'DOWN');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (12, 7, 8, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (13, 8, 9, 'DOWN');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (14, 9, 10, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (15, 10, 11, 'DOWN');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (16, 11, 12, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (17, 12, 13, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (18, 13, 14, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (19, 14, 15, 'UP');
insert INto Votes (VoteID, ReViewID, UserID, VoteType) VALUES (20, 15, 16, 'DOWN');


Select b.Title, AVG(r.Rating) AS AvgRating
FROM Books b
JOIN Reviews r on b.BookID = r.BookID
GROUP BY b.BookID
ORDER BY AvgRating DESC
LIMIT 5;

Select b.Title, b.AuthorID, la.IsAvailable
FROM Books b
JOIN LibraryAvailability la on b.BookID = la.BookID
WHERE la.IsAvailable = TRUE;


Select r.ReViewID, b.Title, u.Name, COUNT(v.VoteID) AS Upvotes
FROM Reviews r
JOIN Books b on r.BookID = b.BookID
JOIN Users u on r.UserID = u.UserID
JOIN Votes v on r.ReViewID = v.ReViewID
WHERE v.VoteType = 'up'
GROUP BY r.ReViewID
ORDER BY Upvotes DESC
LIMIT 5;


Select b.Title, b.Year, p.Name AS Publisher
FROM Books b
JOIN Authors a on b.AuthorID = a.AuthorID
JOIN Publishers p on b.PublisherID = p.PublisherID
WHERE a.Name = 'Donald Knuth'
ORDER BY b.Year DESC;


Select t.Name AS topic, COUNT(bt.BookID) AS BookCount
FROM topics t
LEFT JOIN Booktopics bt on t.topicID = bt.topicID
GROUP BY t.Name
ORDER BY BookCount DESC;

Select p.Name AS Publisher, AVG(r.Rating) AS AvgRating
FROM Publishers p
JOIN Books b on p.PublisherID = b.PublisherID
JOIN Reviews r on b.BookID = r.BookID
GROUP BY p.Name
ORDER BY AvgRating DESC;

Select b.Title, r.ReViewText, 
    SUM(CASE WHEN v.VoteType = 'Up' THEN 1 ELSE 0 END) AS Upvotes,
    SUM(CASE WHEN v.VoteType = 'Down' THEN 1 ELSE 0 END) AS Downvotes
FROM Reviews r
JOIN Books b on r.BookID = b.BookID
JOIN Votes v on r.ReViewID = v.ReViewID
GROUP BY r.ReViewID
HAVING Upvotes > 0 AND Downvotes > 0
ORDER BY (Upvotes + Downvotes) DESC;

DELIMITER //
create Trigger check_availability
BEFORE insert on LibraryAvailability
FOR EACH ROW
BEGIN
  IF NEW.NoOfCopies <= 0 THEN
    SET NEW.IsAvailable = FALSE;
  ELSE
    SET NEW.IsAvailable = TRUE;
  END IF;
END//
DELIMITER ;

create View AvailableBooks AS
Select b.BookID, b.Title, a.Name AS Author, p.Name AS Publisher, la.ShelfLocation
FROM Books b
JOIN Authors a on b.AuthorID = a.AuthorID
JOIN Publishers p on b.PublisherID = p.PublisherID
JOIN LibraryAvailability la on b.BookID = la.BookID
WHERE la.IsAvailable = TRUE;


create View BookRatings AS
Select b.BookID, b.Title, 
    COUNT(r.ReViewID) AS ReViewCount,
    AVG(r.Rating) AS AverageRating,
    MIN(r.Rating) AS MinRating,
    MAX(r.Rating) AS MaxRating
FROM Books b
LEFT JOIN Reviews r on b.BookID = r.BookID
GROUP BY b.BookID;

create View PopularBooks AS
Select b.BookID, b.Title, a.Name AS Author,
    COUNT(r.ReViewID) AS ReViewCount,
    AVG(r.Rating) AS AvgRating
FROM Books b
JOIN Authors a on b.AuthorID = a.AuthorID
LEFT JOIN Reviews r on b.BookID = r.BookID
GROUP BY b.BookID, a.Name
ORDER BY ReViewCount DESC, AvgRating DESC
LIMIT 50;




create View topReviews AS
Select r.ReViewID, b.Title AS BookTitle, u.Name AS Reviewer,
    r.Rating, r.ReViewText, r.Timestamp,
    COUNT(CASE WHEN v.VoteType = 'Up' THEN 1 END) AS Upvotes,
    COUNT(CASE WHEN v.VoteType = 'Down' THEN 1 END) AS Downvotes
FROM Reviews r
JOIN Books b on r.BookID = b.BookID
JOIN Users u on r.UserID = u.UserID
LEFT JOIN Votes v on r.ReViewID = v.ReViewID
GROUP BY r.ReViewID, b.Title, u.Name
ORDER BY (Upvotes - Downvotes) DESC;


create View AuthorStats AS
Select a.AuthorID, a.Name,
    COUNT(b.BookID) AS BooksWritten,
    MIN(b.Year) AS FirstPublicationYear,
    MAX(b.Year) AS LastPublicationYear,
    COUNT(DISTINCT b.PublisherID) AS PublishersWorkedWith
FROM Authors a
LEFT JOIN Books b on a.AuthorID = b.AuthorID
GROUP BY a.AuthorID;


create View PublisherCatalog AS
Select p.PublisherID, p.Name,
    COUNT(b.BookID) AS BooksPublished,
    AVG(br.AverageRating) AS AvgBookRating,
    COUNT(DISTINCT b.AuthorID) AS AuthorsRepresented
FROM Publishers p
LEFT JOIN Books b on p.PublisherID = b.PublisherID
LEFT JOIN BookRatings br on b.BookID = br.BookID
GROUP BY p.PublisherID;

create ROLE library_admin;
grant ALL PRIVILEGES on users to library_admin;
grant ALL PRIVILEGES on tables to library_admin;

create ROLE librarian;
grant Select, insert, update on books to librarian;
grant Select, insert, update on topics to librarian;
grant Select on Users to librarian;

create ROLE Reviewer;
grant Select on Books to Reviewer;
grant Select on topics to Reviewer;
grant Select on votes to Reviewer;
grant Select, insert, update, delete on Reviews to Reviewer;
grant Select, insert on Votes to Reviewer;



DELIMITER //
create Trigger prevent_duplicate_user
BEFORE insert on Users
FOR EACH ROW
BEGIN
  IF EXISTS (Select 1 FROM Users WHERE Email = NEW.Email AND UserID != NEW.UserID) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email address already exists';
  END IF;
  
  IF EXISTS (Select 1 FROM Users WHERE RollNumber = NEW.RollNumber AND UserID != NEW.UserID) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Roll number already exists';
  END IF;
END//
DELIMITER ;


DELIMITER //
create Trigger check_rating_range
BEFORE insert on Reviews
FOR EACH ROW
BEGIN
  IF NEW.Rating < 1 OR NEW.Rating > 5 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rating must be between 1 and 5';
  END IF;
END//
DELIMITER ;


DELIMITER //
create Trigger check_publication_year
BEFORE insert on Books
FOR EACH ROW
BEGIN
  IF NEW.Year > YEAR(CURRENT_DATE) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Publication year cannot be in the future';
  END IF;
END//
DELIMITER ;

SHOW TriggerS;
