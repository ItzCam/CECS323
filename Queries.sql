

--  1) List the customers. For each customer, indicate which category he or she fall into, and
--  his or her contact information. If you have more than one independent categorization of
--  customers, please indicate which category the customer falls into for all of the
--  categorizations.
SELECT firstName AS "First", lastName AS "Last", email AS "Email", address AS "Address", DOB AS "DOB", 'Private' AS "Category"
    FROM Customer 
    INNER JOIN Known using (customerID)
    WHERE customerID IN
        (SELECT customerID FROM Private)
UNION 
SELECT firstName AS "First", lastName AS "Last", email AS "Email", address AS "Address", DOB AS "DOB", 'Corporation' AS "Category"
    FROM Customer 
    INNER JOIN Known using (customerID)
    WHERE customerID IN
        (SELECT customerID FROM Corporation);

--  2) List the top three customers in terms of their net spending for the past two years (last
--  730 days), and the total that they have spent in that period.
SELECT firstName AS "First", lastName AS "Last", orderTotal AS "Total Spent"
    FROM 
        (SELECT orderID, SUM((od.quantity * mi.basePrice) * m.menuPriceModifier) orderTotal
            FROM orderDetails od
                INNER JOIN MenuItem mi using (menuItemName)
                INNER JOIN Menu m using (menuType)
                INNER JOIN Orders o using (orderID)
            GROUP BY orderID, orderDate
            HAVING (YEAR(now()) - YEAR(orderDate)) <= 2) totals
    INNER JOIN Known using (orderID)
    ORDER BY orderTotal DESC
    LIMIT 3;

--  3) Find all of the sous chefs who have three or more menu items that they can prepare. For
--  each sous chef, list their name, the number of menu items that they can prepare, and
--  each of the menu items. You can use group_concat to get all of a given sous chef’s data
--  on one row, or print out one row per sous chef per menu item.
SELECT DISTINCT firstName AS "First", lastName AS "Last", numberOfItems AS "Preparable Items", 
                GROUP_CONCAT(menuItemName SEPARATOR ', ') AS "Menu Items"
    FROM 
        (SELECT EmployeeID, COUNT(menuItemName) numberOfItems
            FROM FoodExpertise
            INNER JOIN Employee USING (EmployeeID)
            GROUP BY EmployeeID
            HAVING COUNT(menuItemName) >= 3)ableToPrepare
    INNER JOIN Employee using (EmployeeID)
    INNER JOIN FoodExpertise using (EmployeeID)
    GROUP BY firstName, lastName, numberOfItems;

--  4) Find all of the sous chefs who have three or more menu items in common.
--  i. Please give the name of each of the two sous chefs sharing three or more menu items.
--  ii. Please make sure that any given pair of sous chefs only shows up once.
--  iii. Please list the items that the two Sous Chefs have in common. Again, you can use
--  group_concat to get all of those items into one value in the output.
SELECT  A.firstname AS 'SousChef A First', A.lastname AS 'SousChef A Last',
        B.firstname AS 'SousChef B First', B.lastname AS 'SousChef B Last',
        COUNT(B.menuItemName) AS '# of Shared Items', GROUP_CONCAT(A.menuItemName SEPARATOR ', ') AS "Menu Items"
    FROM 
        (SELECT * FROM FoodExpertise INNER JOIN Employee using (employeeID)) A
            INNER JOIN
        (SELECT * FROM FoodExpertise INNER JOIN Employee using (employeeID)) B
            ON A.menuItemName = B.menuItemName
    WHERE A.employeeID < B.employeeID
    GROUP BY A.employeeID, B.employeeID
    HAVING COUNT(B.menuItemName) >= 3;

--  5) Find the three menu items most often ordered from the Children’s menu and order them
--  from most frequently ordered to least frequently ordered.
SELECT menuItemName, COUNT(menuItemName) AS 'Number of times ordered'
    FROM orderDetails
        WHERE menuType = 'Children'
    GROUP BY menuItemName
    ORDER BY COUNT(menuItemName) DESC 
    LIMIT 3;

--  6) Show by week, how many hours each employee works.
SELECT WEEK(dateOfShift) Week, CONCAT(firstName, ' ', lastName) Name, SUM(hoursWorked) Hours
    FROM WorkSchedule
        INNER JOIN WorkShift USING (shiftID)
        INNER JOIN Employee USING (employeeID)
    GROUP BY WEEK(dateOfShift), employeeID
    ORDER BY WEEK ASC, lastName ASC;

--  7) List the customers, sorted by the amount of Miming’s Money that they have, from largest
--  to smallest.
SELECT DISTINCT CONCAT(firstName, ' ', lastName) Name
    FROM Known
    INNER JOIN Customer USING (customerID)
    ORDER BY creditBalance DESC;

--  8) List the customers and the total that they have spent at Miming’s ever, in descending
--  order by the amount that they have spent.
SELECT firstName First, lastName Last, orderTotal AS "Total Spent"
    FROM 
        (SELECT orderID, SUM((od.quantity * mi.basePrice) * m.menuPriceModifier) orderTotal
            FROM orderDetails od
                INNER JOIN MenuItem mi using (menuItemName)
                INNER JOIN Menu m using (menuType)
            GROUP BY orderID) totals
    INNER JOIN Known using (orderID)
    ORDER BY orderTotal DESC;

--  9) Report on the customers at Miming’s by the number of timesthat they come in by month
--  and order the report from most frequent to the least frequent. Each row in the output
--  should have the Customer name, the month, the year, and the number of times that
--  customer came in during that month of that year.
SELECT CONCAT(firstName, ' ', lastName) Name, Month(orderDate) Month, Year(orderDate) Year, Count(visits) Visits
    FROM
        (SELECT orderID, COUNT(orderID) Visits
            FROM Orders
            GROUP BY Year(orderDate), Month(orderDate), orderID)customerVisits
    INNER JOIN Known using(orderID)
    INNER JOIN Orders on Known.orderID = Orders.orderID
    GROUP BY YEAR(orderDate), Month(orderDate), lastName, firstName
    ORDER BY Visits DESC;

--  10) List the three customers who have spent the most at Miming’s over the past year (365
--  days). Order by the amount that they spent, from largest to smallest.
SELECT CONCAT(firstName, ' ', lastName) Name, orderTotal AS "Total Spent"
    FROM 
        (SELECT orderID, SUM((od.quantity * mi.basePrice) * m.menuPriceModifier) orderTotal
            FROM orderDetails od
                INNER JOIN MenuItem mi using (menuItemName)
                INNER JOIN Menu m using (menuType)
                INNER JOIN Orders o using (orderID)
            GROUP BY orderID, orderDate
            HAVING (((YEAR(now()) - YEAR(orderDate)) = 0) OR (((YEAR(now()) - YEAR(orderDate)) = 1) AND ((MONTH(now()) - MONTH(orderDate)) <= 0) AND ((DAY(now()) - DAY(orderDate)) <= 0)))) totals
    INNER JOIN Known using (orderID)
    ORDER BY orderTotal DESC
    LIMIT 3;

--  11) List the five menu items that have generated the most revenue for Miming’s over the past
--  year (365 days).
SELECT menuItemName AS "Menu Item", SUM(orderTotal) Profit
    FROM
        (SELECT mi.menuItemName, SUM((od.quantity * mi.basePrice) * m.menuPriceModifier) orderTotal
            FROM orderDetails od
                INNER JOIN MenuItem mi using (menuItemName)
                INNER JOIN Menu m using (menuType)
            GROUP BY orderID)profits
    INNER JOIN MenuItem using (menuItemName)
    GROUP BY menuItemName
    ORDER BY Profit DESC
    LIMIT 5;

--  12) Find the sous chef who is mentoring the most other sous chef. List the menu items that
--  the sous chef is passing along to the other sous chefs
SELECT CONCAT(firstName, ' ', lastName) Name, menuItemName AS "Menu Items Taught"
    FROM 
        (SELECT mentorID, COUNT(studentID) Mentees
            FROM SousMentorship
            GROUP BY mentorID
            ORDER BY Mentees DESC
            LIMIT 1)Mentorship
    INNER JOIN Employee ON mentorID = Employee.employeeID
    INNER JOIN FoodExpertise using (employeeID);

--  13) Find the three menu items that have the fewest sous chefs skilled in those menu items.
SELECT menuItemName, count(menuItemName) AS '# of Expert SousChefs'
FROM FoodExpertise
GROUP BY menuItemName
ORDER BY count(menuItemName)
LIMIT 3;

--  14) List all of the customers who eat at Miming’s on their own as well as ordering for their
--  corporation.
SELECT DISTINCT CONCAT(firstName, ' ', lastName) Name
    FROM Private
    INNER JOIN Corporation USING(customerID)
    INNER JOIN Known USING(customerID);

--  15) List the contents and prices of each of the menus.  
SELECT DISTINCT menuType Menu, menuItemName AS "Menu Item", basePrice Price
    FROM MenuItem
    INNER JOIN MenuItemSize USING (menuItemName)
    ORDER BY menuType, menuItemName;  




--  1. For Business Rule #1:
--  List the top 10 Dishwashers who washed the most dishes in one shift, how much they earned extra, 
--  and what shift it was. */  -- INCOMPLETE
SELECT A.employeeID, A.lastname, A.firstname, A.dateWorked, B.shiftType, A.dishesWashed
FROM
    (SELECT * empID, lastName, firstName, dateWorked, dishesWashed, extraDishMoney
    FROM Employee NATURAL JOIN Dishwasher NATURAL JOIN DishWasherBonus) AS A
    INNER JOIN
    (SELECT * FROM WorkSchedule NATURAL JOIN WorkShift) AS B
ON A.employeeID = B.employeeID AND A.dateWorked = B.dateOfShift
ORDER BY A.extraDishMoney DESC
LIMIT 10;

--  2. For Business Rule #2:
--  List all the orders and their totals before AND after the happy hour discount
--  is applied (if applicable). 

SELECT 
A.orderID, dayname(A.orderDate) AS 'Day of Order', A.orderDate, A.orderTime, A.happyHourDiscount, 
B.withoutHHDiscount AS 'Total w/o HH discount', A.total AS 'Total WITH HH discount'
FROM
    (SELECT * FROM Orders) AS A
    INNER JOIN
    (SELECT , sum(pricequantity) AS withoutHHDiscount
    FROM OrderDetails NATURAL JOIN MenuMenuItem
    GROUP BY orderID) AS B
ON A.orderID = B.orderID;


--Business Rule Queries
--

--  3. List the Employee of the month for each month throughout the history of the 
--  restaurant. Make sure to order by it by month and year from most the very first 
--  employee of the month to the latest.
SELECT month, year, employeeID, lastname, firstname, achievement
FROM EmployeeOfTheMonth NATURAL JOIN Employee
ORDER BY year, month;

--  5. Waiter Bonus: Customer service is a tiresome job and we wanna thank our friendly 
--  staff. Every month we select a waiter at random to get a bonus based on 15% of 
--  the tips they made for the current month.
SELECT CONCAT(e.lastName, ', ', e.firstName) AS Waiter, CONCAT('$', FORMAT(SUM(wt.tipAmount) * .15, 2)) AS Bonus
FROM Waiter w INNER JOIN WaiterTip wt USING(employeeID) INNER JOIN Employee e  USING(employeeID)
WHERE employeeID = FLOOR(RAND()*(17-13+1) + 13)
GROUP BY e.employeeID
LIMIT 1;

--  6. Dishwasher Bonus: Without them our plates will never be cleaned so that's why we
--  think our dishwashers deserve to get paid an extra $2 per washed plate AFTER 
--  150 washed plates. This count will reset after every shift. 
--  (Think of this as the restaurant tipping out its other employees besides 
--  the waiters)
SELECT CONCAT(e.lastName, ', ', e.firstName) AS Employee, CONCAT('$', FORMAT((d.dishesWashed - 100) * 2, 2)) AS Bonus
FROM Employee e INNER JOIN DishWasherBonus d USING(employeeID)
WHERE d.dishesWashed > 100;