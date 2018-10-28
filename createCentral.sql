use centralDatabase;
drop table flight;
drop table aircraft;
drop table airport;
drop table flightData;

create table aircraft
	(tailNumber		varchar(6), 
	 manufacturer	varchar(50),
	 model			varchar(50), 
	 primary key (tailNumber)
	);

create table airport
	(IATA		varchar(20), 
	 name		varchar(100), 
	 city		varchar(50),
	 state 		varchar(50),
	 country 	varchar(50), 
	 primary key (IATA)
	);

create table flight
	(aircraft			varchar(20), 
	 id					varchar(20), 
	 origin		    	varchar(20),
	 destination    	varchar(20),
	 SGDT				datetime,
	 EGDT				datetime,
	 SGAT				datetime,
	 EGAT				datetime,
	 SRDT				datetime,
	 ERDT				datetime,
	 SRAT				datetime,
	 ERAT				datetime,
	 duration			time,
	 distance			int,
	 numPassengers		int,
	 status				varchar(20),
	 NARTUR				int,
	 NDRTUR				int,
	 primary key (aircraft, SGDT),
	 foreign key (aircraft) references aircraft (tailNumber)
	 	on delete cascade,
	 foreign key (origin) references airport (IATA)
	 	on delete cascade,
	 foreign key (destination) references airport (IATA)
	 	on delete cascade
	);

create table flightData
	(SGDT 			datetime,
	 id				int,
	 aircraft		varchar(20),					 
	 duration		int,
	 origin			varchar(20),
	 destination	varchar(20),
	 distance		int,
	 primary key (id,aircraft,SGDT)
	);

-- COPY persons(first_name,last_name,dob,email) 
-- FROM 'C:\tmp\persons.csv' DELIMITER ',' CSV HEADER;

LOAD DATA INFILE '/var/lib/mysql-files/flights.csv' 
INTO TABLE flightData 
FIELDS TERMINATED BY ','
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/aircrafts.csv' 
INTO TABLE aircraft 
FIELDS TERMINATED BY ','
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/var/lib/mysql-files/airports.csv' 
INTO TABLE airport
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- DECLARE n INT DEFAULT 0;
-- DECLARE i INT DEFAULT 0;
-- SELECT COUNT(*) FROM table_A INTO n;
-- SET i=0;
-- WHILE i<n DO 
--   INSERT INTO table_B(ID, VAL) VALUES(ID, VAL) FROM table_A LIMIT i,1;
--   SET i = i + 1;
-- END WHILE;

-- CREATE EVENT my_event
--   ON SCHEDULE
--     AT ('2014-04-30 00:20:00'+ INTERVAL 1 DAY) ON COMPLETION PRESERVE ENABLE 
--   DO
--     # My query