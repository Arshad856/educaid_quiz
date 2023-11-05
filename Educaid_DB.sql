CREATE DATABASE Educaid;
USE Educaid;
CREATE TABLE Student (Index_No CHAR(6),Name VARCHAR(30), Grade INT,Username VARCHAR(30),Password VARCHAR(150),E_mail VARCHAR(30), PRIMARY KEY(Index_No));
CREATE TABLE S_Subject (Subject_ID CHAR(6),Subject_Name VARCHAR(20), Grade INT, PRIMARY KEY(Subject_ID));
CREATE TABLE Teacher (Teacher_ID CHAR(6),Teacher_Name VARCHAR(30),Username VARCHAR(30),Password VARCHAR(150),E_mail VARCHAR(30), PRIMARY KEY(Teacher_ID));
CREATE TABLE Unit(Unit_ID CHAR(6),Unit_Name VARCHAR(50), Subject_ID CHAR(6),PRIMARY KEY(Unit_ID),FOREIGN KEY(Subject_ID) REFERENCES S_Subject(Subject_ID));
CREATE TABLE Sessions(Session_ID CHAR(6), Start_Time DATETIME, End_Time DATETIME, Student_Index_No CHAR(6), PRIMARY KEY(Session_ID), FOREIGN KEY(Student_Index_No) REFERENCES Student(Index_No));
CREATE TABLE Question_Answer(Q_ID CHAR(8), Question BLOB,Ans_1 BLOB, Ans_2 BLOB, Ans_3 BLOB, Ans_4 BLOB, Unit_ID CHAR(6), Teacher_ID CHAR(6), PRIMARY KEY(Q_ID), FOREIGN KEY(Unit_ID) REFERENCES Unit(Unit_ID), FOREIGN KEY(Teacher_ID) REFERENCES Teacher(Teacher_ID)); 
CREATE TABLE Stu_Q(Q_ID CHAR(8), Index_No CHAR(6), Attended_Time DATETIME, Correct_Wrong BOOLEAN, PRIMARY KEY(Q_ID, Index_No, Attended_Time), FOREIGN KEY(Q_ID) REFERENCES Question_Answer(Q_ID), FOREIGN KEY(Index_No) REFERENCES  Student (Index_No));