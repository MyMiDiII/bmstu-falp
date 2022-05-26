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
  cost = integer.
  bank = string.
  account, amount = integer.
  name, type = string.

  ownership =
    car(name, color, cost);
    building(name, cost);
    region(name, cost);
    ship(name, cost).

predicates
  phone(lastname, phone, address).
  owner(lastname, ownership).
  depositor(lastname, bank, account, amount).
  propertyCost(lastname, type, name, cost).
  property(lastname, type, name).
  cost(lastname, type, cost).
  totalPropCost(lastname, cost).

clauses
  phone("Smolina",   "+7-958-205-94-37", addr("Moscow", "Lenina",       3, 51)).
  phone("Smolina",   "+7-945-818-96-85", addr("Moscow", "Lenina",       3, 51)).
  phone("Zhirov",    "+7-905-157-89-39", addr("Moscow", "Tsentralnaya", 4, 52)).
  phone("Shumilova", "+7-973-972-98-44", addr("Kirov",  "Lenina",       5, 53)).
  phone("Shumilov",  "+7-973-972-98-45", addr("Kirov",  "Lenina",       5, 53)).
  phone("Petrukhin", "+7-987-655-12-56", addr("Kirov",  "Polevaya",     6, 54)).
  phone("Petrukhin", "+7-933-693-95-80", addr("Kirov",  "Polevaya",     6, 54)).
  phone("Denisova",  "+7-958-283-29-80", addr("Kirov",  "60 let SSSR",  7, 41)).
  phone("Burova",    "+7-954-284-48-79", addr("Anapa",  "Pionerskaya",  8, 42)).
  phone("Shumilova", "+7-939-843-83-97", addr("Anapa",  "Moskovskaya",  1, 43)).

  owner("Smolina",        car("Mazda",      "blue",   400)).
  owner("Petrukhin", building("stock",      90000)).
  owner("Burova",         car("Ferrari",    "yellow", 140000)).
  owner("Burova",      region("country",    25000)).
  owner("Denisova",      ship("yacht",      13555)).
  owner("Zhirov",         car("GAZ",        "red",    10000)).
  owner("Zhirov",    building("cottage",    120000)).
  owner("Shumilova",      car("Mini",       "white",  1030)).
  owner("Shumilova", building("house",      990)).
  owner("Shumilova",   region("Rublevka",   70182)).
  owner("Shumilova",     ship("restaurant", 75000)).

  depositor("Smolina",   "VTB",     12345, 200000).
  depositor("Petrukhin", "Sber",    12345, 12345).
  depositor("Zhirov",    "Alpha",   54321, 53212).
  depositor("Burova",    "Tinkoff", 23456, 186753).
  depositor("Denisova",  "Tinkoff", 34567, 1587).
  depositor("Denisova",  "Sber",    54321, 3800).
  depositor("Shumilova", "Alpha",   98765, 98765).
  depositor("Shumilova", "Tinkoff", 98765, 56789).

  propertyCost(Lastname, "car", PropName, Cost) :-
    owner(Lastname, car(PropName, _, Cost)).
  propertyCost(Lastname, "building", PropName, Cost) :-
    owner(Lastname, building(PropName, Cost)).
  propertyCost(Lastname, "region", PropName, Cost) :-
    owner(Lastname, region(PropName, Cost)).
  propertyCost(Lastname, "ship", PropName, Cost) :-
    owner(Lastname, ship(PropName, Cost)).

  property(Lastname, PropType, PropName) :-
    propertyCost(Lastname, PropType, PropName, _).

  cost(Lastname, "car", Cost)      :- owner(Lastname, car(_, _, Cost)), !.
  cost(Lastname, "building", Cost) :- owner(Lastname, building(_, Cost)), !.
  cost(Lastname, "region", Cost)   :- owner(Lastname, region(_, Cost)), !.
  cost(Lastname, "ship", Cost)     :- owner(Lastname, ship(_, Cost)), !.
  cost(_, _, 0).

  totalPropCost(Lastname, Cost) :-
    cost(Lastname, "car", CarCost),
    cost(Lastname, "building", BuildingCost),
    cost(Lastname, "region", RegionCost),
    cost(Lastname, "ship", ShipCost),
    Cost = CarCost + BuildingCost + RegionCost + ShipCost.

goal
  % 1
  % property("Zhirov", PropType, PropName).

  % 2
  % propertyCost("Shumilova", PropType, PropName, Cost).

  % 3
  totalPropCost("Shumilova", TotalCost).
