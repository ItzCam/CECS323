-- Insert Employee (05/03/2020) - COMPLETE
INSERT INTO Employee (firstName, lastName, birthDate, hireDate)
        VALUES  ('John', 'Smith', '1990-05-01', '2018-06-15'),
                ('Jane', 'Doe', '1995-12-22', '2020-01-01'), 
                ('Mark', 'Stein', '1980-08-21', '2018-06-13'),
                ('Jessica', 'Bennett', '1975-02-16', '2000-04-15'), 
                ('Lindsay', 'Park', '1995-02-15', '2018-06-14'), 
                ('Rachel', 'Boss', '1997-06-15', '2020-11-24'), 
                ('Mike', 'Tyson', '1975-05-19', '2005-06-06'), 
                ('Bob', 'Murphy', '1998-04-20', '2005-02-01'), 
                ('Caty', 'Haas', '1985-05-24', '2020-03-15'), 
                ('Greg', 'Lee', '1989-12-16', '2000-01-01'),
                ('Stefan', 'Karl', '1975-11-19', '2019-05-25'),
                ('Finel', 'Bosse', '1999-06-13', '2018-11-13'),
                ('Rick', 'Grimes', '1994-05-08', '2019-03-01'),
                ('Carl', 'Grimes', '1999-11-23', '2017-08-14'),
                ('John', 'Doe', '1989-06-16', '2018-05-28'),
                ('Stan', 'Lee', '1976-03-13', '2019-03-08'),
                ('Leo', 'park', '1988-10-27', '2018-03-05'),
                ('Osbaldo', 'Lubowitz', '1988-08-31', '2019-02-08'),
                ('Sonya', 'Lockman', '1994-01-15', '2018-10-26'),
                ('Thea', 'Hoppe', '1977-01-27', '2017-12-28');;

-- Insert EmployeeOfTheMonth (05/03/2020)  - COMPLETE
INSERT INTO EmployeeOfTheMonth(EmployeeID, month, year, achievement)    
        VALUES  (7, 1, 2019, 'Outstanding customer service'),
                (9, 2, 2019, 'Positive outlook while working'),
                (2, 3, 2019, 'Found a wallet left on a table'),
                (7, 4, 2019, 'Washed dishes with a smile on his face'),
                (1, 5, 2019, 'Enthusiastic rapport with customers'),
                (10, 6, 2019, 'Most tips earned'),
                (1, 7, 2019, 'Helpful with customers'),
                (7, 8, 2019, 'Stayed late to clean the floors'),
                (3, 9, 2019, 'Works efficiently'),
                (10, 10, 2019, 'Leadership'),
                (2, 11, 2019, 'Does not hesitate'),
                (2, 12, 2019, 'Good customer service');

-- Insert FullTimeEmployee (05/03/2020) - COMPLETE
INSERT INTO FullTimeEmployee (employeeID, weeklySalary) 
        VALUES  (1, 880.50), -- Manger 1 
                (2, 750.50), -- Manger 2
                (3, 300.25), -- Head Chef 3
                (4, 350.25), -- Head Chef 2
                (5, 500.25), -- Head Chef 1
                (18, 220.00), -- Sous Chef 1
                (19, 225.00), -- Sous Chef 2
                (20, 250.00), -- Sous Chef 3
                (6, 11.50), -- LineCook 1 
                (7, 11.50), -- LineCook 2
                (8, 12.50); -- LineCook 3

-- Insert PartTimeEmployee (05/03/2020) - COMPLETE
INSERT INTO PartTimeEmployee (employeeID, hourlyRate)
        VALUES  (9, 14.00), -- DishWasher 1
                (10, 14.00), -- DishWasher 2
                (11, 12.50), -- MaitreD 1
                (12, 12.50), -- MaitreD 2 
                (13, 13.00), -- waiter 1 
                (14, 13.00), -- waiter 2
                (15, 13.00), -- waiter 3
                (16, 15.00), -- waiter 4
                (17, 13.00); -- waiter 5

-- Insert Managers (05/03/2020) - COMPLETE
INSERT INTO Manager(managerID, managerCredentials)
        VALUES  (1, 'MBA from Long Beach State University'),
                (2, 'MBA from Cal Poly Tech University');

-- Insert into MenuItem (05/03/2020) - COMPLETE
INSERT INTO MenuItem (menuItemName, spiciness, basePrice)
        VALUES  ('Steak', 'Mild', 22.00), -- Meat Entree
                ('Orange Chicken', 'Mild', 17.00), -- Meat Entree
                ('Filet Mignon', 'Mild', 20.00), -- Meat Entree
                ('Fried Rice', 'Mild', 9.00), -- appetizer
                ('Chicken Chow Mein', 'Mild', 15.00), -- Meat Entree
                ('Spring Rolls', 'Mild', 7.00), -- appetizer
                ('Kung Pao chicken', 'Hot', 8.25), -- Meat Entree
                ('Pad Thai', 'Mild', 12.99), -- Meat Entree
                ('Chicken Soup', 'Mild', 11.99), -- Soup
                ('Noodle Soup', 'Mild', 12.75); -- Soup

-- Insert into Chef (5/04/2020) - complete
INSERT INTO Chef (employeeID, favFoodToCook)
        VALUES  (3, 'Steak'), -- Chef 1 
                (4, 'Orange Chicken'), -- Chef 2
                (5, 'Filet Mignon'), -- Chef 3 (Head Chef)
                (18, 'Fried Rice'), -- Chef 4 (Sous Chef)
                (19, 'Chicken Chow Mein'), -- Chef 5 (Sous Chef)
                (20, 'Spring Rolls'), -- Chef 6 (Sous Chef)
                (6, 'Noodle Soup'), -- LineCook 1
                (7, 'Chicken Soup'), -- LineCook 2
                (8, 'Pad Thai'); -- LineCook 3

-- Insert into headChef (5/04/2020) - complete
INSERT INTO HeadChef (chefID, headChefHatSize)
        VALUES  (3, 'L'), -- Head Chef 3
                (4, 'M'), -- Head Chef 4
                (5, 'S'); -- Head Chef 5 (boss) higher salary

-- Insert WorkShiftType (05/03/2020) - COMPLETE
INSERT INTO WorkShiftType (shiftType) 
        VALUES ('Morning'), -- Morning 
               ('Evening'); -- Night

-- BUG here foreign keys (shiftID) 
-- Insert WorkShift (05/03/2020) - COMPLETE
INSERT INTO WorkShift ( shiftType, dateOfShift, currentOccupancy, startTime, endTime, managerID, chefID)
        VALUES ( 'Morning', '2020-04-21', 'High', '08:00:00', '15:59:59', 1, 5),
               ( 'Evening', '2020-04-21', 'High', '16:00:00', '23:59:59', 2, 3),
               ( 'Morning', '2020-04-22', 'Low', '08:00:00', '15:59:59', 1, 5),
               ( 'Evening', '2020-04-22', 'High', '16:00:00', '23:59:59', 2, 4),
               ( 'Morning', '2020-04-25', 'Medium', '08:00:00', '15:59:59', 1, 5),
               ( 'Evening', '2020-05-01', 'High', '16:00:00', '23:59:59', 2, 4);

-- shiftID
-- Insert into WorkSchedule (5/04/2020) - Complete
INSERT INTO WorkSchedule (employeeID, shiftID, hoursWorked)
        VALUES  (1, 1, 8.00),
                (1, 3, 8.00),
                (1, 5, 8.00),
                (2, 2, 8.00),
                (2, 4, 8.00),
                (2, 6, 8.00),
                (3, 2, 8.00),
                (4, 4, 8.00),
                (4, 6, 8.00),
                (5, 1, 8.00),
                (5, 3, 8.00),
                (5, 6, 8.00),
                (6, 1, 8.00),
                (6, 5, 8.00),
                (7, 1, 8.00),
                (7, 3, 8.00),
                (8, 6, 8.00),
                (8, 3, 8.00),
                (9, 1, 8.00),
                (9, 3, 8.00),
                (9, 4, 8.00),
                (10, 2, 8.00),
                (10, 3, 8.00),
                (10, 5, 8.00),    
                (11, 1, 8.00),
                (11, 2, 8.00),
                (11, 5, 8.00),
                (12, 1, 8.00),
                (12, 4, 8.00),
                (12, 6, 8.00),
                (13, 6, 8.00),
                (13, 2, 8.00),
                (13, 1, 8.00),
                (14, 1, 8.00),
                (14, 3, 8.00),
                (14, 4, 8.00),
                (14, 5, 8.00),
                (15, 2, 8.00),
                (15, 3, 8.00),
                (15, 5, 8.00),
                (15, 6, 8.00),
                (16, 1, 8.00),
                (16, 3, 8.00),
                (16, 5, 8.00),
                (16, 6, 8.00),    
                (17, 2, 8.00),
                (17, 4, 8.00),
                (17, 3, 8.00),
                (18, 1, 8.00),
                (18, 2, 8.00),
                (18, 4, 8.00),
                (18, 5, 8.00),
                (19, 3, 8.00),
                (19, 4, 8.00),
                (19, 5, 8.00),
                (20, 1, 8.00),
                (20, 2, 8.00),
                (20, 4, 8.00),
                (20, 5, 8.00);

-- Insert into SousChef (5/04/2020) - complete 
INSERT INTO SousChef (employeeID, level)
        VALUES  (18, 'I'), -- Sous Chef 1
                (19, 'II'), -- Sous Chef 2
                (20, 'III'); -- Sous Chef 3 

-- Insert into LineCook (5/04/2020) - complete
INSERT INTO LineCook (employeeID)
        VALUES  (6), -- LineCook 1
                (7), -- LineCook 2
                (8); -- LineCook 3

-- Insert into Dishwasher (05/03/2020) - COMPLETE
INSERT INTO Dishwasher (employeeID)
        VALUES (9), -- Dishwasher 1 
               (10); -- Dishwasher 2

-- Insert into MaitreD (5/04/2020) - COMPLETE
INSERT INTO MaitreD (employeeID)
        VALUES  (11), -- MaitreD 1
                (12); -- MaitreD 2

-- Insert into Waiter (5/04/2020) - COMPLETE
INSERT INTO Waiter (employeeID)
        VALUES  (13), -- waiter 1 
                (14), -- waiter 2
                (15), -- waiter 3
                (16), -- waiter 4
                (17); -- waiter 5

-- Insert into Ingredient 
INSERT into Ingredient (ingredient)
        VALUES  ('Black Pepper'),
                ('Flour'),
                ('Cornstarch'),
                ('Soda'),
                ('Powder'),
                ('Soy sauce'),
                ('Dry sherry'),
                ('Sesame oil'),
                ('Chicken breast meat'),
                ('Egg'),
                ('Green Onion'),
                ('Mushrooms'),
                ('Carrots'),
                ('Peas'),
                ('Bell pepper'),
                ('Water chestnuts'),
                ('Bamboo shoots'),
                ('Bean sprouts'),
                ('Oyster Sauce'),
                ('Sriracha'),
                ('Canola oil'),
                ('Noodles'),
                ('Baby bok choy'),
                ('Butter'),
                ('Chicken borth'),
                ('Potates'),
                ('Whole milk'),
                ('Crab'),
                ('Egg whites'),
                ('Chicken'),
                ('Orange juice'),
                ('Brown sugar'),
                ('Wine vinegar'),
                ('Dash salt'),
                ('Aniseed'),
                ('Pork chops'),
                ('Red pepper flakes'),
                ('Lemon juice'),
                ('Parsley leaves'),
                ('Noodle'),
                ('Chile sauce'),
                ('Lemongrass'),
                ('Habanero chile'),
                ('White onion'),
                ('Olive oil'),
                ('Lime juice'),
                ('Brown suager'),
                ('Rice vinegar' ),
                ('Pork shoulder'),
                ('Chicken breast'),
                ('Sugar'),
                ('Fresh ginger'),
                ('Onion'),
                ('Kosher salt'),
                ('Mustard'),
                ('Apple cider vinegar'),
                ('Pork tenderloin'),
                ('Molasses'),
                ('Garlic'),
                ('Vegetable oil'),
                ('Pork ribs'),
                ('Sea salt'),
                ('Pork cutlets'),
                ('Fish sauce');

-- Insert into HeadChefRecipe
INSERT INTO HeadChefRecipe (employeeID, recipeName)
        VALUES  (3, 'Pancakes'),
                (3, 'Sundae '),
                (4, 'Fire French Fries'),
                (4, 'Spanish Noodles'),
                (5, 'Waffle French Fries'),
                (5, 'Fish Tacos');
    
-- Insert into RecipeIngredient
INSERT INTO RecipeIngredient (ingredient, recipeID, quantityOfIngredient )
        VALUES ('Egg', 1 , 1),
               ('Sugar', 1 , 1),
               ('Whole milk', 1 , 1),
               ('Brown sugar', 2, 1),
               ('Red pepper flakes', 2 , 1),
               ('Egg', 2 , 1),
               ('Black Pepper', 3, 1),
               ('Sea salt', 3, 2),
               ('Chile sauce', 3, 4),
               ('Egg', 4, 2),
               ('Pork cutlets', 4, 3),
               ('Fresh ginger', 4, 1),
               ('Potates',5,2),
               ('Sea salt',5,1),
               ('Black Pepper',5,1),
               ('Fish sauce', 6, 1),
               ('Black Pepper', 6, 2),
               ('Lime juice',6,1),
               ('Vegetable oil',6,1);

-- Insert into Station 
INSERT INTO Station(stationName, stationDescription)
        VALUES  ('Butcher', 'butches meat'),
                ('Fry Cook', 'fries stuff'),
                ('Grill', 'griller'),
                ('Pantry', 'ensures filled pantries'),
                ('Pastry', 'makes deserts'),
                ('Roast', 'roasts meats'),
                ('Saute', 'makes sauces and gravies'),
                ('Vegetable', 'cuts vegetables');


INSERT INTO SeatingTable (tableNum, maxOccupancy)
        VALUES (1,6),
               (2,5),
               (3,4),
               (4,2),
               (5,2);

-- Insert into LineCookStation;
INSERT INTO LineCookStation (employeeID, stationName, shiftID)
        VALUES (6, 'Butcher', 1),
               (6, 'Vegetable', 5),
               (7, 'Grill', 1),
               (7, 'Butcher', 5),
               (8, 'Fry Cook', 3),
               (8, 'Saute', 6);

-- Insert into DishWasherBonus (5/04/2020) - COMPLETE
INSERT INTO DishWasherBonus (employeeID, workDate, dishesWashed )
        VALUES  (9, '2019-08-03', 123),
                (10, '2019-08-09', 256);


-- Insert into Waiter Bonus (5/04/2020) - COMPLETE
INSERT INTO WaiterBonus (employeeID, currentMonth, currentYear)
        VALUES  (13, 1, 2019), -- W1
                (14, 2, 2019), -- W2
                (15, 3, 2019), -- W3
                (16, 4, 2019), -- W4
                (17, 5, 2019); -- W5

-- Insert into Waiter Tip (5/04/2020) - COMPLETE
INSERT INTO WaiterTip (employeeID, tipDate, tipAmount)
        VALUES  (13, '2019-01-01', 25.00), -- waiter 1 
                (14, '2019-02-01', 22.00), -- waiter 2
                (15, '2019-03-05', 50.00), -- waiter 3
                (16, '2019-04-22', 62.00), -- waiter 4
                (17, '2019-05-07', 32.00); -- waiter 5

-- Insert into WaiterTable
INSERT INTO WaiterTable (tableID, employeeID, shiftID)
        VALUES (1, 13, 1),
               (3, 14, 1),
               (4, 16, 1),
               (2, 15, 2),
               (4, 17, 2),
               (5, 13, 2),
               (5, 14, 3),
               (2, 15, 3),
               (1, 16, 3),
               (3, 17, 3),
               (4, 14, 4),
               (5, 17, 4),
               (3, 14, 5),
               (2, 15, 5),
               (1, 16, 5),
               (4, 16, 6),
               (5, 15, 6),
               (2, 13, 6);

-- Insert into FoodExpertise
INSERT INTO FoodExpertise (employeeID, menuItemName)
        VALUES(18, 'Steak'),
              (18, 'Fried Rice'),
              (18, 'Chicken Chow Mein'),
              (18, 'Orange Chicken'),
              (18, 'Pad Thai'),
              (18, 'Kung Pao Chicken'),
              (19, 'Orange Chicken'),
              (19, 'Kung Pao chicken'),
              (19, 'Pad Thai'),
              (20, 'Chicken Soup'),
              (20, 'Noodle Soup'),
              (20, 'Spring Rolls'),
              (20, 'Steak'),
              (20, 'Fried Rice'),
              (20, 'Chicken Chow Mein');

-- Insert into SousMentorship
INSERT INTO SousMentorship (studentID, mentorID, menuItemName, mentorshipStartDate, mentorshipEndDate)
        VALUES(18, 20, 'Chicken Soup', '2019-05-09', '2019-07-09'),
              (19, 20, 'Spring Rolls', '2020-01-15', '2020-01-20'),
              (20, 19, 'Orange Chicken', '2020-01-25', '2020-07-25'),
              (19, 20, 'Noodle Soup', '2019-09-20', '2019-09-28');

-- Insert into Orders
INSERT INTO Orders (orderDate, orderTime)
        VALUES ('2019-01-01', '13:06:52'),
               ('2019-01-29', '18:53:28'),
               ('2019-02-15', '12:10:18'),
               ('2019-02-23', '22:38:08'),
               ('2019-03-20', '15:20:34'),
               ('2020-01-15', '13:59:59'),
               ('2020-02-15', '14:59:59'),
               ('2020-03-15', '17:59:59'),
               ('2020-04-15', '18:59:59'),
               ('2020-05-15', '16:59:59'),
               ('2020-06-15', '15:59:59'),
               ('2020-09-15', '13:59:59'),
               ('2020-10-15', '14:59:59'),
               ('2020-10-19', '17:59:59'),
               ('2020-11-15', '18:59:59'),
               ('2020-12-15', '16:59:59'),
               ('2020-12-17', '15:59:59');

-- Insert into Unknown
INSERT INTO Unknown (orderID)
        VALUES (1),
               (5);

-- Insert into Known 
INSERT INTO Known (customerID, orderID, creditEarned, DOB, address, email, firstName, lastName)
        VALUES (1, 2, 10, '1988-02-19', '123 ABC Ave', 'appleInc@gmail.com', 'Steve', 'Jobs'),
               (1, 3, 5, '1988-02-19', '123 ABC Ave', 'appleInc@gmail.com', 'Steve', 'Jobs'),
               (1, 4, 20, '1988-02-19', '123 ABC Ave', 'appleInc@gmail.com', 'Steve', 'Jobs'),
               (2, 6, 25, '1994-12-17', '8214 bee street ', 'johnDee@gmail.com', 'john', 'dee'),
               (3, 7, 100, '1990-12-17', '6271 Gucci street', 'steveNash@hotmail.com', 'steve', 'nash'),
               (4, 8, 22, '2000-12-17', '1901 Long Beach street', 'JohnCena@gmail.com', 'John', 'Cena'),
               (4, 9, 7, '2000-12-17', '1901 Long Beach street', 'JohnCena@gmail.com', 'John', 'Cena'),
               (5, 10, 15, '1947-03-12', '1123 Court Ave.', 'camWilson32@gmail.com', 'Cameron', 'Wilson'),
               (6, 11, 45, '1963-07-17', '7632 Spoon St.', 'MarkSum99@yahoo.com', 'Mark', 'Summers'),
               (7, 12, 30, '1998-02-20', '283 Atlantic Ave', 'myGuy@gmail.com', 'Dude', 'Perfect'),
               (7, 13, 35, '1998-02-20', '283 Atlantic Ave', 'myGuy@gmail.com', 'Dude', 'Perfect'),
               (8, 14, 10, '1999-10-11', '6532 Curtiss St.', 'JohnFootball@gmail.com', 'John', 'Paul'),
               (9, 15, 10, '1976-12-17', '2100 Los Angeles street', 'DBrown@CSULB.edu', 'Dave', 'Brown'),
               (10, 16, 21, '1940-12-01', '26 Creek Court Davison', 'databaseLover123@csulb.edu', 'Alvaro', 'Monge'),
               (10, 17, 45, '1940-12-01', '26 Creek Court Davison', 'databaseLover123@csulb.edu', 'Alvaro', 'Monge');

-- Insert into Customer
INSERT INTO Customer (customerID, orderID, creditBalance)
        VALUES (1, 2, 130),
               (1, 3, 130),
               (1, 4, 130),
               (2, 6, 200),
               (3, 7, 25),
               (4, 8, 40),
               (4, 9, 40),
               (5, 10, 190),
               (6, 11, 1023),
               (7, 12, 93),
               (7, 13, 93),
               (8, 14, 30),
               (9, 15, 50),
               (10, 16, 27),
               (10, 17, 27);

-- Insert into Private
INSERT INTO Private (customerID, orderID)
        VALUES (1, 2),
               (1, 3),
               (2, 6),
               (3, 7),
               (4, 8),
               (5, 10),
               (6, 11),
               (7, 12),
               (10, 16);

--Insert into Corporation
INSERT INTO Corporation(customerID, orderID, organizationName, departmentName)
        VALUES (1, 4, 'Big Baller Brand', 'Arts and Crafts'),
               (4, 9, 'Database Fundamentals', 'Management'),
               (7, 13, 'Activision', 'Public Relations'),
               (8, 14, 'Infinity Ward', 'Maintenance'),
               (9, 15, 'NASA', 'Research'),
               (10, 17, 'Sony', 'Game Production');

-- Insert into Cash
INSERT INTO Cash (orderID)
        VALUES (1),
               (5);

-- Insert into MimingsPayment
INSERT INTO MimingsPayment (orderID, customerID, creditSpent)
        VALUES (2, 1, 120),
               (3, 1, 50),
               (4, 1, 40),
               (6, 2, 55);

-- Insert into CardPayment
INSERT INTO CardPayment (OrderID, cardNumber, expirationDate, cvv, cardType)
        VALUES  (7, 287520949, '2022-02-12', 153, 'debit'),
                (8, 268632833, '2022-03-09', 175, 'credit'),
                (10, 891127093, '2020-08-07', 164, 'debit'),
                (11, 817198528, '2020-05-11', 185, 'debit'),
                (13, 836244554, '2021-06-15', 179, 'credit'),
                (14, 302182130, '2021-12-22', 111, 'debit'),
                (16, 110653186, '2020-11-27', 199, 'debit'),
                (17, 796925423, '2022-05-09', 156, 'credit');

-- Insert into WebOrder
INSERT INTO WebOrder (orderID)
        VALUES (7),
               (8),
               (10),
               (11),
               (13),
               (14);

-- Insert into PhoneOrder
INSERT INTO PhoneOrder (orderID)
        VALUES  (1),
                (5),
                (9),
                (12),
                (15);

-- Insert into EatInOrder 
INSERT INTO EatInOrder(orderID, numGuests, tableID, employeeID, shiftID)
        VALUES  (16, 5, 2, 15, 3),
                (17, 3, 3, 14, 1),
                (2, 5, 1, 13, 1),
                (3, 2, 4, 16, 1),
                (4, 1, 5, 13, 2),
                (6, 4, 1, 16, 3);

-- Insert into Menu
INSERT INTO Menu (menuType, menuPriceModifier, startTime, endTime, dateCreated)
        VALUES  ('Lunch', 0.9,     '10:00:00', '16:59:59', '2018-03-29'), -- 10am to 4:59pm
                ('Evening',                 0.8,      '17:00:00', '23:00:00', '2018-11-23'), -- 5pm to 11pm
                ('Sunday Brunch Buffet',    35.0,    '10:00:00', '23:00:00', '2018-08-09'), -- only sundays 10am to 11pm
                ('Children',                0.7,     '10:00:00', '23:00:00', '2018-02-18'); 

-- Insert into MenuItemSize 
INSERT INTO MenuItemSize (menuType, menuItemName, portionSize)
        VALUES('Lunch', 'Chicken Soup', '0.7lbs'),
              ('Lunch', 'Pad Thai', '1lb'),
              ('Lunch', 'Orange Chicken', '4lbs'),
              ('Evening', 'Orange Chicken', '6 lbs'),
              ('Evening', 'Filet Mignon', '6 lbs'),
              ('Evening', 'Steak', '12 lbs'),
              ('Sunday Brunch Buffet', 'Fried Rice', '0.7lbs'),
              ('Sunday Brunch Buffet', 'Chicken Chow Mein', '1lb'),
              ('Sunday Brunch Buffet', 'Noodle Soup', '0.5lbs'),
              ('Children', 'Spring Rolls','1.2lbs'),
              ('Children', 'Pad thai', '5 lbs' ),
              ('Children', 'Orange Chicken', '5 lbs' );

-- Insert into orderDetails 
INSERT INTO orderDetails (menuType, menuItemName, orderID, quantity)
        VALUES ('Lunch', 'Orange Chicken', 1, 2),
               ('Evening', 'Steak', 2, 1),
               ('Lunch', 'Chicken Soup', 3, 3),
               ('Evening', 'Filet Mignon', 4, 2),
               ('Children', 'Spring Rolls', 5, 4),
               ('Evening', 'Orange Chicken', 16, 1),
               ('Sunday Brunch Buffet', 'Noodle Soup', 17, 2);
INSERT INTO orderDetails (menuType, menuItemName, orderID, quantity)
    VALUES      ('Lunch', 'Chicken Soup', 6, 2),
                ('Lunch', 'Pad Thai', 7, 3),
                ('Evening', 'Orange Chicken', 8, 5),
                ('Evening', 'Steak', 9, 1),
                ('Children', 'Orange Chicken', 10, 1),
                ('Lunch', 'Chicken Soup', 11, 3);
INSERT INTO orderDetails (menuType, menuItemName, orderID, quantity)
    VALUES      ('Sunday Brunch Buffet', 'Fried Rice', 12, 3 ),
                ('Sunday Brunch Buffet', 'Noodle Soup', 13, 2),
                ('Sunday Brunch Buffet', 'Chicken Chow Mein', 14, 3),
                ('Children', 'Spring Rolls', 15, 1);

-- Insert into Appetizer
INSERT INTO Appetizer(menuItemName)
        VALUES  ('Fried Rice'),
                ('Spring Rolls');

-- Insert into Soup
INSERT INTO Soup(menuItemName, broth)
        VALUES  ('Noodle soup', 'vegetable broth'),
                ('Chicken soup', 'chicken broth');

-- Insert into Meat
INSERT into Meat(meatName)
        VALUES  ('Chef Special'),
                ('Chicken'),
                ('Beef'),
                ('Pork'),
                ('Seafood'),
                ('Vegetable');
                                
-- Insert into MeatEntree
INSERT INTO MeatEntree(menuItemName, typeOfMeat)
        VALUES  ('Steak', 'Pork'),
                ('Orange Chicken', 'Chicken'),
                ('Filet Mignon', 'Seafood'),
                ('Chicken Chow Mein', 'Chicken'),
                ('Kung Pao chicken', 'Chicken'),
                ('Pad Thai', 'Vegetable');

-- Insert into ChowMein
INSERT INTO ChowMein(menuItemName, typeOfNoodles)
        VALUES  ('Kung Pao chicken', 'Ramen'),
                ('Chicken Chow Mein', 'Ramen');

-- Insert into EggFooYoung
INSERT INTO EggFooYoung(menuItemName, omeletStyle)
        VALUES ('Pad Thai', 'Over-Easy');  

-- Insert into ChopSuey
INSERT INTO ChopSuey(menuItemName, typeOfRice)
    VALUES ('Orange Chicken', 'White'); 