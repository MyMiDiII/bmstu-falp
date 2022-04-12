/*****************************************************************************

		Copyright (c) BMSTU

 Project:  LAB11
 FileName: TEST.PRO
 Purpose: No description
 Written by: Maslova Marina
 Comments:
******************************************************************************/

include "lab11.inc"

predicates
  likes(symbol, symbol)
  
clauses
  likes(ellen, tennis).
  likes(john, football).
  likes(tom, baseball).
  likes(eric, swimming).
  likes(mark, tennis).
  likes(bill, Activity):-likes(tom, Activity).

goal
  likes(BaseballPlayer, baseball);
  likes(TennisPlayer, tennis).