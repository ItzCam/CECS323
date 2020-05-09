/* 1. Menuitem_v */
CREATE OR REPLACE VIEW cecs323sec07bg07.Menuitem_v AS
SELECT mi.menuItemName, mi.spiciness, ms.menuType, CASE ms.menuType
        WHEN 'Evening' THEN mi.basePrice
        WHEN 'Lunch' THEN mi.basePrice * .9
        WHEN 'Children' THEN mi.basePrice * .8
        ELSE 0
        END 'Price'
FROM MenuItem mi LEFT OUTER JOIN MenuItemSize ms USING (menuItemName)
ORDER BY mi.menuItemName;

/* 2. Customer_addresses_v */
CREATE OR REPLACE VIEW cecs323sec07bg07.Customer_addresses_v AS
SELECT c.customerID AS ID,  IF (C2.organizationName IS NULL, 'Individual', 'Corporate') AS Type, CONCAT(k.firstName, ' ', k.lastName) AS Name,
       c.creditBalance AS Balance, k.creditEarned AS Earned, k.DOB, k.email, k.address
FROM Customer c LEFT OUTER JOIN Corporation C2 on c.customerID = C2.customerID
                INNER JOIN Known k ON c.customerID = k.customerID;

/* 3. Sous_mentor_v */
CREATE OR REPLACE VIEW cecs323sec07bg07.Sous_mentor_v AS
SELECT CONCAT(e2.lastName, ', ', e2.firstName) AS Mentor, CONCAT(e1.lastName, ', ', e1.firstName) As Mentee, sc.level, sm.mentorshipStartDate AS Start
FROM Employee e1 INNER JOIN SousChef sc ON e1.employeeID = sc.employeeID
                 INNER JOIN SousMentorship sm ON sc.employeeID = sm.studentID
                 INNER JOIN SousChef m ON sm.mentorID = m.employeeID
                 INNER JOIN Employee e2 ON m.employeeID = e2.employeeID
ORDER BY e2.lastName, e2.firstName, e1.lastName, e1.firstName;

/* 4. Customer_Sales_v */
CREATE OR REPLACE VIEW cecs323sec07bg07.Customer_Sales_v AS
SELECT CONCAT(k.lastName, ', ', k.firstName) AS Customer, YEAR(o.orderDate) AS Year, SUM(it.Price * od.quantity) AS Amount
FROM Known k INNER JOIN Orders o USING(orderID) INNER JOIN orderDetails od USING (orderID)
             INNER JOIN (SELECT mi.menuItemName, mi.spiciness, ms.menuType, CASE ms.menuType
                                WHEN 'Evening' THEN mi.basePrice
                                WHEN 'Lunch' THEN mi.basePrice * .9
                                WHEN 'Children' THEN mi.basePrice * .8
                                ELSE 0
                                END 'Price'
                        FROM MenuItem mi LEFT OUTER JOIN MenuItemSize ms USING (menuItemName)
                        ORDER BY mi.menuItemName) it USING (menuItemName)
GROUP BY YEAR(o.orderDate), k.lastName, k.firstName;

/* 5. Customer_Value_v */
CREATE OR REPLACE VIEW cecs323sec07bg07.Customer_Value_v AS
SELECT CONCAT(k.lastName, ', ', k.firstName) AS Customer, o.orderDate, SUM(it.Price * od.quantity) AS Amount
FROM Known k INNER JOIN Orders o USING(orderID) INNER JOIN orderDetails od USING (orderID)
             INNER JOIN (SELECT mi.menuItemName, mi.spiciness, ms.menuType, CASE ms.menuType
                                WHEN 'Evening' THEN mi.basePrice
                                WHEN 'Lunch' THEN mi.basePrice * .9
                                WHEN 'Children' THEN mi.basePrice * .8
                                ELSE 0
                                END 'Price'
                        FROM MenuItem mi LEFT OUTER JOIN MenuItemSize ms USING (menuItemName)
                        ORDER BY mi.menuItemName) it USING (menuItemName)
WHERE o.orderDate > NOW() - INTERVAL 1 YEAR
GROUP BY YEAR(o.orderDate), k.lastName, k.firstName
ORDER BY SUM(it.Price * od.quantity) DESC;

-- Select Statements
SELECT *
FROM Menuitem_v;

SELECT *
FROM Customer_addresses_v;

SELECT *
FROM Sous_mentor_v;

SELECT *
FROM Customer_Sales_v;

SELECT *
FROM Customer_Value_v;

