DROP DATABASE IF EXISTS MNMApp;
CREATE DATABASE MNMApp;
USE MNMApp;

CREATE TABLE county
(
ID int NOT NULL auto_increment PRIMARY KEY,
countyName varchar(50)
);

INSERT INTO county (countyName) VALUES
("Digby"),
("Yarmouth"),
("Shelburne"),
("Annapolis"),
("Queens"),
("Kings"),
("Lunenburg"),
("Hants"),
("Halifax"),
("Colchester"),
("Cumberland"),
("Pictou"),
("Guysborough"),
("Antigonish"),
("Inverness"),
("Richmond"),
("Victoria"),
("Cape-Breton");

SELECT * FROM county;

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    email VARCHAR(45),
    location VARCHAR(50),
    id INT NOT NULL auto_increment PRIMARY KEY,
    logID INT NOT NULL
);

ALTER TABLE users
ADD CONSTRAINT FK_logID
foreign key (logID) REFERENCES pageLogs (ID); 
 
CREATE TABLE shark
(
    RFIDID int PRIMARY KEY,
    sharkName VARCHAR(25),
    species VARCHAR(50),
    length FLOAT,
    weight FLOAT,
    age  INT
);

INSERT INTO shark (RFIDID, sharkName, species, length, weight, age) VALUES
(59563, "Starvin-Marvin","Great-White", 15.5, 522.0, 37);

INSERT INTO shark (RFIDID, sharkName, species, length, weight, age) VALUES
(10235, "Steve-Bushemi","Blue", 9.5, 250.0, 15);


CREATE TABLE pageLogs
(
    id int PRIMARY KEY auto_increment,
    sharkID int,
    PassTime timestamp NOT NULL default CURRENT_TIMESTAMP,
    locationID int NOT NULL
);


/*Adding foreign key constraint to create relationship between the Shark table's (RFID) and
The logs table (sharkID)*/
ALTER TABLE pageLogs
ADD CONSTRAINT FK_sharkid
FOREIGN KEY (sharkID) REFERENCES shark(RFIDID);

ALTER TABLE pageLogs
ADD CONSTRAINT FK_locationid
FOREIGN KEY (locationID) REFERENCES county(ID);

ALTER TABLE users
ADD CONSTRAINT FK_countyID
FOREIGN KEY (location) REFERENCES county(countyName)

INSERT INTO pageLogs (sharkID, locationID) VALUES
	(59563, 14);

INSERT INTO pageLogs (sharkID, locationID) VALUES
	(10235, 5);
    
SELECT * FROM pageLogs;

DELETE FROM shark WHERE RFIDID = 59563;
SELECT * FROM shark;