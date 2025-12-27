
-- UPPDATERA DATA
-- Delar upp katter i burar, max 3 per bur --

UPDATE Cats
SET CageNumber = 1
WHERE CatID <= 3;

UPDATE Cats
SET CageNumber = 2
WHERE CatID >= 4 AND CatID <= 6;

UPDATE Cats
SET CageNumber = 3
WHERE CatID >= 7 AND CatID <= 9;

UPDATE Cats
SET CageNumber = 4
WHERE CatID >= 10 AND CatID <= 12;

UPDATE Cats
SET CageNumber = 5
WHERE CatID >= 13 AND CatID <= 15;

'''
UPDATE Cats
SET CageNumber = 3
WHERE CatID >= 15 AND CatID <= 17;

UPDATE Cats
SET CageNumber = 4
WHERE CatID >= 18 AND CatID <= 20;

UPDATE Cats
SET CageNumber = 5
WHERE CatID >= 21 AND CatID <= 23;
'''

'''
SELECT Cats.CatName, FoodMenu.FoodBrand, FoodMenu.FoodType
FROM CatFood
JOIN Cats ON CatFood.CatID = Cats.CatID
JOIN FoodMenu ON CatFood.FoodID = FoodMenu.FoodID
ORDER BY Cats.CatID;
'''

-- Liten JOIN
-- Här kan man se vilka katter som bor i vilken bur --

SELECT Cages.CageNumber, Cats.CatName
FROM Cages
LEFT JOIN Cats
ON Cages.CageNumber=Cats.CageNumber
ORDER BY Cages.CageNumber;

-- Större JOIN 
-- Visar vilken mat som ska ges till vilken katt och vilken bur maten ska till --

SELECT
Cats.CatName,
Cages.CageNumber,
FoodMenu.FoodBrand,
FoodMenu.FoodType
FROM Cats
JOIN Cages ON Cats.CageNumber = Cages.CageNumber
JOIN CatFood ON Cats.CatID = CatFood.CatID
JOIN FoodMenu ON CatFood.FoodID = FoodMenu.FoodID
ORDER BY Cats.CatName;

-- LIMIT + OFFSET
-- Visar de äldre katterna (födda före 2021) fem åt gången/per tabell--

SELECT * FROM Cats
WHERE BirthYear <= 2020
LIMIT 5 OFFSET 0;

SELECT * FROM Cats
WHERE BirthYear <= 2020
LIMIT 5 OFFSET 5;


-- RADERA SPECIFIK DATA
-- För att ta bort en katt från listan (när den blivit adopterad t ex)
-- behöver man först ta bort den från matlistan eftersom den är kopplad med en foreign key
-- Så när katten Archie har blivit adopterad ser det ut såhär:

DELETE FROM CatFood
WHERE CatID = (
SELECT CatID FROM Cats WHERE CatName = 'Archie'
);

DELETE FROM Cats WHERE CatName = 'Archie';

-- COUNT
-- Räknar antalet katter på hemmet utifrån ID

SELECT COUNT(CatID)
FROM Cats;

-- (CUR)DATE
-- Visar hur gamla katterna är utifrån dagens datum (Current Date) --

SELECT CatName, YEAR(CURDATE()) - BirthYear AS Age
FROM Cats
ORDER BY Age;

-- FRITEXTSÖKNING
-- Visar alla katter med 'a' i sina namn --

SELECT * FROM Cats
WHERE CatName LIKE '%a%';


