create database OTT;
use OTT;
CREATE TABLE Subscription
(
Subscription_ID varchar(50) NOT NULL PRIMARY KEY,
Subscription_Type varchar(20),
Amount int);

INSERT INTO Subscription(Subscription_ID,Subscription_Type,Amount) 
VALUES('69','Basic',199);
INSERT INTO Subscription(Subscription_ID,Subscription_Type,Amount) VALUES 
('4K','Premium',599);
INSERT INTO Subscription(Subscription_ID,Subscription_Type,Amount) VALUES 
('13B','VIP',399);
INSERT INTO Subscription(Subscription_ID,Subscription_Type,Amount) VALUES 
('7G','Basic',199);
INSERT INTO Subscription(Subscription_ID,Subscription_Type,Amount) VALUES 
('5B','VIP',399);
select * from Subscription;


CREATE TABLE OTTUSER2
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    User_Name VARCHAR(100),
    Age INT,
    Phone VARCHAR(15),
    City VARCHAR(100),
    State VARCHAR(100),
    Street VARCHAR(100),
    Subscription_ID VARCHAR(50),
    Subscription_Start_Date DATE,
    Subscription_End_Date DATE,
    FOREIGN KEY (Subscription_ID) REFERENCES Subscription(Subscription_ID)
);
desc ottuser2;
alter table OTTuser2
add password varchar(20);
SELECT * FROM OTTuser2 WHERE User_name = 'virat' AND password = 'eight';
INSERT INTO OTTUser2 ( User_Name, Age, Phone, City, State, Street, Subscription_ID, Subscription_Start_Date, Subscription_End_Date,password) VALUES
( 'virat', 39, '9782304281', 'Ranchi', 'Jharkhand', 'Gandhi', '1A', DATE '2021-01-01', DATE '2021-02-01','eight');

INSERT INTO OTTUser2 ( User_Name, Age, Phone, City, State, Street, Subscription_ID, Subscription_Start_Date, Subscription_End_Date) VALUES
( 'Nattu', 32, '8957281281', 'Salem', 'Tamilnadu', 'Meenakshi', '4K', DATE '2020-04-11', DATE '2021-04-11');

INSERT INTO OTTUser2 (User_Name, Age, Phone, City, State, Street, Subscription_ID, Subscription_Start_Date, Subscription_End_Date) VALUES
( 'Vikram', 54, '7823629134', 'Chennai', 'Tamilnadu', 'Cheran', '13B', DATE '2019-09-21', DATE '2019-12-21');

INSERT INTO OTTUser2 ( User_Name, Age, Phone, City, State, Street, Subscription_ID, Subscription_Start_Date, Subscription_End_Date) VALUES
( 'Naruto', 20, '9241382391', 'Leaf Village', 'Konoho', 'Tokushima', '7G', DATE '2020-05-23', DATE '2020-06-23');

INSERT INTO OTTUser2 ( User_Name, Age, Phone, City, State, Street, Subscription_ID, Subscription_Start_Date, Subscription_End_Date) VALUES
('Sasuke', 21, '9817929351', 'Leaf Village', 'Konoho', 'Tokushima', '5B', DATE '2020-11-17', DATE '2021-02-17');
select * from OTTuser2;

insert into ottuser2( User_Name, Age, Phone, City, State, Street, Subscription_ID, Subscription_Start_Date, Subscription_End_Date,password) values('apple',2,'43234','cityy','sstaeee','dfg','69',DATE '2020-11-17', DATE '2021-02-17','pass');

select * from subscription;
drop table payment_Type;
CREATE TABLE Payment_Type
(
Payment_ID varchar(50) PRIMARY KEY,
Payment_Date date,
Amount_Due int,
User_ID varchar(50) REFERENCES OTTUser(User_ID),
P_Type char(20),
Credit_Card_No bigint,
Debit_Card_No bigint,
Net_Banking_ID bigint,
UPI_ID varchar(20));

INSERT INTO Payment_Type
(Payment_ID,Payment_Date,Amount_Due,User_ID,P_Type,Credit_Card_No) VALUES
('111',DATE'2021-01-01',250,1,'Credit',1234567890123456);
INSERT INTO Payment_Type
(Payment_ID,Payment_Date,Amount_Due,User_ID,P_Type,Credit_Card_No) VALUES
('999',DATE'2020-04-11',650,2,'Credit',4709839201849391);
INSERT INTO Payment_Type
(Payment_ID,Payment_Date,Amount_Due,User_ID,P_Type,Debit_Card_No) VALUES
('222',DATE'2019-09-21',450,2,'Debit',14792301837223456);
INSERT INTO Payment_Type
(Payment_ID,Payment_Date,Amount_Due,User_ID,P_Type,Debit_Card_No) VALUES
('333',DATE'2020-05-23',250,3,'Debit',470480198371849);
INSERT INTO Payment_Type 
(Payment_ID,Payment_Date,Amount_Due,User_ID,P_Type,Credit_Card_No) VALUES
('444',DATE'2020-11-17',450,4,'Credit',35697284040138301);
select * from Payment_type;

CREATE TABLE movies
(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    release_date DATE,
    nationality VARCHAR(100),
    budget DECIMAL(15, 2),
    multi_lang BOOLEAN,
    rating DECIMAL(3, 2),
    runtime INT,
    producers VARCHAR(255),
    box_office DECIMAL(15, 2),
    ott_id VARCHAR(50)
);
INSERT INTO movies (id, name, release_date, nationality, budget, multi_lang, rating, runtime, producers, box_office, ott_id) VALUES
(1, 'Inception', '2010-07-16', 'USA', 160000000.00, TRUE, 8.8, 148, 'Christopher Nolan', 829895144.00, '1A'),
(2, 'Parasite', '2019-05-30', 'South Korea', 11400000.00, FALSE, 8.6, 132, 'Bong Joon-ho', 258745728.00, '2B'),
(3, 'Interstellar', '2014-11-07', 'USA', 165000000.00, TRUE, 8.6, 169, 'Christopher Nolan', 701729206.00, '1A'),
(4, 'The Dark Knight', '2008-07-18', 'USA', 185000000.00, TRUE, 9.0, 152, 'Christopher Nolan', 1004558444.00, '1A'),
(5, 'Avengers: Endgame', '2019-04-26', 'USA', 356000000.00, TRUE, 8.4, 181, 'Kevin Feige', 2797800564.00, '3C');

INSERT INTO movies (id, name, release_date, nationality, budget, multi_lang, rating, runtime, producers, box_office, ott_id) VALUES
(6, 'Titanic', '1997-12-19', 'USA', 200000000.00, FALSE, 7.8, 195, 'James Cameron', 2187463944.00, '4D'),
(7, 'The Lord of the Rings: The Return of the King', '2003-12-17', 'USA', 94000000.00, TRUE, 8.9, 201, 'Peter Jackson', 1146030917.00, '5E'),
(8, 'The Shawshank Redemption', '1994-09-10', 'USA', 25000000.00, FALSE, 9.3, 142, 'Frank Darabont', 58600000.00, '6F'),
(9, 'The Godfather', '1972-03-24', 'USA', 6000000.00, FALSE, 9.2, 175, 'Francis Ford Coppola', 245066411.00, '7G'),
(10, 'Forrest Gump', '1994-07-06', 'USA', 55000000.00, FALSE, 8.8, 142, 'Robert Zemeckis', 678226752.00, '8H');

select * from tv_shows;
CREATE TABLE tv_shows
(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    no_of_episodes INT,
    release_date DATE,
    nationality VARCHAR(100),
    budget DECIMAL(15, 2),
    multi_lang BOOLEAN,
    rating DECIMAL(3, 2),
    runtime INT,
    producers VARCHAR(255),
    box_office DECIMAL(15, 2),
    ott_id VARCHAR(50),
    no_of_seasons INT
);
INSERT INTO tv_shows (id, name, no_of_episodes, release_date, nationality, budget, multi_lang, rating, runtime, producers, box_office, ott_id, no_of_seasons) VALUES
(1, 'Breaking Bad', 62, '2008-01-20', 'USA', 3000000.00, TRUE, 9.5, 47, 'Vince Gilligan', 0.00, '1A', 5),
(2, 'Stranger Things', 34, '2016-07-15', 'USA', 6000000.00, TRUE, 8.7, 51, 'The Duffer Brothers', 0.00, '2B', 3),
(3, 'Game of Thrones', 73, '2011-04-17', 'USA', 15000000.00, TRUE, 9.3, 57, 'David Benioff, D.B. Weiss', 0.00, '3C', 8),
(4, 'The Crown', 40, '2016-11-04', 'UK', 13000000.00, TRUE, 8.6, 58, 'Peter Morgan', 0.00, '4D', 4),
(5, 'Money Heist', 41, '2017-05-02', 'Spain', 2000000.00, TRUE, 8.3, 45, 'Álex Pina', 0.00, '5E', 5);
CREATE TABLE documentary
(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    no_of_episodes INT,
    release_date DATE,
    nationality VARCHAR(100),
    budget DECIMAL(15, 2),
    multi_lang BOOLEAN,
    rating DECIMAL(3, 2),
    runtime INT,
    producers VARCHAR(255),
    box_office DECIMAL(15, 2),
    ott_id VARCHAR(50),
    no_of_seasons INT
);

INSERT INTO documentary (id, name, no_of_episodes, release_date, nationality, budget, multi_lang, rating, runtime, producers, box_office, ott_id, no_of_seasons) VALUES
(1, 'Planet Earth', 11, '2006-03-05', 'UK', 25000000.00, TRUE, 9.4, 60, 'Alastair Fothergill', 0.00, '1A', 1),
(2, 'The Last Dance', 10, '2020-04-19', 'USA', 2000000.00, TRUE, 9.1, 50, 'Jason Hehir', 0.00, '2B', 1),
(3, 'Our Planet', 8, '2019-04-05', 'UK', 10000000.00, TRUE, 9.3, 48, 'Alastair Fothergill', 0.00, '3C', 1),
(4, 'Making a Murderer', 20, '2015-12-18', 'USA', 4000000.00, TRUE, 8.6, 60, 'Laura Ricciardi, Moira Demos', 0.00, '4D', 2),
(5, 'Tiger King', 8, '2020-03-20', 'USA', 5000000.00, TRUE, 7.6, 45, 'Eric Goode, Rebecca Chaiklin', 0.00, '5E', 1);

CREATE TABLE Awards
(
    id INT NOT NULL PRIMARY KEY,
    genres VARCHAR(100),
    movie_id INT,
    artist_id INT,
    documentary_id INT,
    industry VARCHAR(100),
    tv_show_id INT,
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    FOREIGN KEY (documentary_id) REFERENCES documentary(id),
    FOREIGN KEY (tv_show_id) REFERENCES tv_shows(id)
);
CREATE TABLE artists
(
    id INT NOT NULL PRIMARY KEY,
    tv_show_id INT,
    industry VARCHAR(100),
    documentary_id INT,
    name VARCHAR(255),
    DOB DATE,
    gender VARCHAR(10),
    movie_id INT,
    FOREIGN KEY (tv_show_id) REFERENCES tv_shows(id),
    FOREIGN KEY (documentary_id) REFERENCES documentary(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);
INSERT INTO artists (id, tv_show_id, industry, documentary_id, name, DOB, gender, movie_id) VALUES
(1, NULL, 'Film', NULL, 'Leonardo DiCaprio', '1974-11-11', 'Male', 1),  -- Leonardo DiCaprio in Movie 1
(2, 5, 'TV', NULL, 'Millie Bobby Brown', '2004-02-19', 'Female', NULL),  -- Millie Bobby Brown in TV Show 5
(3, NULL, 'Film', 2, 'Meryl Streep', '1949-06-22', 'Female', 2),  -- Meryl Streep in Documentary 2
(4, NULL, 'Film', NULL, 'Tom Hanks', '1956-07-09', 'Male', 3),  -- Tom Hanks in Movie 3
(5, NULL, 'Film', 1, 'Joaquin Phoenix', '1974-10-28', 'Male', 4);
  -- Joaquin Phoenix in Documentary 1
INSERT INTO artists (id, tv_show_id, industry, documentary_id, name, DOB, gender, movie_id) VALUES
(6, NULL, 'Film', NULL, 'Natalie Portman', '1981-06-09', 'Female', 5),  -- Natalie Portman in Movie 5
(7, NULL, 'Film', NULL, 'Brad Pitt', '1963-12-18', 'Male', 6),  -- Brad Pitt in Movie 6
(8, NULL, 'Film', 3, 'Cate Blanchett', '1969-05-14', 'Female', 7),  -- Cate Blanchett in Documentary 3
 -- Kit Harington in TV Show 7
(10, NULL, 'Film', NULL, 'Emma Stone', '1988-11-06', 'Female', 8);  -- Emma Stone in Movie 8





alter table artists
drop column  artist_name ;

select * from artists;
select * from awards;
INSERT INTO Awards (id, genres, movie_id, artist_id, documentary_id, industry, tv_show_id) VALUES
(1, 'Drama', 1, 1, NULL, 'Film', NULL),   -- Artist 1 for Movie 1 in Drama genre
(2, 'Documentary', NULL, 2, 1, 'Documentary', NULL),   -- Artist 2 for Documentary 1
(3, 'Sci-Fi', 3, 3, NULL, 'Film', NULL),   -- Artist 3 for Movie 3 in Sci-Fi genre
(4, 'True Crime', NULL, 4, 4, 'Documentary', NULL);-- Artist 4 for Documentary 4 in True Crime genre


DELIMITER //

CREATE TRIGGER delete_subscription_trigger
AFTER DELETE ON OTTUSER2
FOR EACH ROW
BEGIN
    DELETE FROM Subscription WHERE Subscription_ID = OLD.Subscription_ID;
END //

DELIMITER ;
