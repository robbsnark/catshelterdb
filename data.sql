

INSERT INTO Cats (CatName, BirthYear, Adoptable)
VALUES 
('Juniper', '2023', 'YES'),
('Floki', 2017, 'YES'),
('Lennie', 2018, 'YES'),
('Snoddas', 2018, 'YES'),
('Pixie', 2020, 'NO'),
('Flisa', '2016', 'NO'),
('Zorro', 2020, 'NO'),
('Rasputin', 2021, 'YES'),
('Kit', 2018, 'YES'),
('Ophelia', 2018, 'YES'),
('Titus', 2016, 'YES'),
('Archie', 2022, 'YES'),
('Kerstin', 2022, 'YES'),
('Sigrid', 2022, 'YES');

INSERT INTO Cages (CageNumber)
VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO FoodMenu (FoodID, FoodBrand, FoodType)
VALUES
(1, 'Latz', 'Wet'),
(2, 'Royal Canin', 'Dry'),
(3, 'Mjau', 'Wet'),
(4, 'Mjau', 'Dry'),
(5, 'Purina', 'Wet'),
(6, 'Purina', 'Dry'),
(7, 'Royal Canin', 'Wet'),
(8, 'Latz', 'Dry'),
(9, 'Prescription', 'Dry'),
(10, 'Any brand', 'Any type'),
(11, 'Any brand', 'Wet'),
(12, 'Any brand', 'Dry');

INSERT INTO CatFood (CatID, FoodID)
VALUES
(1, 2),
(2, 5),
(3, 2),
(4, 4),
(5, 1),
(6, 11),
(15, 9),
(16, 12),
(17, 10),
(18, 5),
(19, 3),
(20, 10),
(21, 1),
(22, 1);
