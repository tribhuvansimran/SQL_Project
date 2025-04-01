-- Create the Criminal Database
CREATE DATABASE CriminalDB;

-- Use the newly created database
USE CriminalDB;

CREATE TABLE Criminals (
    criminal_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    address VARCHAR(200),
    crime_history TEXT
);

INSERT INTO Criminals VALUES
(1, 'John Doe', 32, 'Male', '123 Elm St', 'Theft, Assault'),
(2, 'Jane Smith', 28, 'Female', '456 Maple St', 'Fraud'),
(3, 'Robert Brown', 45, 'Male', '789 Oak St', 'Murder'),
(4, 'Emily Davis', 38, 'Female', '101 Pine St', 'Drug trafficking'),
(5, 'Michael Johnson', 50, 'Male', '202 Birch St', 'Burglary'),
(6, 'Sophia Lee', 22, 'Female', '303 Cedar St', 'Robbery'),
(7, 'David Harris', 30, 'Male', '404 Willow St', 'Assault'),
(8, 'Olivia Martinez', 25, 'Female', '505 Cherry St', 'Theft'),
(9, 'Daniel White', 40, 'Male', '606 Ash St', 'Fraud'),
(10, 'Isabella Moore', 33, 'Female', '707 Maple Ave', 'Arson'),
(11, 'James Black', 27, 'Male', '808 Oak Ave', 'Kidnapping'),
(12, 'Charlotte Wilson', 36, 'Female', '909 Elm Ave', 'Murder'),
(13, 'Liam Clark', 24, 'Male', '101 Cedar Ave', 'Robbery'),
(14, 'Amelia Lewis', 29, 'Female', '202 Birch Ave', 'Assault'),
(15, 'Benjamin Hall', 41, 'Male', '303 Willow Ave', 'Burglary');

-- 2. Offenses Table
CREATE TABLE Offenses (
    offense_id INT PRIMARY KEY,
    criminal_id INT,
    offense_type VARCHAR(100),
    date_committed DATE,
    FOREIGN KEY (criminal_id) REFERENCES Criminals(criminal_id)
);

INSERT INTO Offenses VALUES
(1, 1, 'Theft', '2024-01-15'),
(2, 2, 'Fraud', '2023-12-10'),
(3, 3, 'Murder', '2024-02-05'),
(4, 4, 'Drug trafficking', '2024-03-21'),
(5, 5, 'Burglary', '2024-04-08'),
(6, 6, 'Robbery', '2024-01-10'),
(7, 7, 'Assault', '2024-05-13'),
(8, 8, 'Theft', '2024-07-19'),
(9, 9, 'Fraud', '2024-08-22'),
(10, 10, 'Arson', '2024-09-12'),
(11, 11, 'Kidnapping', '2024-10-05'),
(12, 12, 'Murder', '2024-11-25'),
(13, 13, 'Robbery', '2024-03-03'),
(14, 14, 'Assault', '2024-06-17'),
(15, 15, 'Burglary', '2024-02-14');

-- 3. Police Table
CREATE TABLE Police (
    officer_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    department VARCHAR(100)
);

INSERT INTO Police VALUES
(1, 'Officer A', 'Sergeant', 'Criminal Investigations'),
(2, 'Officer B', 'Detective', 'Fraud Division'),
(3, 'Officer C', 'Constable', 'Homicide'),
(4, 'Officer D', 'Inspector', 'Narcotics'),
(5, 'Officer E', 'Sergeant', 'Robbery Unit'),
(6, 'Officer F', 'Detective', 'Theft Division'),
(7, 'Officer G', 'Lieutenant', 'Cyber Crimes'),
(8, 'Officer H', 'Detective', 'Gang Crimes'),
(9, 'Officer I', 'Constable', 'Special Operations'),
(10, 'Officer J', 'Inspector', 'Fire Safety'),
(11, 'Officer K', 'Lieutenant', 'Human Trafficking'),
(12, 'Officer L', 'Sergeant', 'Violent Crimes'),
(13, 'Officer M', 'Detective', 'Homicide'),
(14, 'Officer N', 'Inspector', 'Narcotics'),
(15, 'Officer O', 'Constable', 'Criminal Intelligence');

-- 4. Cases Table
CREATE TABLE Cases (
    case_id INT PRIMARY KEY,
    criminal_id INT,
    officer_id INT,
    case_status VARCHAR(50),
    case_type VARCHAR(100),
    date_reported DATE,
    FOREIGN KEY (criminal_id) REFERENCES Criminals(criminal_id),
    FOREIGN KEY (officer_id) REFERENCES Police(officer_id)
);

INSERT INTO Cases VALUES
(1, 1, 1, 'Open', 'Theft', '2024-01-16'),
(2, 2, 2, 'Closed', 'Fraud', '2023-12-12'),
(3, 3, 3, 'Open', 'Murder', '2024-02-06'),
(4, 4, 4, 'Closed', 'Drug trafficking', '2024-03-22'),
(5, 5, 5, 'Open', 'Burglary', '2024-04-09'),
(6, 6, 6, 'Closed', 'Robbery', '2024-01-11'),
(7, 7, 7, 'Open', 'Assault', '2024-05-14'),
(8, 8, 8, 'Closed', 'Theft', '2024-07-20'),
(9, 9, 9, 'Open', 'Fraud', '2024-08-23'),
(10, 10, 10, 'Closed', 'Arson', '2024-09-13'),
(11, 11, 11, 'Open', 'Kidnapping', '2024-10-06'),
(12, 12, 12, 'Closed', 'Murder', '2024-11-26'),
(13, 13, 13, 'Open', 'Robbery', '2024-03-04'),
(14, 14, 14, 'Closed', 'Assault', '2024-06-18'),
(15, 15, 15, 'Open', 'Burglary', '2024-02-15');

-- 5. Court Table
CREATE TABLE Court (
    court_id INT PRIMARY KEY,
    case_id INT,
    court_name VARCHAR(100),
    judge_name VARCHAR(100),
    court_date DATE,
    FOREIGN KEY (case_id) REFERENCES Cases(case_id)
);

INSERT INTO Court VALUES
(1, 1, 'District Court A', 'Judge X', '2024-01-20'),
(2, 2, 'High Court B', 'Judge Y', '2023-12-15'),
(3, 3, 'District Court C', 'Judge Z', '2024-02-10'),
(4, 4, 'High Court D', 'Judge W', '2024-03-25'),
(5, 5, 'District Court E', 'Judge V', '2024-04-12'),
(6, 6, 'High Court F', 'Judge U', '2024-01-15'),
(7, 7, 'District Court G', 'Judge T', '2024-05-20'),
(8, 8, 'High Court H', 'Judge S', '2024-07-25'),
(9, 9, 'District Court I', 'Judge R', '2024-08-28'),
(10, 10, 'High Court J', 'Judge Q', '2024-09-15'),
(11, 11, 'District Court K', 'Judge P', '2024-10-07'),
(12, 12, 'High Court L', 'Judge O', '2024-11-30'),
(13, 13, 'District Court M', 'Judge N', '2024-03-10'),
(14, 14, 'High Court N', 'Judge M', '2024-06-22'),
(15, 15, 'District Court O', 'Judge L', '2024-02-16');

-- 6. Sentences Table
CREATE TABLE Sentences (
    sentence_id INT PRIMARY KEY,
    case_id INT,
    sentence_type VARCHAR(100),
    sentence_duration INT,  -- in years
    date_issued DATE,
    FOREIGN KEY (case_id) REFERENCES Cases(case_id)
);

INSERT INTO Sentences VALUES
(1, 1, 'Imprisonment', 5, '2024-01-22'),
(2, 2, 'Fine', 0, '2023-12-17'),
(3, 3, 'Death Penalty', 0, '2024-02-12'),
(4, 4, 'Imprisonment', 7, '2024-03-28'),
(5, 5, 'Probation', 3, '2024-04-15'),
(6, 6, 'Imprisonment', 2, '2024-01-18'),
(7, 7, 'Fine', 0, '2024-05-18'),
(8, 8, 'Imprisonment', 4, '2024-07-22'),
(9, 9, 'Imprisonment', 5, '2024-08-25'),
(10, 10, 'Imprisonment', 6, '2024-09-20'),
(11, 11, 'Death Penalty', 0, '2024-10-10'),
(12, 12, 'Imprisonment', 10, '2024-11-29'),
(13, 13, 'Imprisonment', 4, '2024-03-14'),
(14, 14, 'Fine', 0, '2024-06-25'),
(15, 15, 'Imprisonment', 8, '2024-02-20');

-- 7. Victims Table
CREATE TABLE Victims (
    victim_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    address VARCHAR(200),
    crime_type VARCHAR(100),
    date_of_incident DATE
);

INSERT INTO Victims VALUES
(1, 'Alice Green', 29, 'Female', '124 Oak St', 'Theft', '2024-01-14'),
(2, 'Charlie White', 34, 'Male', '567 Pine St', 'Fraud', '2023-12-09'),
(3, 'Megan Red', 25, 'Female', '890 Birch St', 'Murder', '2024-02-04'),
(4, 'George Blue', 41, 'Male', '112 Cedar St', 'Drug trafficking', '2024-03-20'),
(5, 'Victoria Yellow', 30, 'Female', '345 Willow St', 'Burglary', '2024-04-07'),
(6, 'Ethan Black', 23, 'Male', '678 Maple Ave', 'Robbery', '2024-01-09'),
(7, 'Isabella Gray', 38, 'Female', '901 Ash St', 'Assault', '2024-05-12'),
(8, 'Sophia Pink', 33, 'Female', '234 Oak Ave', 'Theft', '2024-07-18'),
(9, 'Liam Brown', 45, 'Male', '567 Cedar Ave', 'Fraud', '2024-08-21'),
(10, 'Olivia Gold', 29, 'Female', '678 Birch Ave', 'Arson', '2024-09-11'),
(11, 'Ryan Silver', 31, 'Male', '789 Willow Ave', 'Kidnapping', '2024-10-04'),
(12, 'Ella Copper', 24, 'Female', '890 Ash Ave', 'Murder', '2024-11-24'),
(13, 'Lucas Green', 28, 'Male', '101 Cedar Ave', 'Robbery', '2024-03-02'),
(14, 'Ava White', 27, 'Female', '102 Oak Ave', 'Assault', '2024-06-16'),
(15, 'Noah Blue', 35, 'Male', '103 Birch Ave', 'Burglary', '2024-02-13');

# Problem: Find the details of all criminals who have committed 'Theft'.
SELECT * FROM Criminals WHERE crime_history LIKE '%Theft%';

# Problem: Retrieve all cases where the status is 'Open'.
SELECT * FROM Cases WHERE case_status = 'Open';

# Problem: Get the names of all police officers who are assigned to the 'Fraud Division'.
SELECT name FROM Police WHERE department = 'Fraud Division';

# roblem: List all the criminals who are assigned to the 'District Court A'.
SELECT Criminals.name FROM Criminals
JOIN Cases ON Criminals.criminal_id = Cases.criminal_id
JOIN Court ON Cases.case_id = Court.case_id
WHERE Court.court_name = 'District Court A';

# Problem: Find the total number of victims who have been assaulted.
SELECT COUNT(*) FROM Victims WHERE crime_type = 'Assault';

# Problem: Get all court details for cases reported after '2024-01-01'.
SELECT * FROM Court WHERE court_date > '2024-01-01';

# Problem: List all the sentences issued for 'Imprisonment'.
SELECT * FROM Sentences WHERE sentence_type = 'Imprisonment';

# Problem: Find the case details for all 'Murder' cases.
SELECT * FROM Cases WHERE case_type = 'Murder';

# Problem: Retrieve the criminal information for those convicted in 'High Court' courts.
SELECT Criminals.name FROM Criminals
JOIN Cases ON Criminals.criminal_id = Cases.criminal_id
JOIN Court ON Cases.case_id = Court.case_id
WHERE Court.court_name LIKE '%High Court%';

# Problem: Get the names of criminals who have committed both 'Robbery' and 'Assault'.
SELECT name FROM Criminals WHERE crime_history LIKE '%Robbery%' AND crime_history LIKE '%Assault%';

# Problem: Find the criminals whose cases have a 'Closed' status and have received a 'Fine' sentence.
SELECT Criminals.name FROM Criminals
JOIN Cases ON Criminals.criminal_id = Cases.criminal_id
JOIN Sentences ON Cases.case_id = Sentences.case_id
WHERE Cases.case_status = 'Closed' AND Sentences.sentence_type = 'Fine';

# Problem: List all the cases handled by the officer 'Officer A'.
SELECT * FROM Cases WHERE officer_id = 1;



























