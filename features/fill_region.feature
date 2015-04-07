Feature: Fill the region R with the colour C
with command F X Y C - Fill the region R with the colour C.
R is defined as: Pixel (X,Y) belongs to R.
Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.

	Scenario: Filling a Region
    Given a bitmap was created typing the command "I 5 6"
		And The user type "L 4 1 E"
		And The user type "L 3 2 E"
		And The user type "L 4 2 E"
		And The user type "L 3 3 E"
		And The user type "L 2 5 E"
		And the bitmap should be
			|O|O|O|E|O|
			|O|O|E|E|O|
			|O|O|E|O|O|
			|O|O|O|O|O|
			|O|E|O|O|O|
			|O|O|O|O|O|
		When The user type "F 4 2 H"
		Then the bitmap should be
			|O|O|O|H|O|
			|O|O|H|H|O|
			|O|O|H|O|O|
			|O|O|O|O|O|
			|O|E|O|O|O|
			|O|O|O|O|O|

  Scenario Outline: Trying to filling a Bitmap with invalid commands
    Given a bitmap was created typing the command <Command I>
		When The user tries to colour <Command L>
		Then He should see the message <Message>

		Examples:
		|Command I| Command L	| Message																														|
		| "I 5 6"		| "F 7 2 A"		| "a valid columns values are between 1 and 5, and you try 7"		|
		| "I 5 6"		| "F -1 2 A"	| "a valid columns values are between 1 and 5, and you try -1"	|
		| "I 6 3"		| "F 3 9 A"		| "a valid rows values are between 1 and 3, and you try 9"			|
		| "I 5 4"		| "F 3 0 A"		| "a valid rows values are between 1 and 4, and you try 0"			|
		| "I 5 4"		| "F 3 4 A C"	| "this command require 3 arguments"														|
		| "I 5 4"		| "F 3 4"			| "this command require 3 arguments"														|
		| "I 5 4"		| "F S 4 A"		| "the coordinates M N must be integers"												|
		| "I 5 4"		| "F 4 H A"		| "the coordinates M N must be integers"												|
		| "I 5 4"		| "F 4 3 5H"	| "the colour must be a Capital Letter A-Z"											|