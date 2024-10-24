Create database Airlines;
use  Airlines;

CREATE TABLE `maindata` (
  `%Airline ID` int DEFAULT NULL,
  `%Carrier Group ID` int DEFAULT NULL,
  `%Unique Carrier Code` text,
  `%Unique Carrier Entity Code` int DEFAULT NULL,
  `%Region Code` text,
  `%Origin Airport ID` int DEFAULT NULL,
  `%Origin Airport Sequence ID` int DEFAULT NULL,
  `%Origin Airport Market ID` int DEFAULT NULL,
  `%Origin World Area Code` int DEFAULT NULL,
  `%Destination Airport ID` int DEFAULT NULL,
  `%Destination Airport Sequence ID` int DEFAULT NULL,
  `%Destination Airport Market ID` int DEFAULT NULL,
  `%Destination World Area Code` int DEFAULT NULL,
  `%Aircraft Group ID` int DEFAULT NULL,
  `%Aircraft Type ID` int DEFAULT NULL,
  `%Aircraft Configuration ID` int DEFAULT NULL,
  `%Distance Group ID` int DEFAULT NULL,
  `%Service Class ID` text,
  `%Datasource ID` text,
  `# Departures Scheduled` int DEFAULT NULL,
  `# Departures Performed` int DEFAULT NULL,
  `# Payload` int DEFAULT NULL,
  `Distance` int DEFAULT NULL,
  `# Available Seats` int DEFAULT NULL,
  `# Transported Passengers` int DEFAULT NULL,
  `# Air Time` int DEFAULT NULL,
  `Unique Carrier` text,
  `Carrier Code` text,
  `Carrier Name` text,
  `Origin Airport Code` text,
  `Origin City` text,
  `Origin State Code` text,
  `Origin State` text,
  `Origin Country Code` text,
  `Origin Country` text,
  `Destination Airport Code` text,
  `Destination City` text,
  `Destination State Code` text,
  `Destination State` text,
  `Destination Country Code` text,
  `Destination Country` text,
  `Year` int DEFAULT NULL,
  `Month` int DEFAULT NULL,
  `Day` int DEFAULT NULL,
  `From - To Airport Code` text,
  `From - To Airport ID` text,
  `From - To City` text,
  `From - To State Code` text,
  `From - To State` text
);

describe maindata;
alter table maindata rename column `# Transported Passengers` to TP;
alter table maindata rename column TP to Transported_Passengers;
alter table maindata rename column `# Available Seats` to Available_Seats;
alter table maindata rename column `Carrier Name` to Carrier_Name;
alter table maindata rename column `From - To City` to From_to_City;


show tables;
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\MainData.csv' INTO TABLE maindata
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from maindata;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\MainData.csv' INTO TABLE maindata
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

create table DistanceGroups
(
DistanceGroupID int DEFAULT NULL,
DistanceInterval text DEFAULT NULL
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\DistanceGroups.csv' INTO TABLE distancegroups
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from distancegroups;

select * from maindata;

create table OperatingRegion
(
Region_Code text DEFAULT NULL,
Operating_Region text DEFAULT NULL
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\OperatingRegion.csv' INTO TABLE operatingregion
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

create table FlightType
(
Datasource_ID text DEFAULT NULL,
Flight_Type text DEFAULT NULL
);


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\FlightTypes.csv' INTO TABLE flighttype
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

create table Airline
(
Airline_ID int default null
);


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Airline.csv' INTO TABLE airline
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

create table Aircraft_Types
(
Aircraft_Type_ID int default null
);


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Aircraft_Types.csv' INTO TABLE aircraft_types
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;












