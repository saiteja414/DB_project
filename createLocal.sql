create table flight
	(aircraft			varchar(6), 
	 id					varchar(4), 
	 origin		    	varchar(3),
	 destination    	varchar(3),
	 SGDT				datetime,
	 EGDT				datetime,
	 SGAT				datetime,
	 EGAT				datetime,
	 SRDT				datetime,
	 ERDT				datetime,
	 SRAT				datetime,
	 EGAT				datetime,
	 duration			time,
	 distance			int,
	 numPassengers		int,
	 status				varchar(20),
	 NARTUR				int,
	 NDRTUR				int,
	 primary key (aircraft, SGDT),
	 foreign key (aircraft) references aircraft
	 	on delete cascade,
	 foreign key (origin) references airport
	 	on delete cascade,
	 foreign key (destination) references airport
	 	on delete cascade
	);

create table aircraft
	(tailNumber		varchar(6), 
	 manufacturer	varchar(50),
	 model			varchar(50) 
	 primary key (tailNumber)
	);

create table airport
	(IATA		varchar(3), 
	 name		varchar(50), 
	 city		varchar(50),
	 state 		varchar(50),
	 country 	varchar(50), 
	 primary key (IATA)
	);

create table runway
	(id varchar(20),
	primary key (id)
	);

create table runwayFlight
	(id			varchar(20),
	 aircraft	varchar(6),
	 SGDT		datetime,
	 startTime	datetime,
	 primary key (aircraft, SGDT)
	 foreign key (aircraft, SGDT) references flight
	 	on delete cascade,
	 foreign key (id) references runway
	 	on delete cascade
	);

create table gate
	(id varchar(20),
	primary key (id)
	);

create table gateFlight
	(id			varchar(20),
	 aircraft	varchar(6),
	 SGDT		datetime,
	 startTime	datetime,
	 primary key (aircraft, SGDT)
	 foreign key (aircraft, SGDT) references flight
	 	on delete cascade,
	 foreign key (id) references gate
	 	on delete cascade
	);

create table resource
	(id varchar(20),
	primary key (id)
	);

create table resourceFlight
	(id			varchar(6),
	 aircraft	varchar(20),
	 SGDT		datetime,
	 startTime	datetime,
	 primary key (aircraft, SGDT)
	 foreign key (aircraft, SGDT) references flight
	 	on delete cascade,
	 foreign key (id) references resource
	 	on delete cascade
	);
