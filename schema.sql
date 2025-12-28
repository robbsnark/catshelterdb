CREATE DATABASE catshelterDB;
USE catshelterDB;

'''
        CATS TABLE
'''

-- Tabell för att visa katterna som bor på hemmet: 
-- Namn, uppskattat födelseår, om de är redo att adopteras än och vilken bur de bor i

CREATE TABLE Cats (
CatID INT AUTO_INCREMENT PRIMARY KEY,
CatName VARCHAR(30) NOT NULL,
BirthYear SMALLINT,
Adoptable VARCHAR(3),
CageNumber SMALLINT
);

'''
        CAGES
'''

-- Tabell för burarna, kopplat med en FK till numret i kattens fil (i tabellen Cats)

CREATE TABLE Cages (
CageNumber SMALLINT PRIMARY KEY
);

ALTER TABLE Cats
ADD CONSTRAINT FK_Cats_Cage
FOREIGN KEY (CageNumber) REFERENCES Cages(CageNumber);


'''
        FOOD TABLES
'''

-- Tabeller för mat: en för de sorters mat som finns (märke, blöt/torrfoder)
-- och en som kopplar kattens ID med rätt matkombination

CREATE TABLE FoodMenu (
FoodID INT PRIMARY KEY,
FoodBrand VARCHAR(20),
FoodType VARCHAR(10)
);

CREATE TABLE CatFood (
CatID INT,
FoodID INT,
PRIMARY KEY (CatID, FoodID),
FOREIGN KEY (CatID) REFERENCES Cats(CatID),
FOREIGN KEY (FoodID) REFERENCES FoodMenu(FoodID)
);

-- VIEWS --

-- View med konkatenering som visar vilken mat att ge till vilken katt --
-- Separatorn tillåter fler än en sorts mat per katt --

CREATE VIEW CatFoodOverview AS
SELECT Cats.CatName,
GROUP_CONCAT(CONCAT(FoodMenu.FoodBrand, ' ', FoodMenu.FoodType) SEPARATOR ', ') AS Foods
FROM Cats
JOIN CatFood ON Cats.CatID = CatFood.CatID
JOIN FoodMenu ON CatFood.FoodID = FoodMenu.FoodID
GROUP BY Cats.CatName;

SELECT * FROM CatFoodOverview
ORDER BY Foods;

-- Enkel view som visar vilka katter som är redo för adoption --

CREATE VIEW AdoptableCats AS
SELECT CatID, CatName, BirthYear, CageNumber
FROM Cats
WHERE Adoptable = 'YES';

SELECT * FROM AdoptableCats;