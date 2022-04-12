/*****************************************************************************

		Copyright (c) BMSTU

 Project:  LAB11
 FileName: LAB11P1.PRO
 Purpose: No description
 Written by: Maslova Marina
 Comments:
******************************************************************************/

predicates
  phone(string, string)
  
clauses
  phone("Maslova M.", "+7-987-123-45-32").
  phone("Khamzina R.", "+7-945-134-90-43").
  phone("Shkuratov S.", "+7-495-567-34-32").
  phone("Shkuratova I.", "+7-495-567-34-32").
  phone("Mishin E.", "+7-800-555-35-35").
  phone("Tsvetkov I.", "+7-925-390-58-62").
  phone("Tsvetkov M.", "+7-925-390-58-63").
  phone("Gorina U.", "+7-425-761-94-67").
  phone("Shkuratov S.", "+7-999-601-80-33").

goal
  %phone("Mishin E.", "+7-800-555-35-35").
  %phone("Gorina U.", Phone).
  %phone(Person, "+7-495-567-34-32").
  phone("Shkuratov S.", Phone).
