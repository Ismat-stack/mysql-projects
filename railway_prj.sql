-- Project : Railway Management System 

USE railway_management;

CREATE TABLE railway_main(
railway_id INT PRIMARY KEY,
railway_name CHAR(100) NOT NULL UNIQUE KEY,
headquarters CHAR(100) NOT NULL DEFAULT 'Delhi',
founded_year INT CHECK(founded_year >= 1850),
country CHAR(100) DEFAULT 'India'
);

INSERT INTO railway_main VALUES
(1, 'Indian Railways', 'Delhi', 1853, 'India'),
(2, 'Western Railways', 'Mumbai', 1860, 'India'),
(3, 'Southern Railways', 'Chennai', 1880, 'India'),
(4, 'Eastern Railways', 'Kolkata', 1890, 'India'),
(5, 'Northern Railways', 'Delhi', 1875, 'India'),
(6, 'South Central Railways', 'Hyderabad', 1900, 'India'),
(7, 'North Western Railways', 'Jaipur', 1920, 'India'),
(8, 'North East Frontier', 'Guwahati', 1930, 'India'),
(9, 'Metro Railways', 'Kolkata', 1980, 'India'),
(10, 'Central Railways', 'Nagpur', 1950, 'India');


CREATE TABLE train(
train_id INT PRIMARY KEY,
train_number BIGINT UNIQUE NOT NULL,
train_name VARCHAR(100),
capacity INT CHECK(capacity >= 50),
railway_id INT,
source_station VARCHAR(100),
destination_station VARCHAR(100),
train_type ENUM('Express', 'Superfast', 'Local', 'Passenger'),
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id) ON DELETE CASCADE
);

TRUNCATE TABLE train;

INSERT INTO train (train_id, train_number, train_name, capacity, railway_id, source_station, destination_station, train_type) VALUES
-- Northern Railways (1)
(1, 12001, 'New Delhi Shatabdi Express', 1000, 1, 'New Delhi', 'Lucknow', 'Express'),
(2, 12951, 'Mumbai Rajdhani Express', 1200, 1, 'Mumbai Central', 'New Delhi', 'Express'),
(3, 12424, 'New Delhi Chennai Express', 1100, 1, 'New Delhi', 'Chennai', 'Express'),
(4, 12235, 'Anand Vihar Garib Rath', 900, 1, 'Anand Vihar', 'Patna', 'Express'),
(5, 12033, 'Kalka Shatabdi Express', 800, 1, 'New Delhi', 'Kalka', 'Express'),

-- Western Railways (2)
(6, 12009, 'Ahmedabad Shatabdi Express', 950, 2, 'Ahmedabad', 'Mumbai Central', 'Express'),
(7, 12903, 'Golden Temple Mail', 1300, 2, 'Amritsar', 'Mumbai Central', 'Express'),
(8, 22901, 'Udaipur Superfast Express', 1000, 2, 'Udaipur', 'Delhi', 'Superfast'),
(9, 12925, 'Paschim Express', 1200, 2, 'Amritsar', 'Mumbai', 'Express'),
(10, 12955, 'Jaipur Rajdhani Express', 1100, 2, 'Jaipur', 'New Delhi', 'Express'),

-- Southern Railways (3)
(11, 12623, 'Trivandrum Mail', 1000, 3, 'Trivandrum', 'Chennai', 'Express'),
(12, 12658, 'Chennai Bangalore Mail', 950, 3, 'Chennai', 'Bangalore', 'Express'),
(13, 12673, 'Cheran Express', 1100, 3, 'Coimbatore', 'Chennai', 'Express'),
(14, 12627, 'Karnataka Express', 1200, 3, 'Bangalore', 'New Delhi', 'Express'),
(15, 12601, 'Mangalore Express', 1050, 3, 'Mangalore', 'Chennai', 'Express'),

-- Eastern Railways (4)
(16, 12301, 'Howrah Rajdhani Express', 1200, 4, 'Howrah', 'New Delhi', 'Express'),
(17, 12381, 'Poorva Express', 1100, 4, 'Howrah', 'New Delhi', 'Express'),
(18, 12305, 'Howrah Kalka Mail', 1000, 4, 'Howrah', 'Kalka', 'Express'),
(19, 12321, 'Howrah Mumbai Mail', 1200, 4, 'Howrah', 'Mumbai', 'Express'),
(20, 12311, 'Himgiri Express', 950, 4, 'Howrah', 'Jammu Tawi', 'Express'),

-- Central Railways (5)
(21, 12101, 'Jnaneswari Express', 1000, 5, 'Howrah', 'Mumbai', 'Express'),
(22, 12111, 'Kalka Mail', 1100, 5, 'Howrah', 'Delhi', 'Express'),
(23, 12155, 'Bhopal Express', 950, 5, 'Bhopal', 'Delhi', 'Express'),
(24, 12141, 'Siddheshwar Express', 1000, 5, 'Solapur', 'Mumbai', 'Express'),
(25, 12129, 'Azad Hind Express', 1200, 5, 'Pune', 'Howrah', 'Express'),

-- South Central Railways (6)
(26, 12723, 'Andhra Pradesh Express', 1200, 6, 'Hyderabad', 'New Delhi', 'Express'),
(27, 12701, 'Hussain Sagar Express', 950, 6, 'Hyderabad', 'Mumbai', 'Express'),
(28, 12711, 'Pinakini Express', 1000, 6, 'Chennai', 'Vijayawada', 'Express'),
(29, 12791, 'Secunderabad Patna Express', 1100, 6, 'Secunderabad', 'Patna', 'Express'),
(30, 12715, 'Sachkhand Express', 1050, 6, 'Nanded', 'Amritsar', 'Express'),

-- North Eastern Railways (7)
(31, 15001, 'Dehradun Express', 900, 7, 'Dehradun', 'Varanasi', 'Express'),
(32, 15011, 'Lucknow Mail', 950, 7, 'Lucknow', 'Delhi', 'Express'),
(33, 15021, 'Gorakhpur Express', 1000, 7, 'Gorakhpur', 'Mumbai', 'Express'),
(34, 15031, 'Barauni Express', 1100, 7, 'Lucknow', 'Barauni', 'Express'),
(35, 15041, 'Avadh Express', 1200, 7, 'Lucknow', 'Mumbai', 'Express'),

-- North Western Railways (8)
(36, 14801, 'Jodhpur Express', 900, 8, 'Jodhpur', 'Delhi', 'Express'),
(37, 14811, 'Jaipur Express', 1000, 8, 'Jaipur', 'Mumbai', 'Express'),
(38, 14821, 'Bikaner Express', 1050, 8, 'Bikaner', 'Delhi', 'Express'),
(39, 14831, 'Barmer Express', 950, 8, 'Barmer', 'Jaipur', 'Express'),
(40, 14841, 'Jaisalmer Express', 1100, 8, 'Jaisalmer', 'Jodhpur', 'Express'),

-- South Western Railways (9)
(41, 16501, 'Yesvantpur Express', 1000, 9, 'Yesvantpur', 'Delhi', 'Express'),
(42, 16511, 'Bangalore Hubli Express', 900, 9, 'Bangalore', 'Hubli', 'Express'),
(43, 16521, 'Shimoga Express', 950, 9, 'Shimoga', 'Bangalore', 'Express'),
(44, 16531, 'Mysore Express', 1000, 9, 'Mysore', 'Chennai', 'Express'),
(45, 16541, 'Hampi Express', 1100, 9, 'Mysore', 'Hubli', 'Express'),

-- East Coast Railways (10)
(46, 22801, 'Visakhapatnam Express', 1200, 10, 'Visakhapatnam', 'Hyderabad', 'Express'),
(47, 22811, 'Bhubaneswar Express', 1000, 10, 'Bhubaneswar', 'Chennai', 'Express'),
(48, 22821, 'Puri Express', 950, 10, 'Puri', 'Howrah', 'Express'),
(49, 22831, 'Sambalpur Express', 900, 10, 'Sambalpur', 'Bhubaneswar', 'Express'),
(50, 22841, 'Rourkela Express', 1050, 10, 'Rourkela', 'Delhi', 'Express');


CREATE TABLE route(
route_id INT PRIMARY KEY,
source_station CHAR(200) NOT NULL,
destination_station CHAR(200) NOT NULL,
distance_km INT CHECK(distance_km > 0),
railway_id INT,
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id)
);

INSERT INTO route (route_id, source_station, destination_station, distance_km, railway_id) VALUES
-- Northern Railways (1)
(1, 'New Delhi', 'Bhopal', 700, 1),
(2, 'New Delhi', 'Mumbai Central', 1380, 1),
(3, 'New Delhi', 'Chennai Central', 2180, 1),
(4, 'Anand Vihar', 'Patna Jn', 1050, 1),
(5, 'New Delhi', 'Kalka', 270, 1),

-- Western Railways (2)
(6, 'Ahmedabad', 'Mumbai Central', 490, 2),
(7, 'Mumbai Central', 'Amritsar', 1860, 2),
(8, 'Udaipur City', 'Mumbai Central', 750, 2),
(9, 'Mumbai Central', 'Delhi', 1380, 2),
(10, 'Jaipur', 'Mumbai Central', 1150, 2),

-- Southern Railways (3)
(11, 'Chennai Central', 'Trivandrum Central', 920, 3),
(12, 'Chennai Central', 'Delhi', 2180, 3),
(13, 'Chennai Central', 'Bangalore City', 360, 3),
(14, 'Chennai Egmore', 'Madurai', 490, 3),
(15, 'Chennai Egmore', 'Tuticorin', 610, 3),

-- Eastern Railways (4)
(16, 'Howrah', 'New Delhi', 1450, 4),
(17, 'Howrah', 'Kalka', 1710, 4),
(18, 'Howrah', 'Amritsar', 1920, 4),
(19, 'Howrah', 'Mumbai CST', 1960, 4),
(20, 'Howrah', 'Guwahati', 1010, 4),

-- Northern Railways (5)
(21, 'Patna Jn', 'Delhi', 1050, 5),
(22, 'Bhubaneswar', 'New Delhi', 1720, 5),
(23, 'Amritsar', 'New Delhi', 450, 5),
(24, 'Gorakhpur', 'New Delhi', 760, 5),
(25, 'Lucknow', 'New Delhi', 510, 5),

-- South Central Railways (6)
(26, 'Hyderabad Deccan', 'New Delhi', 1660, 6),
(27, 'Hyderabad Deccan', 'Chennai Central', 710, 6),
(28, 'Secunderabad', 'Tirupati', 630, 6),
(29, 'Hyderabad Deccan', 'Tirupati', 640, 6),
(30, 'Hyderabad Deccan', 'Visakhapatnam', 700, 6),

-- North Western Railways (7)
(31, 'Ajmer', 'New Delhi', 390, 7),
(32, 'Udaipur City', 'Jaipur', 430, 7),
(33, 'Ajmer', 'Ahmedabad', 520, 7),
(34, 'Delhi Sarai Rohilla', 'Udaipur City', 670, 7),
(35, 'Jaipur', 'Delhi', 300, 7),

-- North East Frontier (8)
(36, 'Dibrugarh', 'New Delhi', 2270, 8),
(37, 'Guwahati', 'Dibrugarh', 560, 8),
(38, 'Dibrugarh', 'Howrah', 1350, 8),
(39, 'Guwahati', 'Delhi', 1870, 8),
(40, 'Guwahati', 'Kamakhya', 110, 8),

-- Metro Railways (9)
(41, 'Sealdah', 'Barddhaman', 95, 9),
(42, 'Kolkata', 'Kavi Subhash', 32, 9),
(43, 'Sealdah', 'Bongaon', 80, 9),
(44, 'Dum Dum', 'Kavi Subhash', 28, 9),
(45, 'Esplanade', 'Howrah Maidan', 15, 9),

-- Central Railways (10)
(46, 'Mumbai CST', 'Pune Jn', 192, 10),
(47, 'Mumbai CST', 'Jabalpur', 995, 10),
(48, 'Mumbai CST', 'Chennai Central', 1280, 10),
(49, 'Mumbai CST', 'Varanasi', 1480, 10),
(50, 'Mumbai CST', 'Nashik Road', 165, 10);


CREATE TABLE station(
station_id INT PRIMARY KEY,
station_code BIGINT UNIQUE NOT NULL,
station_name CHAR(100) NOT NULL,
city CHAR(100),
railway_id INT,
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id)
);

INSERT INTO station (station_id, station_code, station_name, city, railway_id) VALUES
-- Indian Railways (1)
(1, 10001, 'New Delhi', 'Delhi', 1),
(2, 10002, 'Anand Vihar', 'Delhi', 1),
(3, 10003, 'Hazrat Nizamuddin', 'Delhi', 1),
(4, 10004, 'Kalka', 'Kalka', 1),
(5, 10005, 'Bhopal Jn', 'Bhopal', 1),

-- Western Railways (2)
(6, 20001, 'Mumbai Central', 'Mumbai', 2),
(7, 20002, 'Ahmedabad Jn', 'Ahmedabad', 2),
(8, 20003, 'Surat', 'Surat', 2),
(9, 20004, 'Udaipur City', 'Udaipur', 2),
(10, 20005, 'Vadodara Jn', 'Vadodara', 2),

-- Southern Railways (3)
(11, 30001, 'Chennai Central', 'Chennai', 3),
(12, 30002, 'Chennai Egmore', 'Chennai', 3),
(13, 30003, 'Trivandrum Central', 'Trivandrum', 3),
(14, 30004, 'Bangalore City', 'Bangalore', 3),
(15, 30005, 'Madurai Jn', 'Madurai', 3),

-- Eastern Railways (4)
(16, 40001, 'Howrah Jn', 'Kolkata', 4),
(17, 40002, 'Sealdah', 'Kolkata', 4),
(18, 40003, 'Asansol Jn', 'Asansol', 4),
(19, 40004, 'Barddhaman Jn', 'Barddhaman', 4),
(20, 40005, 'Malda Town', 'Malda', 4),

-- Northern Railways (5)
(21, 50001, 'Amritsar Jn', 'Amritsar', 5),
(22, 50002, 'Lucknow NR', 'Lucknow', 5),
(23, 50003, 'Gorakhpur Jn', 'Gorakhpur', 5),
(24, 50004, 'Varanasi Jn', 'Varanasi', 5),
(25, 50005, 'Patna Jn', 'Patna', 5),

-- South Central Railways (6)
(26, 60001, 'Hyderabad Deccan', 'Hyderabad', 6),
(27, 60002, 'Secunderabad Jn', 'Hyderabad', 6),
(28, 60003, 'Tirupati', 'Tirupati', 6),
(29, 60004, 'Kacheguda', 'Hyderabad', 6),
(30, 60005, 'Visakhapatnam', 'Visakhapatnam', 6),

-- North Western Railways (7)
(31, 70001, 'Jaipur Jn', 'Jaipur', 7),
(32, 70002, 'Ajmer Jn', 'Ajmer', 7),
(33, 70003, 'Jodhpur Jn', 'Jodhpur', 7),
(34, 70004, 'Udaipur City', 'Udaipur', 7),
(35, 70005, 'Bikaner Jn', 'Bikaner', 7),

-- North East Frontier (8)
(36, 80001, 'Guwahati', 'Guwahati', 8),
(37, 80002, 'Dibrugarh', 'Dibrugarh', 8),
(38, 80003, 'Kamakhya', 'Kamakhya', 8),
(39, 80004, 'New Jalpaiguri', 'Siliguri', 8),
(40, 80005, 'Lumding Jn', 'Lumding', 8),

-- Metro Railways (9)
(41, 90001, 'Esplanade', 'Kolkata', 9),
(42, 90002, 'Dum Dum', 'Kolkata', 9),
(43, 90003, 'Kavi Subhash', 'Kolkata', 9),
(44, 90004, 'Shyambazar', 'Kolkata', 9),
(45, 90005, 'Howrah Maidan', 'Kolkata', 9),

-- Central Railways (10)
(46, 100001, 'Mumbai CST', 'Mumbai', 10),
(47, 100002, 'Pune Jn', 'Pune', 10),
(48, 100003, 'Nagpur Jn', 'Nagpur', 10),
(49, 100004, 'Nashik Road', 'Nashik', 10),
(50, 100005, 'Jabalpur Jn', 'Jabalpur', 10);

CREATE TABLE platform(
platform_id INT PRIMARY KEY,
platform_number INT NOT NULL,
station_id INT UNIQUE,
length_m BIGINT CHECK(length_m > 100),
railway_id INT,
FOREIGN KEY (station_id) REFERENCES station(station_id),
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id)
);

INSERT INTO platform (platform_id, platform_number, station_id, length_m, railway_id) VALUES
-- Indian Railways (1)
(1, 1, 1, 550, 1),
(2, 2, 2, 480, 1),
(3, 3, 3, 520, 1),
(4, 4, 4, 350, 1),
(5, 5, 5, 600, 1),

-- Western Railways (2)
(6, 1, 6, 700, 2),
(7, 2, 7, 620, 2),
(8, 3, 8, 400, 2),
(9, 4, 9, 450, 2),
(10, 5, 10, 500, 2),

-- Southern Railways (3)
(11, 1, 11, 680, 3),
(12, 2, 12, 550, 3),
(13, 3, 13, 600, 3),
(14, 4, 14, 480, 3),
(15, 5, 15, 420, 3),

-- Eastern Railways (4)
(16, 1, 16, 700, 4),
(17, 2, 17, 480, 4),
(18, 3, 18, 500, 4),
(19, 4, 19, 450, 4),
(20, 5, 20, 420, 4),

-- Northern Railways (5)
(21, 1, 21, 650, 5),
(22, 2, 22, 550, 5),
(23, 3, 23, 520, 5),
(24, 4, 24, 500, 5),
(25, 5, 25, 480, 5),

-- South Central Railways (6)
(26, 1, 26, 600, 6),
(27, 2, 27, 580, 6),
(28, 3, 28, 400, 6),
(29, 4, 29, 350, 6),
(30, 5, 30, 650, 6),

-- North Western Railways (7)
(31, 1, 31, 600, 7),
(32, 2, 32, 550, 7),
(33, 3, 33, 500, 7),
(34, 4, 34, 480, 7),
(35, 5, 35, 420, 7),

-- North East Frontier (8)
(36, 1, 36, 620, 8),
(37, 2, 37, 580, 8),
(38, 3, 38, 400, 8),
(39, 4, 39, 550, 8),
(40, 5, 40, 480, 8),

-- Metro Railways (9)
(41, 1, 41, 200, 9),
(42, 2, 42, 220, 9),
(43, 3, 43, 250, 9),
(44, 4, 44, 180, 9),
(45, 5, 45, 300, 9),

-- Central Railways (10)
(46, 1, 46, 700, 10),
(47, 2, 47, 500, 10),
(48, 3, 48, 600, 10),
(49, 4, 49, 450, 10),
(50, 5, 50, 550, 10);


DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
emp_id INT PRIMARY KEY,
emp_name CHAR(100) NOT NULL,
emp_type ENUM('Driver', 'Guard', 'Manager'),
salary FLOAT CHECK(salary >= 10000),
railway_id INT,
hire_date DATE,
experience_years INT CHECK (experience_years >= 0),
contact_number VARCHAR(15),
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id)
);

INSERT INTO employee (emp_id, emp_name, emp_type, salary, railway_id, hire_date, experience_years, contact_number) VALUES
-- Indian Railways (1)
(1, 'Rakesh Kumar', 'Driver', 40000, 1, '2015-03-12', 10, '9876543210'),
(2, 'Anil Sharma', 'Guard', 30000, 1, '2017-07-18', 7, '9876543211'),
(3, 'Suresh Mehta', 'Manager', 65000, 1, '2012-01-20', 15, '9876543212'),
(4, 'Pooja Verma', 'Driver', 42000, 1, '2018-09-25', 6, '9876543213'),
(5, 'Alok Singh', 'Guard', 28000, 1, '2019-04-10', 5, '9876543214'),

-- Western Railways (2)
(6, 'Kiran Patel', 'Driver', 41000, 2, '2016-05-22', 9, '9876543215'),
(7, 'Ravi Shah', 'Guard', 29000, 2, '2018-10-15', 6, '9876543216'),
(8, 'Manoj Desai', 'Manager', 67000, 2, '2013-12-03', 13, '9876543217'),
(9, 'Seema Joshi', 'Driver', 43000, 2, '2020-02-17', 4, '9876543218'),
(10, 'Amit Trivedi', 'Guard', 31000, 2, '2019-06-05', 5, '9876543219'),

-- Southern Railways (3)
(11, 'Natarajan Iyer', 'Driver', 40500, 3, '2014-07-14', 11, '9876543220'),
(12, 'Arun Kumar', 'Guard', 29500, 3, '2017-03-28', 8, '9876543221'),
(13, 'Karthik Subramanian', 'Manager', 66000, 3, '2011-11-19', 16, '9876543222'),
(14, 'Lakshmi Priya', 'Driver', 41500, 3, '2018-08-12', 6, '9876543223'),
(15, 'Vijay Raghavan', 'Guard', 30500, 3, '2020-05-30', 4, '9876543224'),

-- Eastern Railways (4)
(16, 'Sanjay Roy', 'Driver', 39500, 4, '2016-02-11', 9, '9876543225'),
(17, 'Arup Ghosh', 'Guard', 28500, 4, '2019-09-04', 5, '9876543226'),
(18, 'Pranab Chatterjee', 'Manager', 68000, 4, '2010-04-23', 18, '9876543227'),
(19, 'Madhuri Sen', 'Driver', 42500, 4, '2017-12-10', 7, '9876543228'),
(20, 'Dipak Das', 'Guard', 31500, 4, '2021-01-18', 3, '9876543229'),

-- Central Railways (5)
(21, 'Shivraj Pawar', 'Driver', 40000, 5, '2015-06-22', 10, '9876543230'),
(22, 'Vikram Kulkarni', 'Guard', 29000, 5, '2018-11-01', 6, '9876543231'),
(23, 'Prakash Jadhav', 'Manager', 64000, 5, '2012-08-05', 14, '9876543232'),
(24, 'Meera Joshi', 'Driver', 43500, 5, '2019-09-12', 5, '9876543233'),
(25, 'Rohan Deshmukh', 'Guard', 30000, 5, '2020-10-09', 4, '9876543234'),

-- South Central Railways (6)
(26, 'Syed Ahmed', 'Driver', 41500, 6, '2016-03-25', 9, '9876543235'),
(27, 'Imran Khan', 'Guard', 31000, 6, '2019-05-14', 5, '9876543236'),
(28, 'Shankar Reddy', 'Manager', 65500, 6, '2011-07-07', 17, '9876543237'),
(29, 'Radha Krishna', 'Driver', 42000, 6, '2020-02-19', 4, '9876543238'),
(30, 'Anitha Rao', 'Guard', 29500, 6, '2018-06-28', 6, '9876543239'),

-- North Eastern Railways (7)
(31, 'Rajiv Mishra', 'Driver', 40500, 7, '2015-11-15', 10, '9876543240'),
(32, 'Anup Pandey', 'Guard', 28500, 7, '2020-07-10', 3, '9876543241'),
(33, 'Ashok Yadav', 'Manager', 67000, 7, '2012-03-01', 14, '9876543242'),
(34, 'Nisha Singh', 'Driver', 43000, 7, '2018-09-17', 6, '9876543243'),
(35, 'Vivek Jaiswal', 'Guard', 30000, 7, '2019-01-25', 5, '9876543244'),

-- North Western Railways (8)
(36, 'Rohit Sharma', 'Driver', 39500, 8, '2014-12-03', 11, '9876543245'),
(37, 'Manish Gupta', 'Guard', 30500, 8, '2017-05-20', 8, '9876543246'),
(38, 'Aditya Jain', 'Manager', 66000, 8, '2010-10-09', 18, '9876543247'),
(39, 'Kavita Khandelwal', 'Driver', 42000, 8, '2019-08-30', 5, '9876543248'),
(40, 'Sunil Agarwal', 'Guard', 29000, 8, '2020-04-22', 4, '9876543249'),

-- South Western Railways (9)
(41, 'Deepak Reddy', 'Driver', 40500, 9, '2016-01-18', 9, '9876543250'),
(42, 'Pradeep Shetty', 'Guard', 30000, 9, '2019-02-11', 5, '9876543251'),
(43, 'Harish Gowda', 'Manager', 67500, 9, '2012-06-15', 15, '9876543252'),
(44, 'Shweta Nair', 'Driver', 42500, 9, '2017-09-09', 7, '9876543253'),
(45, 'Arjun Ramesh', 'Guard', 29500, 9, '2020-11-27', 3, '9876543254'),

-- East Coast Railways (10)
(46, 'Bishnu Prasad', 'Driver', 41000, 10, '2015-04-20', 10, '9876543255'),
(47, 'Satyajit Mohanty', 'Guard', 28500, 10, '2018-12-25', 6, '9876543256'),
(48, 'Ajay Kumar', 'Manager', 66000, 10, '2011-02-08', 17, '9876543257'),
(49, 'Sunita Nayak', 'Driver', 43500, 10, '2019-10-02', 5, '9876543258'),
(50, 'Rajesh Behera', 'Guard', 30500, 10, '2020-07-29', 4, '9876543259');


CREATE TABLE ticket(
ticket_id INT PRIMARY KEY,
ticket_number BIGINT UNIQUE NOT NULL,
fare BIGINT CHECK(fare >= 0),
booking_date DATE DEFAULT null,
railway_id INT,
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id)
);

INSERT INTO ticket(ticket_id, ticket_number, fare, booking_date, railway_id) VALUES
(1, 1001001001, 500, '2025-09-01', 1),
(2, 1001001002, 750, '2025-09-02', 2),
(3, 1001001003, 1200, '2025-09-03', 3),
(4, 1001001004, 650, '2025-09-04', 1),
(5, 1001001005, 900, '2025-09-05', 2),
(6, 1001001006, 550, '2025-09-06', 3),
(7, 1001001007, 1100, '2025-09-07', 1),
(8, 1001001008, 700, '2025-09-08', 2),
(9, 1001001009, 800, '2025-09-09', 3),
(10, 1001001010, 1000, '2025-09-10', 1),
(11, 1001001011, 600, '2025-09-11', 2),
(12, 1001001012, 950, '2025-09-12', 3),
(13, 1001001013, 500, '2025-09-13', 1),
(14, 1001001014, 1250, '2025-09-14', 2),
(15, 1001001015, 750, '2025-09-15', 3),
(16, 1001001016, 850, '2025-09-16', 1),
(17, 1001001017, 650, '2025-09-17', 2),
(18, 1001001018, 1050, '2025-09-18', 3),
(19, 1001001019, 900, '2025-09-19', 1),
(20, 1001001020, 1200, '2025-09-20', 2),
(21, 1001001021, 700, '2025-09-21', 3),
(22, 1001001022, 800, '2025-09-22', 1),
(23, 1001001023, 550, '2025-09-23', 2),
(24, 1001001024, 950, '2025-09-24', 3),
(25, 1001001025, 600, '2025-09-25', 1),
(26, 1001001026, 1100, '2025-09-26', 2),
(27, 1001001027, 750, '2025-09-27', 3),
(28, 1001001028, 1000, '2025-09-28', 1),
(29, 1001001029, 850, '2025-09-29', 2),
(30, 1001001030, 500, '2025-09-30', 3),
(31, 1001001031, 1200, '2025-10-01', 1),
(32, 1001001032, 950, '2025-10-02', 2),
(33, 1001001033, 700, '2025-10-03', 3),
(34, 1001001034, 600, '2025-10-04', 1),
(35, 1001001035, 1050, '2025-10-05', 2),
(36, 1001001036, 800, '2025-10-06', 3),
(37, 1001001037, 550, '2025-10-07', 1),
(38, 1001001038, 900, '2025-10-08', 2),
(39, 1001001039, 1250, '2025-10-09', 3),
(40, 1001001040, 650, '2025-10-10', 1),
(41, 1001001041, 1100, '2025-10-11', 2),
(42, 1001001042, 750, '2025-10-12', 3),
(43, 1001001043, 1000, '2025-10-13', 1),
(44, 1001001044, 850, '2025-10-14', 2),
(45, 1001001045, 500, '2025-10-15', 3),
(46, 1001001046, 1200, '2025-10-16', 1),
(47, 1001001047, 950, '2025-10-17', 2),
(48, 1001001048, 700, '2025-10-18', 3),
(49, 1001001049, 600, '2025-10-19', 1),
(50, 1001001050, 1050, '2025-10-20', 2);

CREATE TABLE passenger(
passenger_id INT PRIMARY KEY,
name CHAR(200) NOT NULL,
age INT CHECK(age >= 0),
gender ENUM('M', 'F', 'O'),
railway_id INT,
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id)
);

INSERT INTO passenger (passenger_id, name, age, gender, railway_id) VALUES
(1, 'Amit Sharma', 25, 'M', 1),
(2, 'Neha Gupta', 30, 'F', 2),
(3, 'Rohit Verma', 22, 'M', 3),
(4, 'Sanya Singh', 28, 'F', 1),
(5, 'Karan Mehta', 35, 'M', 2),
(6, 'Pooja Reddy', 27, 'F', 3),
(7, 'Vikram Joshi', 40, 'M', 1),
(8, 'Isha Kapoor', 32, 'F', 2),
(9, 'Rahul Das', 29, 'M', 3),
(10, 'Anjali Nair', 24, 'F', 1),
(11, 'Sameer Khan', 33, 'M', 2),
(12, 'Tanya Rao', 26, 'F', 3),
(13, 'Manish Patel', 38, 'M', 1),
(14, 'Riya Sharma', 21, 'F', 2),
(15, 'Ajay Verma', 31, 'M', 3),
(16, 'Sofia Singh', 23, 'F', 1),
(17, 'Rahul Mehta', 36, 'M', 2),
(18, 'Neha Joshi', 29, 'F', 3),
(19, 'Vikash Kapoor', 28, 'M', 1),
(20, 'Anita Reddy', 27, 'F', 2),
(21, 'Rohan Das', 34, 'M', 3),
(22, 'Priya Nair', 30, 'F', 1),
(23, 'Kunal Sharma', 25, 'M', 2),
(24, 'Sakshi Verma', 22, 'F', 3),
(25, 'Aditya Singh', 26, 'M', 1),
(26, 'Meera Gupta', 31, 'F', 2),
(27, 'Anil Patel', 37, 'M', 3),
(28, 'Sonia Sharma', 28, 'F', 1),
(29, 'Arjun Mehta', 33, 'M', 2),
(30, 'Tara Joshi', 24, 'F', 3),
(31, 'Rakesh Kapoor', 35, 'M', 1),
(32, 'Pallavi Reddy', 29, 'F', 2),
(33, 'Vishal Das', 27, 'M', 3),
(34, 'Neha Nair', 26, 'F', 1),
(35, 'Siddharth Sharma', 32, 'M', 2),
(36, 'Ananya Verma', 21, 'F', 3),
(37, 'Harsh Singh', 30, 'M', 1),
(38, 'Ira Gupta', 23, 'F', 2),
(39, 'Manoj Patel', 34, 'M', 3),
(40, 'Simran Sharma', 28, 'F', 1),
(41, 'Rajat Mehta', 29, 'M', 2),
(42, 'Tina Joshi', 27, 'F', 3),
(43, 'Sanjay Kapoor', 36, 'M', 1),
(44, 'Nisha Reddy', 25, 'F', 2),
(45, 'Vivek Das', 31, 'M', 3),
(46, 'Priya Nair', 30, 'F', 1),
(47, 'Aman Sharma', 26, 'M', 2),
(48, 'Anika Verma', 24, 'F', 3),
(49, 'Rohan Singh', 32, 'M', 1),
(50, 'Sanya Gupta', 28, 'F', 2);


CREATE TABLE booking(
booking_id INT PRIMARY KEY,
passenger_id INT UNIQUE,
ticket_id INT UNIQUE,
seat_no VARCHAR(200) NOT NULL,
railway_id INT,
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id),
FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id),
FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id)
);

INSERT INTO booking (booking_id, passenger_id, ticket_id, seat_no, railway_id) VALUES
(1, 1, 1, 'A1', 1),
(2, 2, 2, 'B2', 2),
(3, 3, 3, 'C3', 3),
(4, 4, 4, 'D4', 1),
(5, 5, 5, 'E5', 2),
(6, 6, 6, 'F6', 3),
(7, 7, 7, 'G7', 1),
(8, 8, 8, 'H8', 2),
(9, 9, 9, 'I9', 3),
(10, 10, 10, 'J10', 1),
(11, 11, 11, 'K11', 2),
(12, 12, 12, 'L12', 3),
(13, 13, 13, 'M13', 1),
(14, 14, 14, 'N14', 2),
(15, 15, 15, 'O15', 3),
(16, 16, 16, 'P16', 1),
(17, 17, 17, 'Q17', 2),
(18, 18, 18, 'R18', 3),
(19, 19, 19, 'S19', 1),
(20, 20, 20, 'T20', 2),
(21, 21, 21, 'U21', 3),
(22, 22, 22, 'V22', 1),
(23, 23, 23, 'W23', 2),
(24, 24, 24, 'X24', 3),
(25, 25, 25, 'Y25', 1),
(26, 26, 26, 'Z26', 2),
(27, 27, 27, 'A27', 3),
(28, 28, 28, 'B28', 1),
(29, 29, 29, 'C29', 2),
(30, 30, 30, 'D30', 3),
(31, 31, 31, 'E31', 1),
(32, 32, 32, 'F32', 2),
(33, 33, 33, 'G33', 3),
(34, 34, 34, 'H34', 1),
(35, 35, 35, 'I35', 2),
(36, 36, 36, 'J36', 3),
(37, 37, 37, 'K37', 1),
(38, 38, 38, 'L38', 2),
(39, 39, 39, 'M39', 3),
(40, 40, 40, 'N40', 1),
(41, 41, 41, 'O41', 2),
(42, 42, 42, 'P42', 3),
(43, 43, 43, 'Q43', 1),
(44, 44, 44, 'R44', 2),
(45, 45, 45, 'S45', 3),
(46, 46, 46, 'T46', 1),
(47, 47, 47, 'U47', 2),
(48, 48, 48, 'V48', 3),
(49, 49, 49, 'W49', 1),
(50, 50, 50, 'X50', 2);

CREATE TABLE schedule(
schedule_id INT PRIMARY KEY,
train_id INT UNIQUE,
route_id INT UNIQUE,
arrival_time TIME NOT NULL,
departure_time TIME NOT NULL,
railway_id INT,
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id),
FOREIGN KEY (train_id) REFERENCES train(train_id),
FOREIGN KEY (route_id) REFERENCES route(route_id)
);

INSERT INTO schedule (schedule_id, train_id, route_id, arrival_time, departure_time, railway_id) VALUES
(1, 1, 1, '05:00:00', '05:15:00', 1),
(2, 2, 2, '05:30:00', '05:45:00', 2),
(3, 3, 3, '05:55:00', '06:10:00', 3),
(4, 4, 4, '06:25:00', '06:40:00', 1),
(5, 5, 5, '06:50:00', '07:05:00', 2),
(6, 6, 6, '07:15:00', '07:30:00', 3),
(7, 7, 7, '07:45:00', '08:00:00', 1),
(8, 8, 8, '08:10:00', '08:25:00', 2),
(9, 9, 9, '08:35:00', '08:50:00', 3),
(10, 10, 10, '09:00:00', '09:15:00', 1),
(11, 11, 11, '09:25:00', '09:40:00', 2),
(12, 12, 12, '09:50:00', '10:05:00', 3),
(13, 13, 13, '10:15:00', '10:30:00', 1),
(14, 14, 14, '10:40:00', '10:55:00', 2),
(15, 15, 15, '11:05:00', '11:20:00', 3),
(16, 16, 16, '11:30:00', '11:45:00', 1),
(17, 17, 17, '11:55:00', '12:10:00', 2),
(18, 18, 18, '12:20:00', '12:35:00', 3),
(19, 19, 19, '12:45:00', '13:00:00', 1),
(20, 20, 20, '13:10:00', '13:25:00', 2),
(21, 21, 21, '13:35:00', '13:50:00', 3),
(22, 22, 22, '14:00:00', '14:15:00', 1),
(23, 23, 23, '14:25:00', '14:40:00', 2),
(24, 24, 24, '14:50:00', '15:05:00', 3),
(25, 25, 25, '15:15:00', '15:30:00', 1),
(26, 26, 26, '15:40:00', '15:55:00', 2),
(27, 27, 27, '16:05:00', '16:20:00', 3),
(28, 28, 28, '16:30:00', '16:45:00', 1),
(29, 29, 29, '16:55:00', '17:10:00', 2),
(30, 30, 30, '17:20:00', '17:35:00', 3),
(31, 31, 31, '17:45:00', '18:00:00', 1),
(32, 32, 32, '18:10:00', '18:25:00', 2),
(33, 33, 33, '18:35:00', '18:50:00', 3),
(34, 34, 34, '19:00:00', '19:15:00', 1),
(35, 35, 35, '19:25:00', '19:40:00', 2),
(36, 36, 36, '19:50:00', '20:05:00', 3),
(37, 37, 37, '20:15:00', '20:30:00', 1),
(38, 38, 38, '20:40:00', '20:55:00', 2),
(39, 39, 39, '21:05:00', '21:20:00', 3),
(40, 40, 40, '21:30:00', '21:45:00', 1),
(41, 41, 41, '21:55:00', '22:10:00', 2),
(42, 42, 42, '22:20:00', '22:35:00', 3),
(43, 43, 43, '22:45:00', '23:00:00', 1),
(44, 44, 44, '23:05:00', '23:20:00', 2),
(45, 45, 45, '23:25:00', '23:40:00', 3),
(46, 46, 46, '04:50:00', '05:05:00', 1),
(47, 47, 47, '06:00:00', '06:15:00', 2),
(48, 48, 48, '07:10:00', '07:25:00', 3),
(49, 49, 49, '08:20:00', '08:35:00', 1),
(50, 50, 50, '09:30:00', '09:45:00', 2);



CREATE TABLE coach(
coach_id INT PRIMARY KEY,
coach_number BIGINT UNIQUE NOT NULL,
coach_type ENUM('Sleeper', 'AC', 'General'),
train_id INT UNIQUE,
railway_id INT,
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id),
FOREIGN KEY (train_id) REFERENCES train(train_id)
);

INSERT INTO coach (coach_id, coach_number, coach_type, train_id, railway_id) VALUES
(1, 101001, 'Sleeper', 1, 1),
(2, 101002, 'AC', 2, 2),
(3, 101003, 'General', 3, 3),
(4, 101004, 'Sleeper', 4, 1),
(5, 101005, 'AC', 5, 2),
(6, 101006, 'General', 6, 3),
(7, 101007, 'Sleeper', 7, 1),
(8, 101008, 'AC', 8, 2),
(9, 101009, 'General', 9, 3),
(10, 101010, 'Sleeper', 10, 1),
(11, 101011, 'AC', 11, 2),
(12, 101012, 'General', 12, 3),
(13, 101013, 'Sleeper', 13, 1),
(14, 101014, 'AC', 14, 2),
(15, 101015, 'General', 15, 3),
(16, 101016, 'Sleeper', 16, 1),
(17, 101017, 'AC', 17, 2),
(18, 101018, 'General', 18, 3),
(19, 101019, 'Sleeper', 19, 1),
(20, 101020, 'AC', 20, 2),
(21, 101021, 'General', 21, 3),
(22, 101022, 'Sleeper', 22, 1),
(23, 101023, 'AC', 23, 2),
(24, 101024, 'General', 24, 3),
(25, 101025, 'Sleeper', 25, 1),
(26, 101026, 'AC', 26, 2),
(27, 101027, 'General', 27, 3),
(28, 101028, 'Sleeper', 28, 1),
(29, 101029, 'AC', 29, 2),
(30, 101030, 'General', 30, 3),
(31, 101031, 'Sleeper', 31, 1),
(32, 101032, 'AC', 32, 2),
(33, 101033, 'General', 33, 3),
(34, 101034, 'Sleeper', 34, 1),
(35, 101035, 'AC', 35, 2),
(36, 101036, 'General', 36, 3),
(37, 101037, 'Sleeper', 37, 1),
(38, 101038, 'AC', 38, 2),
(39, 101039, 'General', 39, 3),
(40, 101040, 'Sleeper', 40, 1),
(41, 101041, 'AC', 41, 2),
(42, 101042, 'General', 42, 3),
(43, 101043, 'Sleeper', 43, 1),
(44, 101044, 'AC', 44, 2),
(45, 101045, 'General', 45, 3),
(46, 101046, 'Sleeper', 46, 1),
(47, 101047, 'AC', 47, 2),
(48, 101048, 'General', 48, 3),
(49, 101049, 'Sleeper', 49, 1),
(50, 101050, 'AC', 50, 2);


CREATE TABLE seat(
seat_id INT PRIMARY KEY,
seat_number VARCHAR(100) UNIQUE NOT NULL,
coach_id INT,
status ENUM('Available','Unavailable','Reserved') DEFAULT 'Available',
railway_id INT,
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id),
FOREIGN KEY (coach_id) REFERENCES coach(coach_id)
);

INSERT INTO seat (seat_id, seat_number, coach_id, status, railway_id) VALUES
(1, 'A1', 1, 'Available', 1),
(2, 'A2', 1, 'Reserved', 1),
(3, 'A3', 1, 'Available', 1),
(4, 'A4', 1, 'Unavailable', 1),
(5, 'A5', 1, 'Available', 1),
(6, 'B1', 2, 'Available', 2),
(7, 'B2', 2, 'Reserved', 2),
(8, 'B3', 2, 'Unavailable', 2),
(9, 'B4', 2, 'Available', 2),
(10, 'B5', 2, 'Available', 2),
(11, 'C1', 3, 'Available', 3),
(12, 'C2', 3, 'Reserved', 3),
(13, 'C3', 3, 'Available', 3),
(14, 'C4', 3, 'Unavailable', 3),
(15, 'C5', 3, 'Available', 3),
(16, 'D1', 4, 'Available', 1),
(17, 'D2', 4, 'Reserved', 1),
(18, 'D3', 4, 'Available', 1),
(19, 'D4', 4, 'Unavailable', 1),
(20, 'D5', 4, 'Available', 1),
(21, 'E1', 5, 'Available', 2),
(22, 'E2', 5, 'Reserved', 2),
(23, 'E3', 5, 'Unavailable', 2),
(24, 'E4', 5, 'Available', 2),
(25, 'E5', 5, 'Available', 2),
(26, 'F1', 6, 'Available', 3),
(27, 'F2', 6, 'Reserved', 3),
(28, 'F3', 6, 'Unavailable', 3),
(29, 'F4', 6, 'Available', 3),
(30, 'F5', 6, 'Available', 3),
(31, 'G1', 7, 'Available', 1),
(32, 'G2', 7, 'Reserved', 1),
(33, 'G3', 7, 'Available', 1),
(34, 'G4', 7, 'Unavailable', 1),
(35, 'G5', 7, 'Available', 1),
(36, 'H1', 8, 'Available', 2),
(37, 'H2', 8, 'Reserved', 2),
(38, 'H3', 8, 'Unavailable', 2),
(39, 'H4', 8, 'Available', 2),
(40, 'H5', 8, 'Available', 2),
(41, 'I1', 9, 'Available', 3),
(42, 'I2', 9, 'Reserved', 3),
(43, 'I3', 9, 'Available', 3),
(44, 'I4', 9, 'Unavailable', 3),
(45, 'I5', 9, 'Available', 3),
(46, 'J1', 10, 'Available', 1),
(47, 'J2', 10, 'Reserved', 1),
(48, 'J3', 10, 'Unavailable', 1),
(49, 'J4', 10, 'Available', 1),
(50, 'J5', 10, 'Available', 1);


CREATE TABLE payment(
payment_id INT PRIMARY KEY,
booking_id INT UNIQUE,
amount FLOAT CHECK(amount > 0),
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
railway_id INT,
payment_mode ENUM('Cash', 'Card', 'UPI', 'NetBanking') NOT NULL DEFAULT 'Cash',
transaction_id VARCHAR(50) UNIQUE,
status ENUM('Success', 'Pending', 'Failed') DEFAULT 'Success',
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id),
FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);

INSERT INTO payment (payment_id, booking_id, amount, railway_id, payment_mode, transaction_id, status) VALUES
(1, 1, 500.50, 1, 'UPI', 'TXN1001', 'Success'),
(2, 2, 750.00, 2, 'Card', 'TXN1002', 'Success'),
(3, 3, 1200.75, 3, 'NetBanking', 'TXN1003', 'Success'),
(4, 4, 650.00, 1, 'Cash', 'TXN1004', 'Success'),
(5, 5, 900.25, 2, 'UPI', 'TXN1005', 'Pending'),
(6, 6, 450.00, 3, 'Card', 'TXN1006', 'Success'),
(7, 7, 1100.00, 1, 'NetBanking', 'TXN1007', 'Success'),
(8, 8, 800.50, 2, 'UPI', 'TXN1008', 'Failed'),
(9, 9, 1300.75, 3, 'Card', 'TXN1009', 'Success'),
(10, 10, 700.00, 1, 'Cash', 'TXN1010', 'Success'),
(11, 11, 950.25, 2, 'UPI', 'TXN1011', 'Success'),
(12, 12, 500.50, 3, 'Card', 'TXN1012', 'Success'),
(13, 13, 1150.00, 1, 'NetBanking', 'TXN1013', 'Success'),
(14, 14, 600.75, 2, 'UPI', 'TXN1014', 'Failed'),
(15, 15, 1250.50, 3, 'Card', 'TXN1015', 'Success'),
(16, 16, 700.00, 1, 'Cash', 'TXN1016', 'Success'),
(17, 17, 850.25, 2, 'UPI', 'TXN1017', 'Success'),
(18, 18, 450.50, 3, 'Card', 'TXN1018', 'Pending'),
(19, 19, 1050.00, 1, 'NetBanking', 'TXN1019', 'Success'),
(20, 20, 900.75, 2, 'UPI', 'TXN1020', 'Success'),
(21, 21, 1200.50, 3, 'Card', 'TXN1021', 'Success'),
(22, 22, 650.00, 1, 'Cash', 'TXN1022', 'Failed'),
(23, 23, 800.25, 2, 'UPI', 'TXN1023', 'Success'),
(24, 24, 1100.50, 3, 'NetBanking', 'TXN1024', 'Success'),
(25, 25, 700.00, 1, 'Card', 'TXN1025', 'Success'),
(26, 26, 950.75, 2, 'UPI', 'TXN1026', 'Pending'),
(27, 27, 500.50, 3, 'Cash', 'TXN1027', 'Success'),
(28, 28, 1150.25, 1, 'NetBanking', 'TXN1028', 'Success'),
(29, 29, 600.00, 2, 'UPI', 'TXN1029', 'Success'),
(30, 30, 1250.50, 3, 'Card', 'TXN1030', 'Success'),
(31, 31, 700.75, 1, 'UPI', 'TXN1031', 'Failed'),
(32, 32, 850.50, 2, 'Card', 'TXN1032', 'Success'),
(33, 33, 450.00, 3, 'Cash', 'TXN1033', 'Success'),
(34, 34, 1050.25, 1, 'NetBanking', 'TXN1034', 'Success'),
(35, 35, 900.50, 2, 'UPI', 'TXN1035', 'Success'),
(36, 36, 1200.00, 3, 'Card', 'TXN1036', 'Pending'),
(37, 37, 650.75, 1, 'Cash', 'TXN1037', 'Success'),
(38, 38, 800.50, 2, 'UPI', 'TXN1038', 'Success'),
(39, 39, 1100.25, 3, 'NetBanking', 'TXN1039', 'Success'),
(40, 40, 700.00, 1, 'Card', 'TXN1040', 'Failed'),
(41, 41, 950.50, 2, 'UPI', 'TXN1041', 'Success'),
(42, 42, 500.75, 3, 'Cash', 'TXN1042', 'Success'),
(43, 43, 1150.00, 1, 'NetBanking', 'TXN1043', 'Success'),
(44, 44, 600.25, 2, 'UPI', 'TXN1044', 'Success'),
(45, 45, 1250.50, 3, 'Card', 'TXN1045', 'Success'),
(46, 46, 700.00, 1, 'UPI', 'TXN1046', 'Success'),
(47, 47, 850.25, 2, 'Card', 'TXN1047', 'Pending'),
(48, 48, 450.50, 3, 'Cash', 'TXN1048', 'Success'),
(49, 49, 1050.00, 1, 'NetBanking', 'TXN1049', 'Success'),
(50, 50, 900.75, 2, 'UPI', 'TXN1050', 'Success');



CREATE TABLE luggage(
luggage_id INT PRIMARY KEY,
passenger_id INT UNIQUE,
weight FLOAT CHECK(weight >= 0),
type ENUM('Personal', 'Commercial'),
railway_id INT,
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id),
FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id)
);

INSERT INTO luggage (luggage_id, passenger_id, weight, type, railway_id) VALUES
(1, 1, 12.5, 'Personal', 1),
(2, 2, 20.0, 'Commercial', 2),
(3, 3, 7.5, 'Personal', 3),
(4, 4, 15.0, 'Commercial', 1),
(5, 5, 10.0, 'Personal', 2),
(6, 6, 25.0, 'Commercial', 3),
(7, 7, 8.5, 'Personal', 1),
(8, 8, 18.0, 'Commercial', 2),
(9, 9, 12.0, 'Personal', 3),
(10, 10, 22.5, 'Commercial', 1),
(11, 11, 14.0, 'Personal', 2),
(12, 12, 30.0, 'Commercial', 3),
(13, 13, 6.5, 'Personal', 1),
(14, 14, 20.0, 'Commercial', 2),
(15, 15, 9.0, 'Personal', 3),
(16, 16, 24.0, 'Commercial', 1),
(17, 17, 11.0, 'Personal', 2),
(18, 18, 28.0, 'Commercial', 3),
(19, 19, 13.5, 'Personal', 1),
(20, 20, 19.0, 'Commercial', 2),
(21, 21, 16.0, 'Personal', 3),
(22, 22, 35.0, 'Commercial', 1),
(23, 23, 7.5, 'Personal', 2),
(24, 24, 21.0, 'Commercial', 3),
(25, 25, 10.5, 'Personal', 1),
(26, 26, 26.0, 'Commercial', 2),
(27, 27, 12.0, 'Personal', 3),
(28, 28, 18.5, 'Commercial', 1),
(29, 29, 14.0, 'Personal', 2),
(30, 30, 22.0, 'Commercial', 3),
(31, 31, 9.5, 'Personal', 1),
(32, 32, 25.0, 'Commercial', 2),
(33, 33, 11.0, 'Personal', 3),
(34, 34, 30.0, 'Commercial', 1),
(35, 35, 15.0, 'Personal', 2),
(36, 36, 20.0, 'Commercial', 3),
(37, 37, 8.0, 'Personal', 1),
(38, 38, 18.0, 'Commercial', 2),
(39, 39, 13.0, 'Personal', 3),
(40, 40, 24.0, 'Commercial', 1),
(41, 41, 10.0, 'Personal', 2),
(42, 42, 28.0, 'Commercial', 3),
(43, 43, 12.5, 'Personal', 1),
(44, 44, 22.0, 'Commercial', 2),
(45, 45, 14.0, 'Personal', 3),
(46, 46, 26.0, 'Commercial', 1),
(47, 47, 9.0, 'Personal', 2),
(48, 48, 20.0, 'Commercial', 3),
(49, 49, 11.5, 'Personal', 1),
(50, 50, 24.0, 'Commercial', 2);


CREATE TABLE maintenance(
maintenance_id INT PRIMARY KEY,
train_id INT UNIQUE,
last_service_date DATE NOT NULL,
next_due_date DATE,
railway_id INT,
FOREIGN KEY (railway_id) REFERENCES railway_main(railway_id),
FOREIGN KEY (train_id) REFERENCES train(train_id)
);

INSERT INTO maintenance (maintenance_id, train_id, last_service_date, next_due_date, railway_id) VALUES
(1, 1, '2025-06-10', '2025-12-10', 1),
(2, 2, '2025-05-15', '2025-11-15', 2),
(3, 3, '2025-04-20', '2025-10-20', 3),
(4, 4, '2025-03-25', '2025-09-25', 1),
(5, 5, '2025-02-10', '2025-08-10', 2),
(6, 6, '2025-01-18', '2025-07-18', 3),
(7, 7, '2025-06-05', '2025-12-05', 1),
(8, 8, '2025-05-12', '2025-11-12', 2),
(9, 9, '2025-04-18', '2025-10-18', 3),
(10, 10, '2025-03-20', '2025-09-20', 1),
(11, 11, '2025-02-25', '2025-08-25', 2),
(12, 12, '2025-01-30', '2025-07-30', 3),
(13, 13, '2025-06-01', '2025-12-01', 1),
(14, 14, '2025-05-08', '2025-11-08', 2),
(15, 15, '2025-04-15', '2025-10-15', 3),
(16, 16, '2025-03-10', '2025-09-10', 1),
(17, 17, '2025-02-05', '2025-08-05', 2),
(18, 18, '2025-01-12', '2025-07-12', 3),
(19, 19, '2025-06-12', '2025-12-12', 1),
(20, 20, '2025-05-18', '2025-11-18', 2),
(21, 21, '2025-04-22', '2025-10-22', 3),
(22, 22, '2025-03-28', '2025-09-28', 1),
(23, 23, '2025-02-15', '2025-08-15', 2),
(24, 24, '2025-01-20', '2025-07-20', 3),
(25, 25, '2025-06-08', '2025-12-08', 1),
(26, 26, '2025-05-10', '2025-11-10', 2),
(27, 27, '2025-04-12', '2025-10-12', 3),
(28, 28, '2025-03-15', '2025-09-15', 1),
(29, 29, '2025-02-18', '2025-08-18', 2),
(30, 30, '2025-01-22', '2025-07-22', 3),
(31, 31, '2025-06-14', '2025-12-14', 1),
(32, 32, '2025-05-16', '2025-11-16', 2);

-- Fetching the data using the Clauses 
-- TASK 1: Retrieve all details of all trains in the system.
SELECT * FROM ismatdb.train;

-- TASK 2: Fetch the names and cities of all stations.
SELECT station_name,city FROM ismatdb.station;

-- TASK 3: List all passengers whose age is greater than 30.
SELECT * FROM ismatdb.passenger
WHERE age > 30;

-- TASK 4: Find all employees with salary greater than 50,000.
SELECT * FROM ismatdb.employee
WHERE salary > 50000;

-- TASK 5: Get all tickets with fare between 500 and 2000.
SELECT * FROM ticket
WHERE fare BETWEEN 500 AND 2000;

-- TASK  6: Retrieve all routes that are longer than 500 km.
SELECT * FROM ismatdb.route 
WHERE distance_km > 500;

-- TASK 7: List all coaches of type 'AC'.
SELECT * FROM ismatdb.coach 
WHERE coach_type = 'AC';

-- TASK 8: Show all luggage entries where weight is more than 50 kg.
SELECT * FROM ismatdb.luggage
WHERE weight > 50;

-- TASK 9: Display the top 5 most expensive tickets.
SELECT ticket_id,ticket_number,booking_date,fare 
FROM ismatdb.ticket
ORDER BY fare DESC
LIMIT 5;

-- TASK 10: List all trains in ascending order of capacity.
SELECT * FROM ismatdb.train
ORDER BY capacity ASC;

-- TASK 11: Show all passengers ordered by name alphabetically.
SELECT * FROM ismatdb.passenger 
ORDER BY name ASC;

-- TASK 12: Retrieve all employees ordered by salary in descending order.
SELECT * FROM ismatdb.employee 
ORDER BY salary DESC;

-- TASK 13: Count the number of unique train names.
SELECT DISTINCT train_name,COUNT(*) AS 'unique_train_count' 
FROM ismatdb.train
GROUP BY train_name;

-- TASK 14: Find distinct types of employees in the railway.
SELECT DISTINCT emp_name 
FROM ismatdb.employee;

-- TASK 15: Count the number of stations in each city.
SELECT city,COUNT(*) AS 'no_of_station' 
FROM ismatdb.station
GROUP BY city;

-- TASK 16: List distinct routes that are connected to the same railway.
SELECT DISTINCT railway_id, route_id, source_station, destination_station
FROM route;

-- TASK 17: List all passengers along with their ticket details.
SELECT p.name,p.age,p.gender,
t.ticket_number,t.fare,t.booking_date 
FROM ismatdb.passenger p 
INNER JOIN ismatdb.ticket t 
ON p.railway_id = t.railway_id;

-- TASK 18: Show all bookings along with payment amounts and dates.
SELECT * FROM booking;
SELECT * FROM payment;
SELECT b.booking_id, b.seat_no, p.amount, p.payment_date
FROM booking b
JOIN payment p ON b.booking_id = p.booking_id;

-- TASK 19: Get all trains with their schedules (train_name + departure_time).
SELECT * FROM train;
SELECT * FROM schedule;
SELECT t.train_number,t.train_name,s.departure_time
FROM train t 
INNER JOIN schedule s
ON t.train_id = s.train_id;

-- TASK 20: Fetch all routes along with the trains running on them.
SELECT * FROM route;
SELECT * FROM train;
SELECT * FROM schedule;
SELECT r.route_id, r.source_station, r.destination_station, t.train_name
FROM route r
JOIN schedule s ON r.route_id = s.route_id
JOIN train t ON s.train_id = t.train_id;

-- TASK 21: Retrieve all coaches along with the seats in them.
SELECT * FROM coach;
SELECT * FROM seat;
SELECT c.coach_id, c.coach_number, s.seat_id, s.seat_number
FROM coach c
JOIN seat s ON c.coach_id = s.coach_id;

-- TASK 22: Show all stations along with the platforms available.
SELECT * FROM station;
SELECT * FROM platform;
SELECT s.station_name,s.city,p.platform_number
FROM ismatdb.station s
INNER JOIN ismatdb.platform p 
ON s.station_id = p.station_id;

-- TASK 23: List all employees along with their railway headquarters.
SELECT * FROM ismatdb.employee;
SELECT * FROM ismatdb.railway_main;
SELECT e.emp_name,e.emp_type,r.headquarters 
FROM ismatdb.employee e
INNER JOIN ismatdb.railway_main r 
ON e.railway_id = r.railway_id;

-- TASK 24: Find total number of tickets booked per railway.
SELECT r.railway_name,COUNT(t.ticket_id) AS 'total_tickets' 
FROM ismatdb.railway_main r
INNER JOIN ismatdb.ticket t
ON r.railway_id = t.railway_id
GROUP BY r.railway_name;


-- TASK 25: Calculate the average fare of tickets per railway.
SELECT r.railway_name,AVG(t.fare) AS 'avg_fare'
FROM ismatdb.railway_main r
INNER JOIN ismatdb.ticket t
ON r.railway_id = t.railway_id
GROUP BY r.railway_name;

-- TASK 26: Find the total luggage weight for each passenger.
SELECT * FROM ismatdb.luggage;
SELECT * FROM ismatdb.passenger;
SELECT p.passenger_id, p.name, SUM(l.weight) AS total_weight
FROM passenger p
JOIN luggage l ON p.passenger_id = l.passenger_id
GROUP BY p.passenger_id, p.name;

-- TASK 27: Count the number of seats available per coach.
SELECT c.coach_id, c.coach_number, COUNT(s.seat_id) AS seat_count
FROM coach c
JOIN seat s ON c.coach_id = s.coach_id
GROUP BY c.coach_id, c.coach_number;

-- TASK 28: Find the number of employees per type ('Driver', 'Guard', 'Manager').
SELECT e.emp_type,COUNT(*) AS 'COUNT'
FROM ismatdb.employee e
GROUP BY e.emp_type;

-- TASK 29: Calculate the total revenue from payments per railway.
SELECT r.railway_id,SUM(p.amount) AS 'total_revenue' 
FROM payment p 
INNER JOIN railway_main r 
ON r.railway_id = p.payment_id
GROUP BY r.railway_id;

-- TASK 30: Find the average age of passengers grouped by gender.
SELECT DISTINCT p.gender,AVG(p.age) AS 'avg_age' 
FROM passenger p
GROUP BY p.gender;

-- TASK 31: List railways having more than 3 trains.
SELECT rm.railway_name, COUNT(t.train_id) AS total_trains
FROM train t
JOIN railway_main rm ON t.railway_id = rm.railway_id
GROUP BY rm.railway_name
HAVING COUNT(t.train_id) > 3;

-- TASK 32: Find stations having more than 3 platforms.
SELECT st.station_name, COUNT(p.platform_id) AS total_platforms
FROM station st
JOIN platform p ON st.station_id = p.station_id
GROUP BY st.station_name
HAVING COUNT(p.platform_id) > 3;

-- TASK 33: Show coaches having more than 50 seats.
SELECT c.coach_number, COUNT(s.seat_id) AS total_seats
FROM coach c
JOIN seat s ON c.coach_id = s.coach_id
GROUP BY c.coach_number
HAVING COUNT(s.seat_id) > 50;

-- TASK 34: Display passengers who have booked more than 1 ticket.
SELECT p.passenger_id, p.name, COUNT(b.booking_id) AS total_bookings
FROM passenger p
JOIN booking b ON p.passenger_id = b.passenger_id
GROUP BY p.passenger_id, p.name
HAVING COUNT(b.booking_id) > 1;

-- TASK 35: Find all passengers who have booked tickets on 'AC' coaches.
SELECT DISTINCT p.passenger_id, p.name
FROM passenger p
JOIN booking b ON p.passenger_id = b.passenger_id
JOIN ticket t ON b.ticket_id = t.ticket_id
JOIN coach c ON c.train_id = t.railway_id 
WHERE c.coach_type = 'AC';

-- TASK 36: Retrieve trains that have undergone maintenance in the last 6 months.
SELECT t.train_id, t.train_name, m.last_service_date
FROM train t
JOIN maintenance m ON t.train_id = m.train_id
WHERE m.last_service_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- TASK 37: Get the total fare collected per route.
SELECT r.route_id, r.source_station, r.destination_station, SUM(t.fare) AS total_fare
FROM route r
JOIN schedule s ON r.route_id = s.route_id
JOIN train tr ON s.train_id = tr.train_id
JOIN ticket t ON tr.railway_id = t.railway_id
GROUP BY r.route_id, r.source_station, r.destination_station;

-- TASK 38: List all passengers along with luggage details and railway name.
SELECT p.passenger_id, p.name, l.weight, l.type, rm.railway_name
FROM passenger p
LEFT JOIN luggage l ON p.passenger_id = l.passenger_id
JOIN railway_main rm ON p.railway_id = rm.railway_id;

-- TASK 39: Fetch all trains, their routes, and the total number of seats in their coaches.
SELECT tr.train_id, tr.train_name, r.source_station, r.destination_station,
COUNT(s.seat_id) AS total_seats
FROM train tr
JOIN schedule sc ON tr.train_id = sc.train_id
JOIN route r ON sc.route_id = r.route_id
JOIN coach c ON tr.train_id = c.train_id
JOIN seat s ON c.coach_id = s.coach_id
GROUP BY tr.train_id, tr.train_name, r.source_station, r.destination_station;

-- TASK 40: Find the top 3 railways generating the highest ticket revenue.
SELECT rm.railway_name, SUM(p.amount) AS total_revenue
FROM payment p
JOIN booking b ON p.booking_id = b.booking_id
JOIN railway_main rm ON b.railway_id = rm.railway_id
GROUP BY rm.railway_name
ORDER BY total_revenue DESC
LIMIT 3;