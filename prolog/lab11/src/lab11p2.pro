/*****************************************************************************

		Copyright (c) BMSTU

 Project:  LAB11
 FileName: LAB11P2.PRO
 Purpose: No description
 Written by: Maslova Marina
 Comments:
******************************************************************************/

domains
  studentID, universityID = integer.
  name, surname, phone = string.
  title = string.
  
predicates
  student(studentID, surname, name, phone).
  university(universityID, title).
  studentAt(studentID, universityID).
  studentInfo(universityID, title, surname, name, phone).
  studentUniversities(studentID, title).

clauses
  student(0,  "Maslova",    "Marina",    "+7-925-795-21-63").
  student(1,  "Khamzina",   "Regina",    "+7-912-794-22-64").
  student(2,  "Tsvetkov",   "Ivan",      "+7-913-793-23-62").
  student(3,  "Kovalets",   "Kirill",    "+7-914-792-24-65").
  student(4,  "Volkov",     "Michael",   "+7-915-791-25-61").
  student(5,  "Kishov",     "Gadgi",     "+7-916-790-26-66").
  student(6,  "Fetisova",   "Anna",      "+7-917-789-27-60").
  student(7,  "Minakova",   "Veronika",  "+7-918-788-28-67").
  student(8,  "Volkov",     "Anton",     "+7-919-787-29-59").
  student(9,  "Podmaskova", "Ekaterina", "+7-920-786-30-68").
  student(10, "Khoroshev",  "Maxim",     "+7-921-785-31-58").
  student(11, "Rubenko",    "Marina",    "+7-922-784-32-69").

  university(0, "BMSTU").
  university(1, "RSMU").
  university(2, "ITMO").
  university(3, "MISIS").

  studentAt(0, 0).
  studentAt(1, 0).
  studentAt(2, 0).
  studentAt(2, 2).
  studentAt(3, 0).
  studentAt(4, 0).
  studentAt(4, 1).
  studentAt(4, 3).
  studentAt(5, 0).
  studentAt(6, 1).
  studentAt(7, 2).
  studentAt(8, 1).
  studentAt(9, 3).
  studentAt(9, 0).
  studentAt(10, 3).
  studentAt(11, 1).
  studentAt(11, 2).

  studentInfo(UniversityID, UnivTitle, Surname, Name, Phone):-
    studentAt(StudentID, UniversityID),
    university(UniversityID, UnivTitle),
    student(StudentID, Surname, Name, Phone).

  studentUniversities(StudentID, University):-
    studentAt(StudentID, UniversityID),
    university(UniversityID, University).

goal
  % All students with name Marina
  %student(_, Surname, "Marina", Phone).

  % All students with surname Volkov
  %student(ID, "Volkov", _, Phone).

  % All student from BMSTU info
  %studentInfo(0, _, Surname, Name, Phone).

  % Full info about all students with name Marin
  %studentInfo(_, University, Surname, "Marina", Phone).
 
  % Info about student universities
  studentUniversities(4, University).
