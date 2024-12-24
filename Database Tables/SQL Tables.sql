create database DBMS_Proje;

use DBMS_Proje;

-- University Table
CREATE TABLE University (
    UNI_ID INT PRIMARY KEY,
    UNI_NAME VARCHAR(50) NOT NULL
);
-- Institute Table
CREATE TABLE Institute (
    INS_ID INT PRIMARY KEY,
    INS_NAME VARCHAR(45) NOT NULL,
    UNI_ID INT NOT NULL,
    FOREIGN KEY (UNI_ID) REFERENCES University(UNI_ID)
);
-- Author Table
CREATE TABLE Author (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(60) NOT NULL,
    AUTHOR_PASSWORD INT
);
-- Laguage Table
CREATE TABLE Language (
    LANG_NAME VARCHAR(20) PRIMARY KEY
);

-- Co-Supervisor Table
CREATE TABLE Co_Supervisor (
    CSV_ID INT PRIMARY KEY,
    CSV_NAME VARCHAR(60)
);

-- Thesis Table
CREATE TABLE Thesis (
    THES_NO INT PRIMARY KEY,
    THES_TITLE VARCHAR(500) NOT NULL,
    THES_ABS VARCHAR(5000) NOT NULL,
    AUTHOR_ID INT NOT NULL,
	CSV_ID INT,
    THES_YEAR INT NOT NULL,
    THES_TYPE VARCHAR(50) NOT NULL,
    UNI_ID INT NOT NULL,
    INS_ID INT NOT NULL,
    THES_NOP INT NOT NULL,
    LANG_NAME VARCHAR(20) NOT NULL,
    THES_SUBDATE DATE NOT NULL,
    FOREIGN KEY (LANG_NAME) REFERENCES Language(LANG_NAME),
    FOREIGN KEY (AUTHOR_ID) REFERENCES Author(AUTHOR_ID),
	FOREIGN KEY (CSV_ID) REFERENCES Co_Supervisor(CSV_ID),
    FOREIGN KEY (UNI_ID) REFERENCES University(UNI_ID),
    FOREIGN KEY (INS_ID) REFERENCES Institute(INS_ID),
    UNIQUE (AUTHOR_ID, UNI_ID, INS_ID)
);


-- Subject Topic Table
CREATE TABLE Subject_Topic (
    SUBJECT_TOPIC_ID INT PRIMARY KEY,
    SUBJECT_TOPIC_NAME VARCHAR(45) NOT NULL,
    THES_NO INT NOT NULL,
    FOREIGN KEY (THES_NO) REFERENCES Thesis(THES_NO)
);
-- Keywords Table
CREATE TABLE Keyword (
    KEYWORD_ID INT PRIMARY KEY,
    KEYWORD_NAME VARCHAR(45) NOT NULL,
    THES_NO INT NOT NULL,
    FOREIGN KEY (THES_NO) REFERENCES Thesis(THES_NO)
);

-- Supervisor Table
CREATE TABLE Supervisor (
    SV_ID INT PRIMARY KEY,
    SV_NAME VARCHAR(50) NOT NULL
);

-- Middle Table
CREATE TABLE Thes_SV (
    SV_ID INT,
    THES_NO INT,
    PRIMARY KEY (SV_ID,THES_NO),
    FOREIGN KEY (SV_ID) REFERENCES Supervisor(SV_ID),
    FOREIGN KEY (THES_NO) REFERENCES Thesis(THES_NO)
);

INSERT INTO University (UNI_ID, UNI_NAME)
VALUES
(1, 'Maltepe University'),
(2, 'Marmara University'),
(3, 'Elazig University'),
(4, 'Yeditepe University'),
(5, 'Basaksehir University');

INSERT INTO Institute (INS_ID, INS_NAME, UNI_ID)
VALUES
(111, 'Computer Science Institute', 1),
(112, 'Finance Institute', 2),
(113, 'Cybersecurity Institute', 1),
(114, 'Environmental Studies Institute', 3),
(115, 'Education Institute', 2);

INSERT INTO Author (AUTHOR_ID, AUTHOR_NAME, AUTHOR_PASSWORD)
VALUES
(101, 'Yahya', 123456),
(102, 'Egemen', 987654),
(103, 'Mehmet Ali', 543210),
(104, 'Esma', 111222),
(105, 'Ahmet', 333444);

INSERT INTO Language (LANG_NAME)
VALUES
('English'),
('Turkish'),
('France'),
('Dutch');

INSERT INTO Co_Supervisor (CSV_ID, CSV_Name)
VALUES
(1, 'Dr. Anderson'),
(2, 'Prof. Rodriguez'),
(3, 'Dr. Williams'),
(4, 'Prof. Davis'),
(5, 'Dr. Moore');

INSERT INTO Thesis (THES_NO, THES_TITLE, THES_ABS, AUTHOR_ID, CSV_ID, THES_YEAR, THES_TYPE, UNI_ID, INS_ID, THES_NOP, LANG_NAME, THES_SUBDATE)
VALUES
(1, 'Diagnosis and Treatment of Genetic Diseases', 'This thesis examines the developments in the diagnosis and treatment of genetic diseases.', 101, 2, 2022, 'Specialization in Medicine', 1, 111, 50, 'English', '2022-05-15'),
(2, 'Machine Learning in Finance', 'An analysis of machine learning algorithms in financial forecasting.', 102, 1, 2021, 'Master', 2, 112, 75, 'Turkish', '2021-12-10'),
(3, 'Cybersecurity Measures in IoT', 'Examining cybersecurity measures for Internet of Things devices.', 103, 3, 2023, 'Doctorate', 1, 113, 60, 'English', '2023-03-20'),
(4, 'Artificial Intelligence and Ethical Dilemmas', 'This thesis examines the ethical issues that arise with the increasing use of artificial intelligence.', 104, 4, 2022, 'Master', 3, 111, 45, 'France', '2022-08-28'),
(5, 'Augmented Reality in Education', 'The use of augmented reality for enhancing educational experiences.', 101, 5, 2023, 'Doctorate', 2, 112, 55, 'English', '2023-01-12');

INSERT INTO Subject_Topic (SUBJECT_TOPIC_ID, SUBJECT_TOPIC_NAME, THES_NO)
VALUES
(1, 'Genetic Diseases', 1),
(2, 'Machine Learning', 2),
(3, 'Cybersecurity', 3),
(4, 'Artificial Intelligence', 4),
(5, 'Augmented Reality', 5);

INSERT INTO Keyword (KEYWORD_ID, KEYWORD_NAME, THES_NO)
VALUES
(1, 'Healthcare', 1),
(2, 'Financial Forecasting', 2),
(3, 'IoT Security', 3),
(4, 'Artificial Intelligence Ethics', 4),
(5, 'Educational Technology', 5);


INSERT INTO Supervisor (SV_ID, SV_Name)
VALUES
(1, 'Assist. Prof. Dr. Volkan TUNALI'),
(2, 'Prof. Dr. Ensar GÜL'),
(3, 'Prof. Dr. Asaf VAROL'),
(4, 'Dr. Öðr. Üyesi Hüseyin AYGÜN'),
(5, 'Dr. Öðr. Üyesi Emre OLCA');

INSERT INTO Thes_SV (SV_ID,THES_NO)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);


SELECT * FROM Author;
SELECT * FROM Language;
SELECT * FROM University;
SELECT * FROM Institute;
SELECT * FROM Supervisor;
SELECT * FROM Co_Supervisor;
SELECT * FROM Subject_Topic;
SELECT * FROM Keyword;
SELECT * FROM Thesis;
SELECT * FROM Thes_SV;


SELECT * FROM ThesisDeneme;

SELECT
    t.THES_NO,
    t.THES_TITLE,
    t.THES_ABS,
    a.Author_Name AS Author_Name,
    csv.CSV_NAME AS Co_Supervisor_Name,
    s.SV_Name AS Supervisor_Name,
    t.THES_YEAR,
    t.THES_TYPE,
    u.UNI_Name AS University_Name,
    i.INS_Name AS Institute_Name,
    t.THES_NOP AS Number_of_Paages,
    l.LANG_NAME AS Language,
    t.THES_SUBDATE
FROM Thesis t
JOIN Thes_SV tsv ON t.THES_NO = tsv.THES_NO
JOIN Supervisor s ON tsv.SV_ID = s.SV_ID
JOIN Co_Supervisor csv ON t.CSV_ID = csv.CSV_ID
JOIN Author a ON t.AUTHOR_ID = a.AUTHOR_ID
JOIN University u ON t.UNI_ID = u.UNI_ID
JOIN Institute i ON t.INS_ID = i.INS_ID
JOIN Language l ON t.LANG_NAME = l.LANG_NAME;

SELECT
    s.SV_Name AS Supervisor_Name,
    t.THES_TITLE AS Thesis_Title
FROM Thes_SV tsv
JOIN Supervisor s ON tsv.SV_ID = s.SV_ID
JOIN Thesis t ON tsv.THES_NO = t.THES_NO;







-- Bütün değerler bir tabloda:
------------------------------------------------------------------------------------------------------
CREATE TABLE ThesisDeneme(
    THES_NO INT PRIMARY KEY,
    THES_TITLE VARCHAR(500) NOT NULL,
    THES_ABS VARCHAR(5000) NOT NULL,
    AUTHOR_NAME VARCHAR(50) NOT NULL,
	CSV_NAME VARCHAR(50),
    SV_NAME VARCHAR(50),
    THES_YEAR INT NOT NULL,
    THES_TYPE VARCHAR(50) NOT NULL,
    UNI_NAME VARCHAR(50) NOT NULL,
    INS_NAME VARCHAR(50) NOT NULL,
    THES_NOP INT NOT NULL,
    LANG_NAME VARCHAR(20) NOT NULL,
    THES_SUBDATE DATE NOT NULL,
);

INSERT INTO ThesisDeneme(THES_NO,THES_TITLE,THES_ABS,AUTHOR_NAME,CSV_NAME,SV_NAME,THES_YEAR,THES_TYPE,UNI_NAME,INS_NAME,THES_NOP,LANG_NAME,THES_SUBDATE)
SELECT
    t.THES_NO,
    t.THES_TITLE,
    t.THES_ABS,
    a.AUTHOR_NAME AS Author_Name,
    csv.CSV_NAME AS Co_Supervisor_Name,
    s.SV_Name AS Supervisor_Name,
    t.THES_YEAR,
    t.THES_TYPE,
    u.UNI_Name AS University_Name,
    i.INS_Name AS Institute_Name,
    t.THES_NOP AS Number_of_Paages,
    l.LANG_NAME AS Language,
    t.THES_SUBDATE
FROM Thesis t
JOIN Thes_SV tsv ON t.THES_NO = tsv.THES_NO
JOIN Supervisor s ON tsv.SV_ID = s.SV_ID
JOIN Co_Supervisor csv ON t.CSV_ID = csv.CSV_ID
JOIN Author a ON t.AUTHOR_ID = a.AUTHOR_ID
JOIN University u ON t.UNI_ID = u.UNI_ID
JOIN Institute i ON t.INS_ID = i.INS_ID
JOIN Language l ON t.LANG_NAME = l.LANG_NAME;
------------------------------------------------------------------------------------------------------------------------------------------------
