/*****************************************************************************

		Copyright (c) BMSTU

 Project:  LAB13
 FileName: LAB13.PRO
 Purpose: No description
 Written by: Maslova Marina
 Comments:
******************************************************************************/


domains
  lastname, phone, city, street = string.
  house, flat = integer.
  address = addr(city, street, house, flat).
  brand, color = string.
  price = integer.
  bank = string.
  account, amount = integer.

predicates
  phone(lastname, phone, address).
  car(lastname, brand, color, price).
  depositor(lastname, bank, account, amount).

clauses
  phone("Smolina",   "+7-958-205-94-37", addr("Moscow", "Lenina",       3, 51)).
  phone("Smolina",   "+7-945-818-96-85", addr("Moscow", "Lenina",       3, 51)).
  phone("Zhirov",    "+7-905-157-89-39", addr("Moscow", "Tsentralnaya", 4, 52)).
  phone("Shumilova", "+7-973-972-98-44", addr("Kirov",  "Lenina",       5, 53)).
  phone("Petrukhin", "+7-987-655-12-56", addr("Kirov",  "Polevaya",     6, 54)).
  phone("Petrukhin", "+7-933-693-95-80", addr("Kirov",  "Polevaya",     6, 54)).
  phone("Denisova",  "+7-958-283-29-80", addr("Kirov",  "60 let SSSR",  7, 41)).
  phone("Burova",    "+7-954-284-48-79", addr("Anapa",  "Pionerskaya",  8, 42)).
  phone("Shumilova", "+7-939-843-83-97", addr("Anapa",  "Moskovskaya",  1, 43)).

  car("Smolina",   "Mazda",   "blue",   25000).
  car("Zhirov",    "BMW",     "black",  30000).
  car("Zhirov",    "GAZ",     "red",    10000).
  car("Shumilova", "Ferrari", "yellow", 140000).
  car("Petrukhin", "Toyota",  "grey",   20000).
  car("Burova",    "BMW",     "black",  15000).
  car("Shumilova", "Mini",    "white",  30000).

  depositor("Smolina",   "VTB",     12345, 200000).
  depositor("Petrukhin", "Sber",    12345, 12345).
  depositor("Zhirov",    "Alpha",   54321, 53212).
  depositor("Burova",    "Tinkoff", 23456, 186753).
  depositor("Denisova",  "Tinkoff", 34567, 1587).
  depositor("Denisova",  "Sber",    54321, 3800).
  depositor("Shumilova", "Alpha",   98765, 98765).
  depositor("Shumilova", "Tinkoff", 98765, 56789).

goal

