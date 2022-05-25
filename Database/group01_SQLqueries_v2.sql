-- EXcute sql file:
    -- source full\path\to\sql\file.sql
    -- (try using / or \)

-- Create and select the database

CREATE DATABASE hotelAppleBees;
USE hotelApplebees;

-- Create tables with primary keys

CREATE TABLE guest_table(
    guestID INT PRIMARY KEY AUTO_INCREMENT,
    guestName VARCHAR(100),
    guestAddress VARCHAR(200),
    guestNIC VARCHAR(14),
    guestCountry VARCHAR(30),
    guestTelNo INT,
    guestEmail VARCHAR(100),
    guestRegDate DATE
) ENGINE = innodb;

CREATE TABLE employee_Table(
    empID INT PRIMARY KEY AUTO_INCREMENT,
    empName VARCHAR(100),
    empAddress VARCHAR(200),
    empNIC VARCHAR(12),
    empEmail VARCHAR(100),
    empTelNo INT,
    empDOB DATE,
    empGendr VARCHAR(6),
    empJoinDate DATE,
    empServYrs INT,
    empRole VARCHAR(10)
) ENGINE = innodb;

CREATE TABLE room_table(
    roomNo INT PRIMARY KEY,
    roomStatus BOOLEAN,
    roomBeds INT,
    roomType VARCHAR(8),
    roomCost DECIMAL(7, 2)
) ENGINE = innodb;

CREATE TABLE reservation_table(
    resrvID INT PRIMARY KEY AUTO_INCREMENT,
    guestID INT REFERENCES guest_table(guestID),
    roomNo INT REFERENCES room_table(roomNo),
    startDate Date,
    endDate Date,
    dayPeriod INT,
    guestCount INT
) ENGINE = innodb;

CREATE TABLE food_table (
    foodID INT PRIMARY KEY AUTO_INCREMENT,
    foodName VARCHAR(50),
    price INT,
    foodCount INT
) ENGINE = innodb;

CREATE TABLE restaurantBill_table(
    restBillID INT PRIMARY KEY AUTO_INCREMENT,
    resrvID INT REFERENCES reservation_table(resrvID),
    billDate DATETIME,
    empID INT REFERENCES employee_table(empID)
) ENGINE = innodb;

CREATE TABLE Food_details_table (
    restBillID INT REFERENCES restaurantBill_table(restBillID),
    foodID INT REFERENCES food_table(foodID),
    fCount INT
) ENGINE = innodb;

CREATE TABLE supplier_table (
    supID INT PRIMARY KEY AUTO_INCREMENT,
    supName VARCHAR(100),
    supAddress VARCHAR(200),
    supNIC VARCHAR(14),
    supEmail VARCHAR(100),
    supTelNo INT,
    supJoinDate DATE
) ENGINE = innodb;

CREATE TABLE payment_table(
    invoiceID INT PRIMARY KEY AUTO_INCREMENT,
    resrvID INT REFERENCES reservation_table(resrvID),
    empID INT REFERENCES employee_Table(empID),
    date_time DATETIME,
    roomCost DECIMAL(10,2),
    restaurantCost DECIMAL(10,2),
    grandTotal DECIMAL(12,2),
    cash DECIMAL(12,2),
    balance DECIMAL(12,2)
) ENGINE = innodb;

CREATE TABLE system_user_table (
    usename VARCHAR(30) PRIMARY KEY,
    userpassword VARCHAR(10),
    empID INT REFERENCES employee_Table(empID)
) ENGINE = innodb;

-- Update Auto increnents of primary keys and default values
ALTER TABLE employee_table AUTO_INCREMENT = 0;
ALTER TABLE guest_table AUTO_INCREMENT = 10000;
ALTER TABLE reservation_table AUTO_INCREMENT = 1000;
ALTER TABLE reservation_table ALTER roomNo SET DEFAULT 0;
ALTER TABLE restaurantBill_table AUTO_INCREMENT = 5000;
ALTER TABLE payment_table AUTO_INCREMENT = 50000;
ALTER TABLE supplier_table AUTO_INCREMENT = 100000;
ALTER TABLE food_table AUTO_INCREMENT = 1;

-- Add rooms for the room table
INSERT INTO room_table
VALUES(0, 1, 0, null, 0),
(1, 1, 1, 'single', 2000.0),
(2, 1, 1, 'single', 2000.0),
(3, 1, 1, 'single', 2000.0),
(4, 1, 1, 'single', 2000.0),
(5, 1, 1, 'single', 2000.0),
(6, 1, 1, 'single', 2000.0),
(7, 1, 1, 'single', 2000.0),
(8, 1, 1, 'single', 2000.0),
(9, 1, 1, 'single', 2000.0),
(10, 1, 1, 'single', 2000.0),
(11, 1, 1, 'single', 2000.0),
(12, 1, 1, 'single', 2000.0),
(13, 1, 1, 'single', 2000.0),
(14, 1, 1, 'single', 2000.0),
(15, 1, 1, 'single', 2000.0),
(16, 1, 1, 'single', 2000.0),
(17, 1, 1, 'single', 2000.0),
(18, 1, 1, 'single', 2000.0),
(19, 1, 1, 'single', 2000.0),
(20, 1, 1, 'single', 2000.0),
(21, 1, 1, 'double', 4500.0),
(22, 1, 1, 'double', 4500.0),
(23, 1, 1, 'double', 4500.0),
(24, 1, 1, 'double', 4500.0),
(25, 1, 1, 'double', 4500.0),
(26, 1, 1, 'double', 4500.0),
(27, 1, 1, 'double', 4500.0),
(28, 1, 1, 'double', 4500.0),
(29, 1, 1, 'double', 4500.0),
(30, 1, 1, 'double', 4500.0),
(31, 1, 1, 'double', 4500.0),
(32, 1, 1, 'double', 4500.0),
(33, 1, 1, 'double', 4500.0),
(34, 1, 1, 'double', 4500.0),
(35, 1, 1, 'double', 4500.0),
(36, 1, 1, 'double', 4500.0),
(37, 1, 1, 'double', 4500.0),
(38, 1, 1, 'double', 4500.0),
(39, 1, 1, 'double', 4500.0),
(40, 1, 1, 'double', 4500.0),
(41, 1, 1, 'double', 4500.0),
(42, 1, 1, 'double', 4500.0),
(43, 1, 1, 'double', 4500.0),
(44, 1, 1, 'double', 4500.0),
(45, 1, 1, 'double', 4500.0),
(46, 1, 1, 'double', 4500.0),
(47, 1, 1, 'double', 4500.0),
(48, 1, 1, 'double', 4500.0),
(49, 1, 1, 'double', 4500.0),
(50, 1, 1, 'double', 4500.0),
(51, 1, 1, 'double', 4500.0),
(52, 1, 1, 'double', 4500.0),
(53, 1, 1, 'double', 4500.0),
(54, 1, 1, 'double', 4500.0),
(55, 1, 1, 'double', 4500.0),
(56, 1, 1, 'double', 4500.0),
(57, 1, 1, 'double', 4500.0),
(58, 1, 1, 'double', 4500.0),
(59, 1, 1, 'double', 4500.0),
(60, 1, 1, 'double', 4500.0),
(61, 1, 2, 'family', 6000.0),
(62, 1, 2, 'family', 6000.0),
(63, 1, 2, 'family', 6000.0),
(64, 1, 2, 'family', 6000.0),
(65, 1, 2, 'family', 6000.0),
(66, 1, 2, 'family', 6000.0),
(67, 1, 2, 'family', 6000.0),
(68, 1, 2, 'family', 6000.0),
(69, 1, 2, 'family', 6000.0),
(70, 1, 2, 'family', 6000.0),
(71, 1, 2, 'family', 6000.0),
(72, 1, 2, 'family', 6000.0),
(73, 1, 2, 'family', 6000.0),
(74, 1, 2, 'family', 6000.0),
(75, 1, 2, 'family', 6000.0),
(76, 1, 2, 'family', 6000.0),
(77, 1, 2, 'family', 6000.0),
(78, 1, 2, 'family', 6000.0),
(79, 1, 2, 'family', 6000.0),
(80, 1, 2, 'family', 6000.0),
(81, 1, 3, 'family', 8500.0),
(82, 1, 3, 'family', 8500.0),
(83, 1, 3, 'family', 8500.0),
(84, 1, 3, 'family', 8500.0),
(85, 1, 3, 'family', 8500.0),
(86, 1, 3, 'family', 8500.0),
(87, 1, 3, 'family', 8500.0),
(88, 1, 3, 'family', 8500.0),
(89, 1, 3, 'family', 8500.0),
(90, 1, 3, 'family', 8500.0),
(91, 1, 3, 'family', 8500.0),
(92, 1, 3, 'family', 8500.0),
(93, 1, 3, 'family', 8500.0),
(94, 1, 3, 'family', 8500.0),
(95, 1, 3, 'family', 8500.0),
(96, 1, 3, 'family', 8500.0),
(97, 1, 3, 'family', 8500.0),
(98, 1, 3, 'family', 8500.0),
(99, 1, 3, 'family', 8500.0),
(100, 1, 3, 'family', 8500.0);

/* Stored procedures for add data into tables. */
-- Stored procedure to add data into employee table
DELIMITER //

CREATE PROCEDURE AddEmployee(IN empName VARCHAR(100), IN empAddress VARCHAR(200), IN nic VARCHAR(12), IN email VARCHAR(100), IN telephone INT, IN DOB DATE, IN gender VARCHAR(6), IN joinDate DATE, IN empRole VARCHAR(10))

BEGIN
    INSERT INTO employee_Table(empName, empAddress, empNIC, empEmail, empTelNo, empDOB, empGendr, empJoinDate, empRole)
    VALUES (empName, empAddress, nic, email, telephone, DOB, gender, joinDate, empRole);

END//

DELIMITER ;

-- Stored procedure to add data into guest table
DELIMITER //

CREATE PROCEDURE AddGuest(IN gName VARCHAR(100), IN gAddress VARCHAR(200), IN nic VARCHAR(12), IN country VARCHAR(30), IN telephone INT, IN email VARCHAR(100), IN regDate DATE)

BEGIN
    INSERT INTO guest_Table(guestName, guestAddress, guestNIC, guestCountry, guestTelNo, guestEmail, guestRegDate)
    VALUES (gName, gAddress, nic, country, telephone, email, regDate);

END//

DELIMITER ;

-- Stored procedure to add data into supplier table
DELIMITER //

CREATE PROCEDURE AddSupplier(IN sName VARCHAR(100), IN sAddress VARCHAR(200), IN nic VARCHAR(12), IN email VARCHAR(100), IN telephone INT, IN joinDate DATE)

BEGIN
    INSERT INTO supplier_Table(supName, supAddress, supNIC, supEmail, supTelNo, supJoinDate)
    VALUES (sName, sAddress, nic, email, telephone, joinDate);
END//

DELIMITER ;

-- Stored procedure to add data into system users table
DELIMITER //

CREATE PROCEDURE AddUser(IN userName VARCHAR(30), IN userPassword VARCHAR(10), IN employeeID INT)
BEGIN
    INSERT INTO system_user_table
    VALUES (userName, userPassword, employeeID);
END//

DELIMITER ;

/* Stored procedures for Update data in the tables. */

-- Stored procedure to update employee table
DELIMITER //

CREATE PROCEDURE UpdateEmployee(IN updateID INT, IN eName VARCHAR(100), IN eAddress VARCHAR(200), IN nic VARCHAR(12), IN email VARCHAR(100), IN telephone INT, IN DOB DATE, IN gender VARCHAR(6), IN joinDate DATE, IN eRole VARCHAR(10))
BEGIN
    UPDATE employee_Table
    SET empName = eName, empAddress = eAddress, empNIC = nic, empEmail = email, empTelNo = telephone, empDOB = DOB, empGendr = gender, empJoinDate = joinDate, empRole = eRole
    WHERE empID = updateID;
END//

DELIMITER ;

-- Stored procedure to update guest table
DELIMITER //

CREATE PROCEDURE UpdateGuest(IN updateID INT, IN gName VARCHAR(100), IN gAddress VARCHAR(200), IN gnic VARCHAR(14), IN country VARCHAR(30), IN telephone INT, IN email VARCHAR(100), IN regDate DATE)
BEGIN
    UPDATE guest_table
    SET guestName = gName, guestAddress = gAddress, guestNIC = gnic, guestCountry = country, guestEmail = email, guestTelNo = telephone, guestRegDate = regDate
    WHERE guestID = updateID;
END//

DELIMITER ;

-- Stored procedure to update supplier table
DELIMITER //

CREATE PROCEDURE UpdateSuplier(IN updateID INT, IN sName VARCHAR(100), IN sAddress VARCHAR(200), IN snic VARCHAR(14), IN email VARCHAR(100), IN telephone INT, IN joinDate DATE)
BEGIN
    UPDATE supplier_table
    SET supName = sName, supAddress = sAddress, supNIC = snic, supEmail = email, supTelNo = telephone, supJoinDate = joinDate
    WHERE supID = updateID;
END//

DELIMITER ;

-- Update system user details
DELIMITER //

CREATE PROCEDURE updateUser(IN employeeID INT, IN newUserName VARCHAR(30), IN newPassword VARCHAR(10))
BEGIN
    UPDATE system_user_table
    SET usename = newUserName, userpassword = newPassword
    WHERE empID = employeeID;
END//

DELIMITER ;

/* Stored procedures for Delete a row in the tables. */

-- Stored procedure to delete a row in employee table
DELIMITER //

CREATE PROCEDURE DeleteEmployee(IN deleteID INT)
BEGIN
    DELETE FROM employee_Table
    WHERE empID = deleteID;
END//

DELIMITER ;

-- Stored procedure to delete a row in guest table
DELIMITER //

CREATE PROCEDURE DeleteGuest(IN deleteID INT)
BEGIN
    DELETE FROM guest_Table
    WHERE guestID = deleteID;
END//

DELIMITER ;

-- Stored procedure to delete a row in supplier table
DELIMITER //

CREATE PROCEDURE DeleteSupplier(IN deleteID INT)
BEGIN
    DELETE FROM supplier_Table
    WHERE supID = deleteID;
END//

DELIMITER ;

/* Stored procedures for Search in the tables. */

-- Stored procedure to search employee
DELIMITER //

CREATE PROCEDURE SearchEmployee(IN search VARCHAR(100))

BEGIN
DECLARE nicCount INT;
DECLARE teleCount INT;
DECLARE IDcount INT;
DECLARE searchNumber INT;

    SELECT COUNT(*) FROM employee_Table WHERE employee_Table.empNIC = search INTO nicCount;
    SELECT CAST(search AS SIGNED) INTO searchNumber;
    SELECT COUNT(*) FROM employee_Table WHERE employee_Table.empTelNo = searchNumber INTO teleCount;
    SELECT COUNT(*) FROM employee_Table WHERE employee_Table.empID = searchNumber INTO IDcount;

    IF IDcount > 0 THEN
        SELECT * FROM employee_Table WHERE employee_Table.empID = searchNumber;
    ELSEIF nicCount > 0 THEN
        SELECT * FROM employee_Table WHERE employee_Table.empNIC = search;
    ELSEIF teleCount > 0 THEN
        SELECT * FROM employee_Table WHERE employee_Table.empTelNo = searchNumber;
    ELSE
        SELECT * FROM employee_Table WHERE employee_Table.empName = NULL;
    END IF;

END//

DELIMITER ;

-- Stored procedure to search guest
DELIMITER //

CREATE PROCEDURE SearchGuest(IN search VARCHAR(100))

BEGIN
DECLARE nicCount INT;
DECLARE teleCount INT;
DECLARE emailCount INT;
DECLARE searchNumber INT;
DECLARE IDcount INT;

    SELECT CAST(search AS SIGNED) INTO searchNumber;

    SELECT COUNT(*) FROM guest_table WHERE guest_table.guestID = searchNumber INTO IDcount;
    SELECT COUNT(*) FROM guest_table WHERE guest_table.guestNIC = search INTO nicCount;
    SELECT COUNT(*) FROM guest_table WHERE guest_table.guestTelNo = searchNumber INTO teleCount;
    SELECT COUNT(*) FROM guest_table WHERE guest_table.guestEmail = search INTO emailCount;

    IF IDcount > 0 THEN
        SELECT * FROM guest_table WHERE guest_table.guestID = searchNumber;
    ELSEIF nicCount > 0 THEN
        SELECT * FROM guest_table WHERE guest_table.guestNIC = search;
    ELSEIF teleCount > 0 THEN
        SELECT * FROM guest_table WHERE guest_table.guestTelNo = searchNumber;
    ELSEIF emailCount > 0 THEN
        SELECT * FROM guest_table WHERE guest_table.guestEmail = search;
    ELSE
        SELECT * FROM guest_table WHERE guest_table.guestName = NULL;
    END IF;

END//

DELIMITER ;

-- Stored procedure to search supplier
DELIMITER //

CREATE PROCEDURE SearchSupplier(IN search VARCHAR(100))

BEGIN
DECLARE nicCount INT;
DECLARE teleCount INT;
DECLARE IDcount INT;
DECLARE searchNumber INT;

    SELECT COUNT(*) FROM supplier_Table WHERE supplier_Table.supNIC = search INTO nicCount;
    SELECT CAST(search AS SIGNED) INTO searchNumber;
    SELECT COUNT(*) FROM supplier_Table WHERE supplier_Table.supTelNo = searchNumber INTO teleCount;
    SELECT COUNT(*) FROM supplier_Table WHERE supplier_Table.supID = searchNumber INTO IDcount;

    IF IDcount > 0 THEN
        SELECT * FROM supplier_Table WHERE supplier_Table.supID = searchNumber;
    ELSEIF nicCount > 0 THEN
        SELECT * FROM supplier_Table WHERE supplier_Table.supNIC = search;
    ELSEIF teleCount > 0 THEN
        SELECT * FROM supplier_Table WHERE supplier_Table.supTelNo = searchNumber;
    ELSE
        SELECT * FROM supplier_Table WHERE supplier_Table.supNIC = NULL;
    END IF;

END//

DELIMITER ;

-- Stored Procedure to make a reservation when needed
DELIMITER //

CREATE PROCEDURE MakeReservation(IN guestID INT, IN roomNUmber INT, IN startDate DATE, IN endDate DATE, IN count INT)

BEGIN

    DECLARE diff INT;

    SET diff = DATEDIFF(endDate, startDate);

    INSERT INTO reservation_table(guestID, roomNo, startDate, endDate, dayPeriod, guestCount)
    VALUES (guestID, roomNUmber, startDate, endDate, diff, count);

    UPDATE room_table SET roomStatus = 0 WHERE room_table.roomNo = roomNUmber;
END//

DELIMITER ;

-- Get reservation ID when needed if guest data known
DELIMITER //

CREATE PROCEDURE GetReservationID(IN search VARCHAR(100))

BEGIN
DECLARE nicCount INT;
DECLARE teleCount INT;
DECLARE emailCount INT;
DECLARE searchNumber INT;
DECLARE IDcount INT;
DECLARE gID INT;

    SELECT CAST(search AS SIGNED) INTO searchNumber;

    SELECT COUNT(*) FROM guest_table WHERE guest_table.guestID = searchNumber INTO IDcount;
    SELECT COUNT(*) FROM guest_table WHERE guest_table.guestNIC = search INTO nicCount;
    SELECT COUNT(*) FROM guest_table WHERE guest_table.guestTelNo = searchNumber INTO teleCount;
    SELECT COUNT(*) FROM guest_table WHERE guest_table.guestEmail = search INTO emailCount;

    IF IDcount > 0 THEN
        SELECT guestID FROM guest_table WHERE guest_table.guestID = searchNumber INTO gID;
    ELSEIF nicCount > 0 THEN
        SELECT guestID FROM guest_table WHERE guest_table.guestNIC = search INTO gID;
    ELSEIF teleCount > 0 THEN
        SELECT guestID FROM guest_table WHERE guest_table.guestTelNo = searchNumber INTO gID;
    ELSEIF emailCount > 0 THEN
        SELECT guestID FROM guest_table WHERE guest_table.guestEmail = search INTO gID;
    ELSE
        SELECT * FROM guest_table WHERE guest_table.guestName = NULL;
    END IF;

    SELECT MAX(resrvID) FROM reservation_table WHERE guestID = gID;

END//

DELIMITER ;


-- Make restaurant bill
DELIMITER //

CREATE PROCEDURE RestaurantBill(IN resrvationID INT, IN BillDate DATETIME, IN employeeID INT)

BEGIN
    INSERT INTO restaurantbill_table(resrvID, billDate, empID)
    VALUES (resrvationID, BillDate, employeeID);

    SELECT MAX(restBillID) AS billNo FROM restaurantbill_table WHERE resrvID = resrvationID;
END//

DELIMITER ;


--  Stored Procedure to add food details into food_details_table
DELIMITER //

CREATE PROCEDURE Food(IN billID INT, IN foodId INT, IN mycount INT)

BEGIN
    INSERT INTO food_details_table(restBillID, foodID, fCount)
    VALUES (billID, foodID, mycount);
END//

DELIMITER ;

-- get food and food details with known reservation ID
DELIMITER //

CREATE PROCEDURE GetFoodBills(IN num INT)

BEGIN

SELECT RB.billDate, FD.foodID, FT.foodName, FT.price AS UnitPrice, FD.fCount AS foodCount, (FT.price * FD.fCount) AS Total
FROM food_details_table FD, food_table FT, restaurantbill_table RB
WHERE FD.restBillID IN 
    (SELECT restBillID 
    FROM restaurantbill_table 
    WHERE resrvID = num)
AND FT.foodID = FD.foodID
AND RB.restBillID = FD.restBillID;

END//

DELIMITER ;

-- get room details with known reservation ID
DELIMITER //

CREATE PROCEDURE GetRoomBill(IN num INT)

BEGIN

SELECT RS.roomNo, RM.roomType, RS.startDate, RS.dayPeriod, RM.roomCost, (RS.dayPeriod * RM.roomCost) AS totalRoomCost
FROM reservation_table RS, room_table RM
WHERE RS.resrvID = num AND RS.roomNo = RM.roomNo;

END//

DELIMITER ;


-- Stored Procedure for get next invoice ID 
DELIMITER //

CREATE PROCEDURE GetInvoiceNo()

BEGIN
DECLARE billCount INT;
SELECT COUNT(*) FROM payment_table WHERE invoiceID IS NOT NULL INTO billCount;

IF billCount > 0 THEN
    SELECT MAX(invoiceID) + 1 AS invoiceNumber FROM payment_table;
ELSEIF billCount < 1 THEN
    SELECT 50001 AS invoiceNumber;
ELSE
    SELECT * FROM payment_table WHERE payment_table.resrvID = NULL;
END IF;

END//

DELIMITER ;

-- Stored procedure for make final bill payment when checkout
DELIMITER //

CREATE PROCEDURE Payment(IN reservationID INT, IN employeeID INT, IN paymentDate DATETIME, IN totalRoomCost DECIMAL, IN totalRestaurantCost DECIMAL, IN total DECIMAL, IN givenCash DECIMAL, IN returnBalance DECIMAL)

BEGIN

    INSERT INTO payment_table(resrvID, empID, date_time, roomCost, restaurantCost, grandTotal, cash, balance)
    VALUES (reservationID, employeeID, paymentDate, totalRoomCost, totalRestaurantCost, total, givenCash, returnBalance);

END//

DELIMITER ;


/* TRIGGERS */

-- trigger to make the reserved room status to 0 (occupied)
DELIMITER //

CREATE TRIGGER OccupyRoom
AFTER INSERT ON reservation_table FOR EACH ROW

BEGIN
    DECLARE room INT;
    SET room = (SELECT roomNo FROM reservation_table WHERE resrvID = NEW.resrvID);
    IF room > 0 THEN
        UPDATE room_table SET roomStatus = 0 WHERE room_table.roomNo = room;
    END IF;

END//

DELIMITER ;

-- Unoccupy a room when a final payment is done
DELIMITER //

CREATE TRIGGER ClearRoom
AFTER INSERT ON payment_table FOR EACH ROW

BEGIN
    DECLARE room INT;
    SET room = (SELECT roomNo FROM reservation_table WHERE resrvID = NEW.resrvID);
    IF room > 0 THEN
        UPDATE room_table SET roomStatus = 1 WHERE room_table.roomNo = room;
    END IF;

END//

DELIMITER ;

-- Trigger for reduce food Count from food table when guest get food
DELIMITER //

CREATE TRIGGER Reduce_Food_Count
AFTER INSERT ON food_details_table FOR EACH ROW

BEGIN
    DECLARE myCount INT;
    SET myCount = (SELECT fCount FROM food_details_table WHERE (foodID = NEW.foodID) AND (restBillID = NEW.restBillID));
    IF myCount > 0 THEN
        UPDATE food_table SET foodCount = foodCount - myCount WHERE food_table.foodID = new.foodID;
    END IF;

END//

DELIMITER ;



/* Data insertion */

-- Employee table. Using stored procedure
CALL AddEmployee(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL AddEmployee('Anushanga Pvavith', 'B/35,Seeduwa,Negambo.', '994203996V', 'anushangapvavith@gmail.com', 0704210384, '1999-10-08', 'Male', '2015-1-16', 'admin');
CALL AddEmployee('Chamara Dilshan', 'A/28/5,Daluwalana,Waharaka.', '995298126V', 'chamaradilshan@gmail.com', 0738269172, '1999-10-22', 'Male', '2014-4-16', 'admin');
CALL AddEmployee('Didula Induwara', 'No.69,Angoda,Mulleriyawa.', '998866747', 'didulainduwara@gmail.com', 0763818461, '1999-02-14', 'Male', '2011-4-12', 'admin');
CALL AddEmployee('Sanduni Sudeshika', 'No.101,Delgoda,Weliweriya.', '905631563V', 'sandunisudeshika@gmail.com', 0756580057, '1990-03-17', 'Female', '2017-6-13', 'reception');
CALL AddEmployee('Asini Senara', 'No.25,Hospital Rd,Homagama.', '985940112V', 'asinisenara@gmail.com', 0737938314, '1998-06-22', 'Female', '2014-6-18', 'reception');
CALL AddEmployee('Dinith Mayadunna', 'No.1,Kandy Rd,Balummahara.', '752335241V', 'dinithmayadunna@gmail.com', 0768876188, '1975-08-03', 'Male', '2012-6-24', 'reception');
CALL AddEmployee('Vidura Madusanka', 'No.36,Main Rd, Borella.', '804138002V', 'viduramadusanka@gmail.com', 0737564868, '1980-04-06', 'Male', '2010-6-23', 'restaurnt');
CALL AddEmployee('Thimira Dilshan', 'B/44,Kandy Rd, Kiribathgoda.', '20006471463', 'thimiradilshan@gmail.com', 0726251283, '2000-08-28', 'Male', '2018-5-19', 'restaurnt');
CALL AddEmployee('Tharusha Kumara', 'Padaviya,Anuradhapura.', '20045577684', 'tharushakumara@gmail.com', 0717864503, '2004-09-12', 'Male', '2014-7-19', 'restaurnt');
CALL AddEmployee('Pasindu Rajapksha', 'No.125, Delgoda, Pugoda.', '992042347V', 'pasindurajapksha@gmail.com', 0739892677, '1999-03-15', 'Male', '2016-7-17', 'reception');
CALL AddEmployee('Harindu Munathanthri', 'A/20/156,Pinketha Rd,Homagama.', '970409962V', 'harindumunathanthri@gmail.com', 0779802280, '1997-11-14', 'Male', '2017-1-3', 'reception');
CALL AddEmployee('Heshan Changa', 'Kaluthara Town,Kaluthara.', '960583179V', 'heshanchanga@gmail.com', 0726284724, '1996-05-19', 'Male', '2014-10-7', 'reception');
CALL AddEmployee('Nimuthu Wijerathna', 'No.64,Peradeniya,Kandy.', '928573811V', 'nimuthuwijerathna@gmail.com', 0779116939, '1992-10-11', 'Female', '2009-1-24', 'restaurnt');
CALL AddEmployee('Sakuni Nimnadi', 'A/21 Rd,Thabbowa,Puththalama.', '781434801V', 'sakuninimnadi@gmail.com', 0783589202, '1978-08-01', 'Female', '2017-1-18', 'admin');
CALL AddEmployee('Sahan Kithmal', 'No.2,Panideniya Junction,Peradeniya.', '905486386V', 'sahankithmal@gmail.com', 0738042235, '1990-09-04', 'Male', '2018-7-8', 'reception');
CALL AddEmployee('Piyumali Sandunika', 'No.11,Kandy Rd,Kegalle.', '931032926V', 'piyumalisandunika@gmail.com', 0761801756, '1993-11-06', 'Female', '2010-6-5', 'reception');
CALL AddEmployee('Chamudi Jayasumana', 'A/35/68,Gampola Rd,Mawanella.', '991965903V', 'chamudijayasumana@gmail.com', 0732575987, '1999-01-16', 'Female', '2017-2-15', 'restaurnt');
CALL AddEmployee('Gevindu Peris', 'Main Rd,Mirigama,Kurunegala.', '992718378V', 'gevinduperis@gmail.com', 0721453314, '1999-04-25', 'Male', '2018-10-4', 'restaurnt');
CALL AddEmployee('Nimesh Senanayake', 'C/12/456,New Rd,Malabe.', '885468634V', 'nimeshsenanayake@gmail.com', 0735407360, '1988-12-30', 'Male', '2014-8-13', 'reception');
CALL AddEmployee('Chathuni Fernando', 'No.156,Yakkala,Gampaha.', '995928514V', 'chathunifernando@gmail.com', 0732417819, '1999-10-31', 'Female', '2015-2-2', 'reception');

-- Add system users to the system
CALL AddUser('user', 'user', 0);
CALL AddUser('admin', '123', 1);
CALL AddUser('chamara', 'char123', 2);
CALL AddUser('didula', 'did123', 3);
CALL AddUser('pasindu', 'pas321', 10);
CALL AddUser('sakuni', 'sak456', 14);
CALL AddUser('piyumali', 'piyu147', 16);
CALL AddUser('rest', '1234', 17);
CALL AddUser('recep', '0123', 5);
CALL AddUser('recep2', 'r123', 19);
CALL AddUser('nimuthu', 'nimu', 13);
CALL AddUser('thimira', 'thimira123', 8);
CALL AddUser('sahanK', 'sahan97', 15);
CALL AddUser('gevindu', 'gevindu12', 18);
CALL AddUser('admin2', '01234', 11);
CALL AddUser('chathuni', 'chathu147', 20);
CALL AddUser('sanduni', 'sanduni123', 4);
CALL AddUser('dinith', '0123', 6);
CALL AddUser('vidura', 'r123', 7);
CALL AddUser('tharusha', 'nimu', 9);
CALL AddUser('changa', '0123', 12);


-- Insert data into food table 
INSERT INTO food_table (foodName, price, foodCount)
VALUES ('Chicken Rice', 600, 20),
('Rice & Curry', 500, 30),
('Sea food rice', 700, 30),
('Noodles', 550, 25),
('Pasta', 800, 30),
('Koththu', 800, 20),
('Caramel Pudding', 150, 20),
('Strawbery Pudding', 250, 15),
('Ice-Cream', 200, 20),
('Oreo Brownie', 250, 25),
('Cup Cake', 150, 25),
('Lava Cake', 250, 30),
('Cofee', 150, 100),
('Milk Tea', 150, 100),
('Cappuchino', 200, 100),
('Tea', 100, 100),
('Green Tea', 200, 50),
('Lemon Tea', 250, 50),
('Coca-Cola', 200, 90),
('Sprite', 200, 90),
('Pepsi', 150, 90),
('Chocolate Milk Shake', 250, 50),
('Falooda', 250, 50),
('Lemon Juice', 150, 100),
('Mango Juice', 180, 100),
('Avacado Juice', 200, 50),
('Apple Juice', 300, 50),
('Grape Juice', 300, 60);

-- Guest table. Using stored procedure
CALL AddGuest(NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL AddGuest('Sandaruwan Amarasinghe', 'B110,Galenbindunuwewa,Anuradhapura.', '879259883V', 'Sri Lanka', 0763336744, 'SandaruwanAmarasinghe@gmail.com', '2021-3-11');
CALL AddGuest('Otis Graham', '6525 W Sack Dr #306, Glendale, Arkansas.', '315542763', 'USA', 0785123521, 'OtisGraham@gmail.com', '2021-11-27');
CALL AddGuest('Chathura Fonseca', 'B90,Karagahawewa,Anuradhapura.', '757460837V', 'Sri Lanka', 0771675711, 'ChathuraFonseca@gmail.com', '2021-11-16');
CALL AddGuest('Rathnayaka Sirisena', 'B64,Mahananneriya,Kurunegala.', '582072854V', 'Sri Lanka', 0764795618, 'RathnayakaSirisena@gmail.com', '2020-2-11');
CALL AddGuest('Vaishali Srinivasan', 'M 59 2nd Floor Part 2, Delhi, Delhi,110024.', '662823833', 'India', 0771389470, 'VaishaliSrinivasan@gmail.com', '2021-6-13');
CALL AddGuest('Manpreet Rastogi', 'By Appointment, Kannur, Kerala.', '500589911', 'India', 0763125522, 'ManpreetRastogi@gmail.com', '2020-8-16');
CALL AddGuest('Kapila Kalupahana', 'B153,Kahatagollewa,Anuradhapura. ', '631981192V', 'Sri Lanka', 0747742354, 'KapilaKalupahana@gmail.com', '2021-3-4');
CALL AddGuest('Sandali Jothipala', 'B124,Gomagoda,Kandy.', '777284250V', 'Sri Lanka', 0780007628, 'SandaliJothipala@gmail.com', '2021-3-12');
CALL AddGuest('Nuveena Bandaranaike', 'B59,Giritale,Polonnaruwa.', '534781053V', 'Sri Lanka', 0712298684, 'NuveenaBandaranaike@gmail.com', '2020-1-26');
CALL AddGuest('Mohit Dua', '67  Shah Indl Est Road Deonar, Mumbai.', '194835758', 'India', 0746918293, 'MohitDua@gmail.com', '2021-1-12');
CALL AddGuest('Nayomi Cooray', 'B34,Handaganawa,Kandy.', '767656452V', 'Sri Lanka', 0743273151, 'NayomiCooray@gmail.com', '2021-7-19');
CALL AddGuest('Abesekara Jinavamsa', 'B94,Hataraliyadda,Kandy.', '521378948V', 'Sri Lanka', 0728021595, 'AbesekaraJinavamsa@gmail.com', '2020-1-8');
CALL AddGuest('Kobiraj Kumaranatunga', 'B44,Sirisetagama,Kurunegala.', '774487854V', 'Sri Lanka', 0732860181, 'KobirajKumaranatunga@gmail.com', '2020-4-19');
CALL AddGuest('Dhanuka Jayewardene', 'B10,Barawardhana Oya,Kandy.', '509746054V', 'Sri Lanka', 0721103797, 'DhanukaJayewardene@gmail.com', '2020-8-13');
CALL AddGuest('Okabe Kaede', 'Toyama Ken Toyama Fuchumachi Yoshizumi No. 10-6.', '686371818', 'Japan', 0780241944, 'OkabeKaede@gmail.com', '2020-4-1');
CALL AddGuest('Holly Watson', '7 Carlisle Street, Sheans Creek, Victoria.', '469095936', 'Australia', 0747810520, 'HollyWatson@gmail.com', '2021-5-8');
CALL AddGuest('Gerard Davis', '45620 Jeronimo St, Temecula, California 92592.', '650126409', 'USA', 0731929154, 'GerardDavis@gmail.com', '2021-4-2');
CALL AddGuest('Dishantha Jayatilleke', 'B71,Kakkapalliya,Puttalam.', '882079205V', 'Sri Lanka', 0714560500, 'DishanthaJayatilleke@gmail.com', '2020-11-7');
CALL AddGuest('Iroshika Jayaweera', 'B141,Gnanikulama,Anuradhapura.', '842716252V', 'Sri Lanka', 0706860160, 'IroshikaJayaweera@gmail.com', '2020-2-18');
CALL AddGuest('Imashini Gooneratne', 'B134,Alutnuwara,Kegalle.', '797442638V', 'Sri Lanka', 0748573923, 'ImashiniGooneratne@gmail.com', '2021-2-14');
CALL AddGuest('Nirmala Vijaya', 'B170,Ekiriya,Kandy.', '739887842V', 'Sri Lanka', 0704812036, 'NirmalaVijaya@gmail.com', '2020-2-1');
CALL AddGuest('Ruklanthi Nanananda', 'B129,Diddeniya,Kurunegala.', '618290082V', 'Sri Lanka', 0731727270, 'RuklanthiNanananda@gmail.com', '2021-8-12');
CALL AddGuest('Ayesh Weerakoon', 'B58,Sunandapura,Kurunegala.', '747779384V', 'Sri Lanka', 0707586508, 'AyeshWeerakoon@gmail.com', '2021-1-4');
CALL AddGuest('Arima Tomiko', 'Miyagi Ken Tomeshi and Yosato Clove No. 19-20.', '176602143', 'Japan', 0745930718, 'ArimaTomiko@gmail.com', '2021-5-14');
CALL AddGuest('Shi Zhou', 'F201, Xi an Park, No. 68 Keji 2nd Road, Xi an City.', '541504957', 'China', 0768914660, 'ShiZhou@gmail.com', '2021-3-23');

-- Supplier table. Using stored procedure
CALL AddSupplier(NULL, NULL, NULL, NULL, NULL, NULL);
CALL AddSupplier('Vijay Weerakoon', 'Cedar Avenue, Colombo 12.', '775289666V', 'vijayweerakoon@gmail.com', 0733117508, '2015-4-26');
CALL AddSupplier('Srimal Kularatne', 'Williams Street, Moratuwa.', '724412402V', 'srimalkularatne@gmail.com', 0758160042, '2016-2-25');
CALL AddSupplier('Gajanayake Moonesinghe', 'Arlington Avenue, Colombo 10.', '792034107V', 'gajanayakemoonesinghe@gmail.com', 0741699382, '2015-2-3');
CALL AddSupplier('Jayawickrama Attygale', 'River Street,Nugegoda.', '884984027V', 'jayawickramaattygale@gmail.com', 0737772143, '2012-11-19');
CALL AddSupplier('Ranaweera Dodangoda', 'Arlington Avenue,Negombo.', '703215762V', 'ranaweeradodangoda@gmail.com', 0775903081, '2011-6-25');
CALL AddSupplier('Kithmal Weeraratne', 'Route 1,Nugegoda.', '851331967V', 'kithmalweeraratne@gmail.com', 0762848320, '2017-8-15');
CALL AddSupplier('Neville Goonesena', 'Atlantic Avenue,Negombo.', '808575890V', 'nevillegoonesena@gmail.com', 0706328620, '2012-9-6');
CALL AddSupplier('Harendra Kannangara', 'King Street,Galle.', '839696274V', 'harendrakannangara@gmail.com', 0776247696, '2011-7-18');
CALL AddSupplier('Lasitha Nanarama', 'Grand Avenue, Colombo 10.', '819052158V', 'lasithananarama@gmail.com', 0734708233, '2017-6-9');
CALL AddSupplier('Ranathunga Wimaladharma', 'Franklin Court,Dehiwala.', '900833630V', 'ranathungawimaladharma@gmail.com', 0715635098, '2015-4-18');
CALL AddSupplier('Maheshika Hemantha', 'Woodland Drive,Dehiwala.', '899854794V', 'maheshikahemantha@gmail.com', 0764833410, '2012-8-5');
CALL AddSupplier('Madumali Iriyagolla', 'Clay Street, Colombo 10.', '732174601V', 'madumaliiriyagolla@gmail.com', 0739380023, '2013-6-11');
CALL AddSupplier('Ruklanthi Devenampiyatissa', 'Maiden Lane,Gampaha.', '897632442V', 'ruklanthidevenampiyatissa@gmail.com', 0732336329, '2010-9-10');
CALL AddSupplier('Bimali Anula', 'Atlantic Avenue, Colombo 12.', '870437918V', 'bimalianula@gmail.com', 0710082792, '2010-9-7');
CALL AddSupplier('Dishantha Mahanama', 'Maiden Lane,Gampaha.', '762150414V', 'dishanthamahanama@gmail.com', 0785543674, '2014-4-9');
CALL AddSupplier('Kalinga Sirisena', 'Briarwood Drive,Gampaha.', '777935516V', 'kalingasirisena@gmail.com', 0770637275, '2018-6-25');
CALL AddSupplier('Viranthi Fonseca', 'Court Street, Colombo 10.', '728330314V', 'viranthifonseca@gmail.com', 0740576155, '2012-2-26');
CALL AddSupplier('Liyangani Ranwala', 'Essex Court,Galle.', '707555301V', 'liyanganiranwala@gmail.com', 0719212192, '2014-8-21');
CALL AddSupplier('Lakmih Wijewardene', 'Hanover Court, Moratuwa.', '762303401V', 'lakmihwijewardene@gmail.com', 0760252075, '2014-4-11');
CALL AddSupplier('Navarathna Dissanayake', 'Laurel Drive, Colombo 10.', '854152494V', 'navarathnadissanayake@gmail.com', 0734573069, '2017-4-21');
CALL AddSupplier('Upul Balasuriya', 'Madison Avenue,Negombo.', '816940554V', 'upulbalasuriya@gmail.com', 0709270361, '2017-1-12');
CALL AddSupplier('Eranga Fonseka', 'Williams Street,Nugegoda.', '733230808V', 'erangafonseka@gmail.com', 0755904744, '2018-7-11');
CALL AddSupplier('Kavimal Gunaratne', 'Franklin Court, Colombo 12.', '763863861V', 'kavimalgunaratne@gmail.com', 0754016757, '2012-10-26');
CALL AddSupplier('Wardhana Kobbekaduwa', 'Charles Street, Moratuwa.', '759573730V', 'wardhanakobbekaduwa@gmail.com', 0715786655, '2018-6-1');
CALL AddSupplier('Mithuro Bandara', 'Jefferson Avenue,Galle.', '739598056V', 'mithurobandara@gmail.com', 0720882594, '2016-2-8');
CALL AddSupplier('Malintha Gunapala', 'Devon Court, Colombo 12.', '821770434V', 'malinthagunapala@gmail.com', 0774894877, '2017-8-7');
CALL AddSupplier('Chathurani Herath', 'Charles Street,Dehiwala.', '896728727V', 'chathuraniherath@gmail.com', 0772766411, '2016-8-18');

-- Insert data into reservation_table
CALL MakeReservation(NULL, NULL, NULL, NULL, NULL);
CALL MakeReservation(10001, 46, '2021-3-11', '2021-3-16', 2);
CALL MakeReservation(10002, 39, '2021-11-27', '2021-12-01', 2);
CALL MakeReservation(10003, 17, '2021-11-16', '2021-11-29', 1);
CALL MakeReservation(10004, 71, '2020-2-11', '2020-2-24', 4);
CALL MakeReservation(10005, 86, '2021-6-13', '2021-6-29', 5);
CALL MakeReservation(10006, 46, '2020-8-16', '2020-8-30', 2);
CALL MakeReservation(10007, 20, '2021-3-4', '2021-3-6', 1);
CALL MakeReservation(10008, 88, '2021-3-12', '2021-3-30', 5);
CALL MakeReservation(10009, 71, '2020-1-26', '2020-1-31', 4);
CALL MakeReservation(10010, 27, '2021-1-12', '2021-1-21', 2);
CALL MakeReservation(10011, 79, '2021-7-19', '2021-7-21', 4);
CALL MakeReservation(10012, 34, '2020-1-8', '2020-1-20', 2);
CALL MakeReservation(10013, 86, '2020-4-19', '2020-5-3', 5);
CALL MakeReservation(10014, 63, '2020-8-13', '2020-8-19', 4);
CALL MakeReservation(10015, 94, '2020-4-1', '2020-4-2', 5);
CALL MakeReservation(10016, 2, '2021-5-8', '2021-5-19', 1);
CALL MakeReservation(10017, 39, '2021-4-2', '2021-4-7', 2);
CALL MakeReservation(10018, 7, '2020-11-7', '2020-11-20', 1);
CALL MakeReservation(10019, 94, '2020-2-18', '2020-2-26', 5);
CALL MakeReservation(10020, 61, '2021-2-14', '2021-2-20', 4);
CALL MakeReservation(10021, 55, '2020-2-1', '2020-2-3', 2);
CALL MakeReservation(10022, 26, '2021-8-12', '2021-8-25', 2);
CALL MakeReservation(10023, 31, '2021-1-4', '2021-1-13', 2);
CALL MakeReservation(10024, 5, '2021-5-14', '2021-5-22', 1);
CALL MakeReservation(10025, 22, '2021-3-23', '2021-3-24', 2);

-- Add data to the restaurant bills table
CALL RestaurantBill(NULL, NULL, NULL);
CALL RestaurantBill(1003, '2021-11-16', 2);
CALL RestaurantBill(1001, '2021-03-11', 3);
CALL RestaurantBill(1002, '2021-11-27 07:30:45', 2);
CALL RestaurantBill(1001, '2021-03-15 20:10:17', 17);
CALL RestaurantBill(1005, '2021-06-13 09:56:10', 3);
CALL RestaurantBill(1005, '2021-03-15 14:00:17', 3);
CALL RestaurantBill(1006, '2020-08-16 07:10:00', 5);
CALL RestaurantBill(1007, '2020-03-04 10:09:57', 19);
CALL RestaurantBill(1007, '2020-03-05 21:10:08', 5);
CALL RestaurantBill(1020, '2021-02-14 13:08:30', 5);
CALL RestaurantBill(1016, '2021-05-08 14:15:15', 10);
CALL RestaurantBill(1018, '2020-11-20 15:08:19', 17);
CALL RestaurantBill(1025, '2021-03-24 11:26:17', 16);

-- Insert data into food details table after a restaurant bill is created
CALL Food(NULL, NULL, NULL);
CALL Food(5001, 1, 1);
CALL Food(5001, 2, 1);
CALL Food(5001, 15, 1);
CALL Food(5001, 20, 1);
CALL Food(5001, 28, 2);
CALL Food(5002, 3, 2);
CALL Food(5002, 5, 1);
CALL Food(5002, 6, 1);
CALL Food(5002, 14, 2);
CALL Food(5002, 9, 2);
CALL Food(5002, 11, 4);
CALL Food(5004, 4, 1);
CALL Food(5004, 2, 1);
CALL Food(5004, 12, 2);
CALL Food(5004, 20, 1);
CALL Food(5005, 21, 3);
CALL Food(5005, 2, 1);
CALL Food(5005, 12, 2);
CALL Food(5006, 4, 2);
CALL Food(5006, 7, 3);
CALL Food(5007, 3, 4);
CALL Food(5007, 24, 2);
CALL Food(5008, 14, 5);
CALL Food(5008, 11, 2);
CALL Food(5009, 6, 3);
CALL Food(5010, 1, 6);
CALL Food(5010, 8, 4);
CALL Food(5010, 10, 2);
CALL Food(5011, 10, 2);
CALL Food(5011, 11, 4);
CALL Food(5011, 4, 3);
CALL Food(5011, 5, 3);
CALL Food(5011, 9, 6);
CALL Food(5012, 10, 1);
CALL Food(5012, 1, 1);
CALL Food(5012, 11, 1);
CALL Food(5012, 28, 1);
CALL Food(5013, 10, 1);
CALL Food(5013, 27, 1);
CALL Food(5013, 18, 1);
CALL Food(5013, 12, 1);

-- Insert Data into payment table
CALL Payment(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL Payment(1012, 9, '2020-01-20 10:36:31', 54000.00, 0.00, 54000.00, 54000.00, 0.0);
CALL Payment(1009, 4, '2020-01-31 16:54:42', 30000.00, 0.00, 30000.00, 30000.00, 0.0);
CALL Payment(1021, 18, '2020-02-03 17:19:46', 9000.00, 0.00, 9000.00, 10000.00, 1000.0);
CALL Payment(1004, 5, '2020-02-24 09:55:02', 78000.00, 0.00, 78000.00 , 80000.00 , 2000.0);
CALL Payment(1019, 15, '2020-02-26 11:15:50', 68000.00, 0.00, 68000.00, 70000.00, 2000.0);
CALL Payment(1015, 12, '2020-04-02 7:19:11', 8500.00, 0.00, 8500.00, 10000.00, 1500.0);
CALL Payment(1013, 10, '2020-05-03 07:39:21', 119000.00, 0.00, 119000.00, 119000.00, 0.0);
CALL Payment(1014, 10, '2020-08-19 16:35:41', 36000.00, 0.00, 36000.000, 36000.000, 0.0);
CALL Payment(1006, 17, '2020-08-30 9:56:36', 63000.00, 1050, 64050.00, 65000.00, 950.0);
CALL Payment(1018, 11, '2020-11-20 18:27:17', 26000.00, 0.00, 26000.00, 26000.00, 0.0);
CALL Payment(1010, 3, '2021-01-21 9:35:38', 40500.00, 0.00, 40500.00, 41000.00, 500.0);
CALL Payment(1020, 16, '2021-02-20 17:5:52', 36000.00, 0.00, 36000.00, 36000.00, 0.0);
CALL Payment(1007, 17, '2021-03-06 13:51:9', 4000.00, 7500, 11500.00, 12000.00, 500.0);
CALL Payment(1001, 20, '2021-03-16 17:05:48', 22500.00, 5750.00, 28250.00, 30000.00, 1750.0);
CALL Payment(1008, 3, '2021-03-30 15:13:2', 153000.00, 0.00, 153000.00, 153000.00, 0.0);
CALL Payment(1017, 12, '2021-04-07 15:9:6', 22500.00, 0.00, 22500.00, 22500.00, 0.0);
CALL Payment(1016, 11, '2021-05-19 10:00:08', 22000.00, 0.00, 22000.00, 22000.00, 0.0);
CALL Payment(1005, 17, '2021-06-29 08:40:29', 136000.00, 4650, 140650.00, 150000.00, 9350.0);
CALL Payment(1011, 9, '2021-07-21 18:5:25', 12000.00, 0.00, 12000.00, 12000.00, 0.0);
CALL Payment(1003, 17, '2021-11-29 09:20:19', 26000.00, 2100.00, 28100.00, 29000.00, 900.0);
CALL Payment(1002, 20, '2021-12-01 11:15:08', 18000.00, 1750.00, 19750.00, 20000.00, 250.0);


DELIMITER //

CREATE PROCEDURE getRoomStatus()

BEGIN

    SELECT * FROM room_table WHERE roomNo > 0;
END//

DELIMITER ;


-- Table to store user logs
CREATE TABLE user_login (
    userCount INT PRIMARY KEY AUTO_INCREMENT,
    userID INT REFERENCES employee_Table(empID),
    logInTime DATETIME,
    logOutTime DATETIME
)ENGINE = innodb;

-- set user login, logout user, find active user
DELIMITER //

CREATE PROCEDURE loginUser(In checkName VARCHAR(30), IN checkPassword VARCHAR(10))
BEGIN
    DECLARE userExist INT;
    SELECT COUNT(*) FROM system_user_table WHERE usename = checkName AND userpassword = checkPassword INTO userExist;

    IF userExist > 0 THEN
        SELECT empID FROM system_user_table WHERE usename = checkName AND userpassword = checkPassword;
    ELSE
        SELECT -1 AS empID;
    END IF;
END//

CREATE PROCEDURE setActiveUser(IN currentID INT, IN logInTime DATETIME)
BEGIN
    INSERT INTO user_login(userID, logInTime)
    VALUES(currentID, logInTime);

    SELECT empRole FROM employee_table WHERE empID = currentID;
END//

CREATE PROCEDURE getActiveUser()
BEGIN
    SELECT MAX(employee_Table.userCount) AS aUserCount, user_login.userID, employee_Table.empName
    FROM user_login, employee_Table
    WHERE user_login.logOutTime = NULL;
END//

CREATE PROCEDURE logoutUser(IN currentID INT, IN currntTime VARCHAR(21))
BEGIN
    UPDATE user_login SET logOutTime = currntTime  WHERE userID = currentID;
END//

CREATE PROCEDURE getUserName(IN ID INT)
BEGIN
    SELECT empName FROM employee_table WHERE empID = ID;
END//

DELIMITER ;
