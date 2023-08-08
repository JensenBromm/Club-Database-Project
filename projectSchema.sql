Drop table if exists DEPARTMENT;
CREATE TABLE DEPARTMENT (
  name             	varchar(50) not null,
  office_number         	char(12),
  phone           	 	char(12),
  primary key (name)
);

Drop table if exists  FACULTY;
CREATE TABLE FACULTY (
  first_name		varchar(20) not null, 
  last_name        	varchar(20) not null,
  eagle_id               	char(9) not null,
  department       	varchar(50),
  phone            	char(12),
  office_number           char(12),
  email                    	varchar(30),
  primary key (eagle_id),
  foreign key (DEPARTMENT) references DEPARTMENT(name)
  On update cascade
  on delete set null
);

Drop table if exists CLUB;
CREATE TABLE CLUB (  
  org_id      	integer not null,
  name        	varchar(50) not null,
  advisor_id 	char(9),
  about 	varchar(300),
  primary key (org_id),
  Foreign key(advisor_id) references FACULTY (eagle_id)
  On update cascade
  On delete set null
);

Drop table if exists  STUDENT;
CREATE TABLE STUDENT (
  first_name    		varchar(20) not null, 
  m_init    		varchar(1),
  last_name   		varchar(20) not null,
  eagle_id     		char(9),
  class 			varchar(15),
  position 		varchar(15),
  phone 		char(12),
  membership 		integer,

  primary key (eagle_id),
  foreign key (membership) references CLUB(org_id)
  On update cascade
  On delete set null
);

DROP TABLE IF EXISTS BOOKABLE_LOCATION; 
CREATE TABLE BOOKABLE_LOCATION (
  campus	varchar(25) not null,
  location	varchar(25) not null,
  type		varchar(25),
  capacity	integer,
  primary key (location)
);

DROP TABLE IF EXISTS CLUB_EVENT; 
CREATE TABLE CLUB_EVENT (
  event_id		varchar(20) not null,
  hosting_org_id	integer not null,
  date			datetime,
  location		varchar(25),
  about			varchar(300),
  primary key (event_id),
  foreign key (hosting_org_id) references Club(org_id)
  On update cascade
  on delete cascade,
  foreign key (location) references BOOKABLE_LOCATION(location)
  On update cascade
  on delete set null
);

Drop table if exists  BUDGET;
Create table BUDGET(
  org_id      		integer not null,
  fee_amount       	double(3,2),
  income        		double(3,2),
  expenses         	double(3,2),


  primary key        (org_id),
  foreign key (org_id) references CLUB(org_id) 
  On update cascade
  on delete cascade
);

DROP TABLE IF EXISTS SOCIAL_MEDIA; 
Create table SOCIAL_MEDIA(
  org_id       		integer not null,
  url 			varchar(50) not null,
  username         	varchar(20),
  num_of_posts       	integer,
  num_of_views         	integer,
  

  primary key (url),
  foreign key (org_id) references CLUB(org_id)
  On update cascade
  on delete cascade
); 

Drop table if exists  PROJECT;
CREATE TABLE PROJECT (
  PROJECT_id    			integer not null,
  org_id 			integer not null,
  title    				varchar(20) not null, 
  total_participants		integer not null,
  about    			varchar(300),
  
  
  primary key (PROJECT_id),
  foreign key (org_id) references CLUB(org_id)
  On update cascade
  on delete cascade
);

Drop table if exists WINGS_POINTS_EVENT;
CREATE TABLE WINGS_POINTS_EVENT (
  title   				varchar(50) not null,
  hosting_org_id 		integer not null,
  points_value 			double not null,
  date 				datetime,
  location        			varchar(25),
  about				varchar(300),
  primary key (title),
  foreign key (hosting_org_id) references CLUB(org_id)
  On update cascade
  on delete cascade,
  Foreign key (location) references BOOKABLE_LOCATION(location)
  On update cascade
  On delete set null
);







