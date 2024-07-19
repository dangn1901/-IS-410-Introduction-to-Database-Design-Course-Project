--Creation of Tables

CREATE TABLE Customer_T 
    ( CustomerID                  number(5)       Not Null,
      CustomerName                varchar(25)     Not Null,
      CustomerDOB                 date            Not Null,
      CustomerEmail               varchar(25)     Not Null,
      CustomerPhoneNumber         varchar(12)     Not Null,
      CustomerStreetAddress       varchar(25)     Not Null,
      CustomerCity                varchar(25)     Not Null,
      CustomerState               char(2)         Not Null,
      CustomerZip                 number(5)       Not Null,
    CONSTRAINT CustomerID_PK PRIMARY KEY (CustomerID));
    
    
CREATE TABLE Vehicle_T 
    ( VehicleID                  number(5)       Not Null, 
      VehicleMake                varchar(25)     Not Null,
      VehicleModel               varchar(25)     Not Null,
      VehicleYear                number(4)       Not Null,
      LicensePlate               varchar(7)      Not Null,
      VehicleColor               varchar(25)     Not Null,
    CONSTRAINT VehicleID_PK PRIMARY KEY (VehicleID));
    
    
CREATE TABLE Driver_T 
    ( DriverID                  number(5)       Not Null,
      DriverName                varchar(25)     Not Null,
      DriverPhoneNumber         varchar(12)     Not Null,
      DriverEmail               varchar(25)     Not Null,
      VehicleID                 number(5)       Not Null,
    CONSTRAINT DriverID_PK PRIMARY KEY (DriverID),
    CONSTRAINT VehicleID_FK1 FOREIGN KEY (VehicleID) REFERENCES Vehicle_T(VehicleID));
    
    
CREATE TABLE Ride_T 
    ( RideID                         number(5)       Not Null,
      PickupStreetAddress            varchar(25)     Not Null,
      PickupCity                     varchar(25)     Not Null,
      PickupState                    char(2)         Not Null,
      PickupZip                      number(5)       Not Null,
      DestinationStreetAddress       varchar(25)     Not Null,
      DestinationCity                varchar(25)     Not Null,
      DestinationState               char(2)         Not Null,
      DestinationZip                 number(5)       Not Null,
      CustomerID                     number(5)       Not Null,
      DriverID                       number(5)       Not Null,
    CONSTRAINT RideID_PK PRIMARY KEY (RideID),
    CONSTRAINT CustomerID_FK2 FOREIGN KEY (CustomerID) REFERENCES Customer_T(CustomerID),
    CONSTRAINT DriverID_FK3 FOREIGN KEY (DriverID) REFERENCES Driver_T(DriverID));

--Insertion of Data

INSERT INTO Customer_T VALUES (55555,'Dang Nguyen','05/05/2001','dangnpersonal@gmail.com','410-555-5555','1901 Grinnalds Ave', 'Baltimore', 'MD', 21230);
INSERT INTO Customer_T VALUES (33333,'Maria Celeste','12/20/2003','mloria@gmail.com','410-555-3333','9231 Costa Pl', 'Columbia', 'MD', 21045);
INSERT INTO Customer_T VALUES (11111,'Kierra Reynolds','01/20/2001','kreynolds@gmail.com','410-555-1111','401 Moravia Rd', 'Baltimore', 'MD', 21206);
INSERT INTO Customer_T VALUES (22222,'Phillip Brooks','05/26/2002','pbrooks@gmail.com','410-555-2222','4573 Walters Ave', 'Columbia', 'MD', 21045);
INSERT INTO Customer_T VALUES (44444,'Tony Smith','09/01/2001','tonysmith@gmail.com','410-555-4444','2048 Ricky Rd', 'Richmond', 'VA', 23234);
INSERT INTO Customer_T VALUES (77777,'Nathan Wallace','02/09/2002','nategreat@gmail.com','410-555-4178','1261 W Pratt St', 'Baltimore', 'MD', 21230);
INSERT INTO Customer_T VALUES (88888,'James Harden','08/26/1989', 'jharden@gmail.com','410-555-1313','1212 Griffis Ave', 'Baltimore', 'MD', 21230);

INSERT INTO Vehicle_T VALUES (12345,'Subaru','Impreza', 2022, 'RD12345','Blue');
INSERT INTO Vehicle_T VALUES (23456,'Honda','Accord', 2016, 'DK74621','Silver');
INSERT INTO Vehicle_T VALUES (34567,'Toyota','Camry', 2012, 'FW96258','Red');
INSERT INTO Vehicle_T VALUES (45678,'Nissan','Altima', 2010, 'WW14785','Black');
INSERT INTO Vehicle_T VALUES (56789,'Ford','Taurus', 2020, 'PU65239','Black');
INSERT INTO Vehicle_T VALUES (67891,'Honda','Civic', 2021, 'GG74598','Blue');

INSERT INTO Driver_T VALUES (26890,'David Johnson','210-978-4178', 'djohn@gmail.com', 12345);
INSERT INTO Driver_T VALUES (23469,'Ricky Bobby','443-749-1155', 'rickbob@gmail.com', 23456);
INSERT INTO Driver_T VALUES (12357,'John Smith','410-410-7777', 'smithofjohn@gmail.com', 34567);
INSERT INTO Driver_T VALUES (13589,'Tia Corinne','443-961-1453', 'freakyt@gmail.com', 45678);
INSERT INTO Driver_T VALUES (23679,'Megan Good','667-002-3351', 'goodmeg@gmail.com', 56789);
INSERT INTO Driver_T VALUES (45454,'Nikola Jokic','777-151-1515', 'njoker@gmail.com', 67891);

INSERT INTO Ride_T VALUES (74569,'1901 Grinnalds Ave','Baltimore', 'MD', 21230, '1400 W Cold Spring Ln', 'Baltimore', 'MD', 21209, 55555, 23679);
INSERT INTO Ride_T VALUES (61489,'1743 W Nursery Rd','Linthicum Heights', 'MD', 21090, '3330 St Paul St', 'Baltimore', 'MD', 21218, 33333, 13589);
INSERT INTO Ride_T VALUES (12789,'10300 Patuxent Pkwy','Columbia', 'MD', 21044, '3109 M St NW', 'Washington', 'DC', 20007, 22222, 26890);
INSERT INTO Ride_T VALUES (35678,'401 Moravia Rd', 'Baltimore', 'MD', 21206, '2500 W North Ave', 'Baltimore', 'MD', 21216, 11111, 23469);
INSERT INTO Ride_T VALUES (23479, '2048 Ricky Rd', 'Richmond', 'VA', 23234, '1250 Bladensburg Rd', 'Washington', 'DC', 20002, 44444, 12357);
INSERT INTO Ride_T VALUES (99887, '1700 E Cold Spring Ln', 'Baltimore', 'MD', 21251, '8000 York Rd', 'Towson', 'MD', 21252, 88888, 23679);


--Two Update Queries
UPDATE Customer_T SET CustomerPhoneNumber = '443-374-9874' WHERE CustomerID = 55555;
UPDATE Driver_T SET DriverEmail = 'megangood11@gmail.com' WHERE DriverID = 23679;


--Two Basic Select Statements
--Display all Customers and their contact information
SELECT CustomerName, CustomerEmail, CustomerPhoneNumber
    FROM Customer_T
        ORDER BY CustomerName;
--Display all Drivers and their contact information
SELECT DriverName, DriverEmail, DriverPhoneNumber
    FROM Driver_T
        ORDER BY DriverName;

--Two Join Queries with GROUP BY
--Display Customer infomation and their Ride Destination infomation even if they have not booked a ride, grouped by and ordered in DestinationState
SELECT Customer_T.CustomerID, CustomerName, RideID, DestinationStreetAddress, DestinationCity, DestinationState, DestinationZip
        FROM Customer_T LEFT OUTER JOIN Ride_T ON Customer_T.CustomerID = Ride_T.CustomerID
            GROUP BY DestinationState, DestinationCity, DestinationZip, DestinationStreetAddress, CustomerName, Customer_T.CustomerID, RideID
                ORDER BY DestinationState;
--Display Driver information and their Vehicle information grouped by their vehicle color
SELECT DriverID, DriverName, Driver_T.VehicleID, VehicleColor, VehicleYear, VehicleMake, VehicleModel, LicensePlate
    FROM Driver_T, Vehicle_T 
        WHERE Driver_T.VehicleID = Vehicle_T.VehicleID
            GROUP BY VehicleColor, VehicleModel, VehicleMake, VehicleYear, Driver_T.VehicleID, DriverID, DriverName, LicensePlate
                ORDER BY VehicleColor;

--Additional Join Queries
--Display customer, driver, and destination information of rides only to Baltimore
SELECT RideID, CustomerName, DriverName, DestinationStreetAddress, DestinationCity, DestinationState, DestinationZip
    FROM Customer_T, Driver_T, Ride_T
        WHERE Customer_T.CustomerID = Ride_T.CustomerID
            AND Driver_T.DriverID = Ride_T.DriverID
                AND DestinationCity = 'Baltimore';

--Display Driver and their vehicle info only if their car is 2020 or newer           
SELECT DriverID, DriverName, VehicleYear, VehicleMake, VehicleModel, VehicleColor, LicensePlate
    FROM Driver_T INNER JOIN Vehicle_T ON Driver_T.VehicleID = Vehicle_T.VehicleID
        WHERE VehicleYear > 2019
            ORDER BY VehicleColor;
            
--Display CustomerName and pickup/destination address info if the customer was picked up from their home PickUpAddresses = CustomerAddresses
SELECT CustomerName, RideID, PickupStreetAddress, PickupCity, PickupState, PickupZip, DestinationStreetAddress, DestinationCity, DestinationState, DestinationZip
    FROM Customer_T INNER JOIN Ride_T ON Customer_T.CustomerID = Ride_T.CustomerID
        WHERE CustomerStreetAddress = PickUpStreetAddress;

--Only diplay Drivers and their vehicle info only if their VehicleColor is black
SELECT DriverID, DriverName, Driver_T.VehicleID, VehicleYear, VehicleMake, VehicleModel, VehicleColor, LicensePlate
    FROM Driver_T, Vehicle_T 
    WHERE Driver_T.VehicleID = Vehicle_T.VehicleID
        AND VehicleColor = 'Black'
            ORDER BY DriverName; 
            
--Display Rides' CustomerName, DriverName, and DestinationAddress            
SELECT RideID, CustomerName, DriverName, DestinationStreetAddress, DestinationCity, DestinationState, DestinationZip
    FROM Customer_T, Driver_T, Ride_T
        WHERE Customer_T.CustomerID = Ride_T.CustomerID
            AND Driver_T.DriverID = Ride_T.DriverID;

--Display Ride information only by one specific Driver, "Megan Good"
SELECT DriverName, RideID, CustomerName, PickupStreetAddress, PickupCity, PickupState, PickupZip, DestinationStreetAddress, DestinationCity, DestinationState, DestinationZip
    FROM Customer_T, Driver_T, Ride_T
        WHERE Customer_T.CustomerID = Ride_T.CustomerID
            AND Driver_T.DriverID = Ride_T.DriverID
                AND Ride_T.DriverID = 23679;
