Drop table if exists Cash;
Drop table if exists CardPayment;
Drop table if exists EatInOrder;
Drop table if exists PhoneOrder;
Drop table if exists WebOrder;
Drop table if exists orderDetails;
Drop table if exists ChopSuey;
Drop table if exists EggFooYoung;
Drop table if exists ChowMein;
Drop table if exists MeatEntree;
Drop table if exists Meat;
Drop table if exists Soup;
Drop table if exists Appetizer;
Drop table if exists MenuItemSize;
Drop table if exists Menu;
Drop table if exists MimingsPayment;
Drop table if exists Corporation;
Drop table if exists Private;
Drop table if exists Customer;
Drop table if exists Known;
Drop table if exists Unknown;
Drop table if exists Orders;
Drop table if exists SousMentorship;
Drop table if exists FoodExpertise;
Drop table if exists WaiterTable;
Drop table if exists WaiterTip;
Drop table if exists WaiterBonus;
Drop table if exists DishWasherBonus;
Drop table if exists LineCookStation;
Drop table if exists SeatingTable; 
Drop table if exists Station;
Drop table if exists RecipeIngredient;
Drop table if exists HeadChefRecipe;
Drop table if exists Ingredient;
Drop table if exists Waiter; 
Drop table if exists MaitreD;
Drop table if exists Dishwasher;
Drop table if exists LineCook;
Drop table if exists SousChef;
Drop table if exists WorkSchedule;
Drop table if exists WorkShift; 
Drop table if exists WorkShiftType; 
Drop table if exists HeadChef;
Drop table if exists Chef;
Drop table if exists MenuItem; 
Drop table if exists Manager;
Drop table if exists PartTimeEmployee;
Drop table if exists FullTimeEmployee;
Drop table if exists EmployeeOfTheMonth;
Drop table if exists Employee; 

-- Created Employee Table (05/03/2020)  CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Employee 
(
    employeeID  INT                 NOT NULL AUTO_INCREMENT,
    firstName   VARCHAR(30)         NOT NULL,
    lastName    VARCHAR(30)         NOT NULL,
    birthDate   DATE                NOT NULL,
    hireDate    DATE                NOT NULL,
    CONSTRAINT PK_Employee          PRIMARY KEY(employeeID),
    CONSTRAINT UC_Employee          UNIQUE (firstName, lastName, birthDate)
);

-- Created WorkShiftType (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE WorkShiftType
(
    shiftType   ENUM('Morning', 'Evening')               NOT NULL,
    CONSTRAINT  PK_ShiftType 	PRIMARY KEY (shiftType)
);

-- Created SeatingTable Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE SeatingTable
(
    tableID		INT			NOT NULL	 AUTO_INCREMENT,
    tableNum 		TINYINT                  NOT NULL,
    maxOccupancy         TINYINT                 NOT NULL,
    CONSTRAINT      	PK_SeatingTable 			PRIMARY KEY (tableID),
    CONSTRAINT 		UC_SeatingTable			UNIQUE (tableNum)
);

-- Created EmployeeOfTheMonth Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE EmployeeOfTheMonth
(
    employeeID          INT                                                         NOT NULL,
    month               ENUM('1','2','3','4','5','6','7','8','9','10','11','12')    NOT NULL,
    year                SMALLINT                                                    NOT NULL,
    achievement         VARCHAR(50)                                                 NOT NULL,
    CONSTRAINT PK_EmployeeOfTheMonth                                                PRIMARY KEY (month, year),
    CONSTRAINT FK_EmployeeOfTheMonth                                                FOREIGN KEY (employeeID)  REFERENCES Employee (employeeID)
);

-- Created FullTimeEmployee Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE FullTimeEmployee
(
    employeeID      INT                     NOT NULL,
    weeklySalary    DECIMAL(9, 2)           NOT NULL,
    CONSTRAINT PK_FullTimeEmployee          PRIMARY KEY(employeeID),
    CONSTRAINT FK_Employee_FullTimeEmployee FOREIGN KEY(employeeID) REFERENCES Employee (employeeID)
);

-- Created PartTimeEmployee Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE PartTimeEmployee
(
    employeeID  INT                             NOT NULL,
    hourlyRate  DECIMAL(5, 2)                   NOT NULL,
    CONSTRAINT  PK_PartTimeEmployee             PRIMARY KEY(employeeID),
    CONSTRAINT  FK_Employee_PartTimeEmployee    FOREIGN KEY(employeeID) REFERENCES Employee (employeeID)
);

-- Created Managers Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Manager
(
    managerID                  INT                 NOT NULL,
    managerCredentials          VARCHAR(100),
    CONSTRAINT PK_Manager                           PRIMARY KEY (managerID),
    CONSTRAINT FK_FullTimeEmployee_Manager          FOREIGN KEY (managerID) REFERENCES FullTimeEmployee (employeeID)
);

-- Created MenuItem Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE MenuItem
(
    menuItemName   	VARCHAR(30)     						NOT NULL,
    spiciness            ENUM('Mild', 'Tangy', 'Piquant', 'Hot', 'Oh My God') 	NOT NULL,
    basePrice            DECIMAL(6, 2)                                            NOT NULL DEFAULT 0,
    CONSTRAINT  	PK_MenuItem 			PRIMARY KEY (menuItemName)
);

-- Created Chefs Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Chef
(
    employeeID              INT         NOT NULL,
    favFoodToCook           VARCHAR(30),
    CONSTRAINT PK_Chefs                  PRIMARY KEY (employeeID),
    CONSTRAINT FK_FullTimeEmployee_Chefs FOREIGN KEY (employeeID) REFERENCES FullTimeEmployee (employeeID),
    CONSTRAINT FK_menuItem_Chefs FOREIGN KEY (favFoodToCook) REFERENCES MenuItem (menuItemName)
);

-- Created Dishwasher Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Dishwasher
(
    employeeID   	INT     		NOT NULL,
    CONSTRAINT  PK_Dishwasher 		PRIMARY KEY (employeeID),
    CONSTRAINT  FK_PTE_Dishwasher	FOREIGN KEY (employeeID) REFERENCES PartTimeEmployee (employeeID)
);

-- Created MaitreD Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE MaitreD
(
    employeeID           INT     	NOT NULL,
    CONSTRAINT  PK_MaitreD 		PRIMARY KEY (employeeID),
    CONSTRAINT  FK_PTE_MaitreD           FOREIGN KEY (employeeID) REFERENCES PartTimeEmployee (employeeID)
);

-- Created Waiter Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Waiter
(
    employeeID   	INT     		NOT NULL,
    CONSTRAINT  PK_Waiter 		PRIMARY KEY (employeeID),
    CONSTRAINT  FK_PTE_Waiter            FOREIGN KEY (employeeID) REFERENCES PartTimeEmployee (employeeID)
);

-- Created WaiterBonus Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE WaiterBonus
(
    employeeID   		INT                                                                     NOT NULL,
    currentMonth   		ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12')     NOT NULL,
    currentYear 			SMALLINT                                                                NOT NULL,
    CONSTRAINT  	PK_WaiterBonus          PRIMARY KEY (employeeID, currentMonth, currentYear),
    CONSTRAINT	FK_Waiter_MoraleBonus 	FOREIGN KEY (employeeID) REFERENCES Waiter (employeeID)
);

-- Created WaiterTips Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE WaiterTip
(
    employeeID   	INT			NOT NULL,
    tipDate		DATE			NOT NULL,
    tipAmount   		DECIMAL(8, 2)            NOT NULL, 
    CONSTRAINT  	PK_Tip 		PRIMARY KEY (employeeID, tipDate),
    CONSTRAINT	FK_Waiter_Tip 	FOREIGN KEY (employeeID) REFERENCES Waiter (employeeID)
);

-- Created DishWasherBonus Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE DishWasherBonus
(
    employeeID   		INT				NOT NULL,
    workDate                     DATE                             NOT NULL,
    dishesWashed 		INT				NOT NULL,
    CONSTRAINT  	PK_DishBonus            PRIMARY KEY (employeeID, workDate),
    CONSTRAINT	FK_Dishwasher_DishBonus 	FOREIGN KEY (employeeID) REFERENCES Dishwasher (employeeID)
);

-- Created headChef Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE HeadChef
(
    chefID              INT                    NOT NULL,
    headChefHatSize         ENUM('XS', 'S', 'M', 'L', 'XL'),
    CONSTRAINT  PK_headChef 		PRIMARY KEY (chefID),
    CONSTRAINT  FK_Chefs_headChef	FOREIGN KEY (chefID) REFERENCES Chef (employeeID)
);

-- Created SousChef Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE SousChef
(
    employeeID   	INT     		NOT NULL,
    level   		ENUM('I', 'II', 'III', 'IV'),
    CONSTRAINT  PK_SousChef 		PRIMARY KEY (employeeID),
    CONSTRAINT 	FK_Chefs_SousChef    	FOREIGN KEY (employeeID) REFERENCES Chef (employeeID)
);

-- Created LineCook Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE LineCook
(
    employeeID              INT     	NOT NULL,
    CONSTRAINT  PK_LineCook 	 PRIMARY KEY (employeeID),
    CONSTRAINT  FK_Chefs_LineCook FOREIGN KEY (employeeID) REFERENCES Chef (employeeID)
);

-- Created WorkShift (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE WorkShift
(
    shiftID             INT                                      NOT NULL AUTO_INCREMENT,
    shiftType           ENUM('Morning', 'Evening')               NOT NULL,
    dateOfShift         DATE            			NOT NULL,
    currentOccupancy    ENUM('High', 'Medium', 'Low')            NOT NULL,
    startTime           TIME                                    NOT NULL,
    endTime             TIME                                    NOT NULL,
    managerID           INT                                     NOT NULL,
    chefID              INT                                     NOT NULL,
    CONSTRAINT  PK_WorkShift                    PRIMARY KEY (shiftID),
    CONSTRAINT 	UC_Employee                     UNIQUE (shiftType, dateOfShift, startTime, endTime),
    CONSTRAINT  FK_WorkShiftType_WorkShift      FOREIGN KEY (shiftType) REFERENCES WorkShiftType (shiftType),
    CONSTRAINT FK_Manager_WorkShift FOREIGN KEY (managerID) REFERENCES Manager (managerID),
    CONSTRAINT FK_Chef_WorkShift FOREIGN KEY (chefID) REFERENCES HeadChef (chefID)
);

-- Created WorkSchedule (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE WorkSchedule
(
    employeeID     	INT             NOT NULL,
    shiftID   		INT     	NOT NULL,
    hoursWorked  	DECIMAL(4, 2)   DEFAULT 8,
    CONSTRAINT  PK_WorkSchedule                  PRIMARY KEY (employeeID, shiftID),
    CONSTRAINT  FK_WorkShift_WorkSchedule	FOREIGN KEY (shiftID) 	REFERENCES WorkShift (shiftID),
    CONSTRAINT  FK_Employee_WorkSchedule	 FOREIGN KEY (employeeID) REFERENCES Employee (employeeID)
);

-- Created Station Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Station
(
    stationName   			VARCHAR(50)	                 NOT NULL,
    stationDescription                   VARCHAR(100)                     NOT NULL,
    CONSTRAINT  PK_Station 		PRIMARY KEY (stationName)
);

-- Created LineCookStation Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE LineCookStation
(
    employeeID   		INT     			NOT NULL,
    stationName   		VARCHAR(50)		NOT NULL,
    shiftID INT NOT NULL,
    CONSTRAINT  PK_CookingStation                PRIMARY KEY (employeeID, stationName),
    CONSTRAINT 	FK_LineCook_LineCookStation	FOREIGN KEY (employeeID)  REFERENCES LineCook (employeeID),
    CONSTRAINT FK_Employee_LCS FOREIGN KEY (employeeID) REFERENCES Employee (employeeID),
    CONSTRAINT 	FK_Station_CookingStation	FOREIGN KEY (stationName) REFERENCES Station (stationName),
    CONSTRAINT FK_workSchedule_LCS FOREIGN KEY (shiftID) REFERENCES WorkSchedule (shiftID)
);

-- Created waiterTable Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE WaiterTable
(
    tableID INT NOT NULL,
    employeeID INT NOT NULL,
    shiftID INT NOT NULL,
    CONSTRAINT PK_waiterTable PRIMARY KEY (tableID, shiftID, employeeID),
    CONSTRAINT FK_seatingTable_waiterTable FOREIGN KEY (tableID) REFERENCES SeatingTable (tableID),
    CONSTRAINT FK_waiter_waiterTable FOREIGN KEY (employeeID) REFERENCES Waiter (employeeID),
    CONSTRAINT FK_workSchedule_waiterTable FOREIGN KEY (employeeID, shiftID) REFERENCES WorkSchedule (employeeID, shiftID)
);

-- Created Ingredients Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Ingredient
(
    ingredient      VARCHAR(50)	NOT NULL,
    CONSTRAINT  PK_Ingredients 		PRIMARY KEY (ingredient)
);

-- Created HeadChefRecipes Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE HeadChefRecipe
(
    recipeID   		INT     		NOT NULL AUTO_INCREMENT,
    employeeID   	INT     		NOT NULL,
    recipeName           VARCHAR(50)     NOT NULL,
    CONSTRAINT  PK_Recipe                        PRIMARY KEY (recipeID),
    CONSTRAINT  FK_headChef_HeadChefRecipes	FOREIGN KEY (employeeID) REFERENCES HeadChef (chefID)
);

-- Created RecipeIngredients Table (05/04/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE RecipeIngredient
(
    ingredient  VARCHAR(20) NOT NULL,
    recipeID INT NOT NULL,
    quantityOfIngredient INT NOT NULL,
    CONSTRAINT PK_recipeIngredients PRIMARY KEY (recipeID, ingredient),
    CONSTRAINT FK_ingredients_recipeIngredients FOREIGN KEY (ingredient) REFERENCES Ingredient (ingredient),
    CONSTRAINT FK_headChefRecipes_RI FOREIGN KEY (recipeID) REFERENCES HeadChefRecipe (recipeID)
);

-- Created FoodExpertise (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE FoodExpertise
(
    employeeID 		INT				NOT NULL,
    menuItemName   	VARCHAR(30)                      NOT NULL,
    CONSTRAINT  	PK_Expertise                    PRIMARY KEY (employeeID, menuItemName),
    CONSTRAINT	FK_SousChef_FoodExpertise 	FOREIGN KEY (employeeID) 	REFERENCES SousChef (employeeID),
    CONSTRAINT	FK_MenuItem_FoodExpertise 	FOREIGN KEY (menuItemName) 	REFERENCES MenuItem (menuItemName)
);

-- Created SousMentorship (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE SousMentorship
(
    studentID 			INT				NOT NULL,
    mentorID   			INT				NOT NULL,
    menuItemName   		VARCHAR(30)     NOT NULL,
    mentorshipStartDate		DATE                            NOT NULL,
    mentorshipEndDate   		DATE                            NOT NULL, 
    CONSTRAINT      	PK_SousMentorship 			PRIMARY KEY (studentID, mentorshipStartDate),
    CONSTRAINT		FK_SousChef_SousMentorship 		FOREIGN KEY (studentID)                  REFERENCES SousChef (employeeID),
    CONSTRAINT          FK_FoodExpertise_SousMentorship          FOREIGN KEY (mentorID, menuItemName) 	REFERENCES FoodExpertise (employeeID, menuItemName)
);

-- Created orders (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Orders
(
	orderID 			INT 			NOT NULL AUTO_INCREMENT,
	orderDate 	 	DATE 			NOT NULL,
	orderTime 		TIME 			NOT NULL,
	CONSTRAINT PK_orders 	PRIMARY KEY (orderID)
);

-- Created Known (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Known
(
    customerID INT NOT NULL,
    orderID INT NOT NULL,
    creditEarned INT NOT NULL,
    DOB DATE NOT NULL,
    address VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Known PRIMARY KEY (orderID, customerID),
    CONSTRAINT FK_orders_Known FOREIGN KEY (orderID) REFERENCES Orders (orderID)
);

-- Created Unknown (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Unknown
(
    orderID INT NOT NULL,
    CONSTRAINT PK_Unknown PRIMARY KEY (orderID),
    CONSTRAINT FK_Orders_Unknown FOREIGN KEY (orderID) REFERENCES Orders (orderID)
);

-- Created customers (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Customer
(
    customerID     INT NOT NULL,
    orderID INT NOT NULL,
    creditBalance INT NOT NULL,
    CONSTRAINT PK_customers PRIMARY KEY (orderID, customerID),
    CONSTRAINT FK_Known_customers FOREIGN KEY (orderID, customerID) REFERENCES Known (orderID, customerID)
);

-- Created private (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Private
(
    customerID     INT          NOT NULL,
    orderID INT NOT NULL,
    CONSTRAINT     PK_private    		PRIMARY KEY(orderID, customerID),
    CONSTRAINT	   FK_customersKnown_private 	FOREIGN KEY(orderID, customerID) 	REFERENCES Customer (orderID, customerID)
);

-- Created corporation (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Corporation
(
    customerID          INT         NOT NULL,
    orderID INT NOT NULL,
    organizationName    VARCHAR(30) NOT NULL,
    departmentName	VARCHAR(30) NOT NULL,
    CONSTRAINT     PK_corporation 			PRIMARY KEY(orderID, customerID),
    CONSTRAINT 	   UC_corporation			UNIQUE (organizationName, departmentName),
    CONSTRAINT     FK_Known_corporation 	FOREIGN KEY (orderID, customerID)	REFERENCES Customer (orderID, customerID)
);

-- Created cardPayment Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
create table CardPayment
(
	orderID 			INT         NOT NULL,
	cardnumber 			INT         NOT NULL,
	expirationDate 		        DATE        NOT NULL,
	cvv 				INT         NOT NULL,
	cardType 			VARCHAR(20),
	CONSTRAINT PK_cardPayment               PRIMARY KEY (orderID),
	CONSTRAINT FK_Orders_cardPayment      FOREIGN KEY (orderID) REFERENCES Orders (orderID)
);

-- Created Cash Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Cash
(
	orderID INT NOT NULL,
	CONSTRAINT PK_Cash              PRIMARY KEY (orderID),
	CONSTRAINT FK_Orders_Cash      FOREIGN KEY (orderID) REFERENCES Orders (orderID),
        CONSTRAINT FK_Unknown_Cash FOREIGN KEY (orderID) REFERENCES Unknown (orderID)
);

-- Created MimingsPayment (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE MimingsPayment
(
    orderID      INT NOT NULL,
    customerID     INT NOT NULL,
    creditSpent INT NOT NULL,
    CONSTRAINT     PK_MimingsPayment  		  PRIMARY KEY(orderID),
    CONSTRAINT     FK_customers_MimingPayment FOREIGN KEY (orderID, customerID) REFERENCES Customer (orderID, customerID),
    CONSTRAINT     FK_orders_MimingPayment       FOREIGN KEY (orderID) REFERENCES Orders (orderID)
);

-- Created webOrder (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE WebOrder
(
    orderID INT NOT NULL,
    CONSTRAINT PK_WebOrder 		PRIMARY KEY (orderID),
    CONSTRAINT FK_orders_webOrder 	FOREIGN KEY (orderID) REFERENCES Orders (orderID)
);

-- Created phoneOrder Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
create table PhoneOrder
(
    orderID INT NOT NULL,
    CONSTRAINT PK_PhoneOrder 		PRIMARY KEY (orderID),
    CONSTRAINT FK_orders_PhoneOrder 	FOREIGN KEY (orderID) REFERENCES Orders (orderID)
);

-- Created EatInOrder Table (05/03/2020) CHECK ATTRIBUTES - COMPLETE
create table EatInOrder
(
	orderID         INT 	NOT NULL,
	numGuests 	INT     NOT NULL,
	tableID	INT	NOT NULL,	
        employeeID INT NOT NULL,
        shiftID INT NOT NULL,
	CONSTRAINT PK_EatInOrder 		PRIMARY KEY(orderID, tableID),
	CONSTRAINT FK_orders_EatInOrder 		FOREIGN KEY(orderID) 	REFERENCES Orders (orderID),
        CONSTRAINT FK_waitingTable_EatInOrder 	FOREIGN KEY(tableID, shiftID, employeeID) REFERENCES WaiterTable (tableID, shiftID, employeeID)
);						

-- Created Menu (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Menu
(
    menuType 		ENUM('Evening','Lunch','Sunday Brunch Buffet','Children') NOT NULL,
    menuPriceModifier 	DOUBLE                                                    NOT NULL DEFAULT 0, -- in percentages (ex. 20 means 20% off)
    startTime 		TIME                                                      NOT NULL,
    endTime 		TIME                                                      NOT NULL,
    dateCreated 		DATE                                                      NOT NULL,
    CONSTRAINT PK_Menu primary key(menuType)
);

-- Created MenuItemSize (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE MenuItemSize 
(
    menuType 		ENUM('Evening','Lunch','Sunday Brunch Buffet','Children'),
    menuItemName 	varchar(50) 	NOT NULL,
    portionSize          varchar(50)	NOT NULL,
    CONSTRAINT	PK_MenuItemSize			PRIMARY KEY (menuType, menuItemName),
    CONSTRAINT	FK_Menu_MenuItemSize		FOREIGN KEY (menuType) references Menu(menuType),
    CONSTRAINT	FK_MenuItem_MenuItemSize         FOREIGN KEY (menuItemName) references MenuItem(menuItemName)
);

-- Created Appetizer (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Appetizer 
(
    menuItemName                         VARCHAR(50),
    CONSTRAINT 	PK_Appetizer		PRIMARY KEY(menuItemName),
    CONSTRAINT	FK_MenuItem_Appetizer	FOREIGN KEY(menuItemName) references MenuItem(menuItemName)
);

-- Created Soup (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Soup 
(
    menuItemName                VARCHAR(50),
    broth 			VARCHAR(50), 
    CONSTRAINT	PK_Soup                     PRIMARY KEY(menuItemName),
    CONSTRAINT	FK_MenuItem_Soup            FOREIGN KEY(menuItemName) references MenuItem(menuItemName)
);

-- Created Meat (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE Meat
(
   meatName     ENUM('Chef Special', 'Pork', 'Chicken', 'Beef', 'Seafood', 'Vegetable'),
   CONSTRAINT	PK_Meat              PRIMARY KEY (meatName)
);

-- Created MeatEntree (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE MeatEntree (
    menuItemName            VARCHAR(50),
    typeOfMeat              ENUM('Chef Special', 'Pork', 'Chicken', 'Beef', 'Seafood', 'Vegetable'),
    CONSTRAINT	PK_MeatEntrees              PRIMARY KEY (menuItemName),
    CONSTRAINT	FK_MenuItem_MeatEntree      FOREIGN KEY (menuItemName) REFERENCES MenuItem(menuItemName)
);

-- Created ChowMein (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE ChowMein (
    menuItemName 		VARCHAR(50),
    typeOfNoodles 		VARCHAR(50),
    CONSTRAINT	PK_ChowMein			PRIMARY KEY (menuItemName),
    CONSTRAINT	FK_MeatEntree_ChowMein		FOREIGN KEY (menuItemName) REFERENCES MeatEntree(menuItemName)
);

-- Created EggFooYoung (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE EggFooYoung(
    menuItemName 	VARCHAR(50),
    omeletStyle          VARCHAR(50),
    CONSTRAINT	PK_EggFooYoung                   PRIMARY KEY (menuItemName),
    CONSTRAINT	FK_MeatEntree_EggFooYoung	FOREIGN KEY (menuItemName) REFERENCES MeatEntree(menuItemName)
);

-- Created ChopSuey (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE ChopSuey(
    menuItemName 	VARCHAR(50),
    typeOfRice 		VARCHAR(50),
    CONSTRAINT	PK_ChopSuey			PRIMARY KEY (menuItemName),
    CONSTRAINT	FK_MeatEntree_ChopSuey		FOREIGN KEY (menuItemName) REFERENCES MeatEntree(menuItemName)
);

-- Created orderDetails (05/03/2020) CHECK ATTRIBUTES - COMPLETE
CREATE TABLE orderDetails
(
    menuType 		ENUM('Evening','Lunch','Sunday Brunch Buffet','Children') 	NOT NULL,
    menuItemName 	varchar(50) 							NOT NULL,
    orderID 		INT 								NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT PK_orderDetails                  PRIMARY KEY (menuType, menuItemName, orderID),
    CONSTRAINT FK_orders_orderDetails           FOREIGN KEY (orderID) 	REFERENCES Orders (orderID),
    CONSTRAINT FK_MenuItemSize_orderDetails     FOREIGN KEY (menuType, menuItemName) 	REFERENCES MenuItemSize(menuType, menuItemName)
);		