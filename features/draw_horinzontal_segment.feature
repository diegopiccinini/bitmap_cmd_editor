Feature:  Draw a horizontal segment
 With command H X1 X2 Y C - Draw a horizontal segment of colour C
 in row Y between columns X1 and X2 (inclusive).
	Scenario: Drawing a horinzontal segment
    Given a bitmap was created typing the command "I 5 6"
		When The user type "H 2 4 3 C"
		Then the bitmap should be
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|C|C|C|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|

  Scenario Outline: Trying to draw a horizontal line with invalid commands
    Given a bitmap was created typing the command <Command I>
		When The user tries to colour <Command L>
		Then He should see the message <Message>

		Examples:
		|Command I| Command L	| Message																															|
		| "I 5 6"		| "H 2 7 4 A"		| "a valid columns values are between 1 and 5, and you try 7"		|
		| "I 5 6"		| "H 2 11 4 A"	| "a valid columns values are between 1 and 5, and you try 11"	|
		| "I 5 6"		| "H -1 2 4 A"	| "a valid columns values are between 1 and 5, and you try -1"	|
		| "I 5 6"		| "H 1 -3 4 A"	| "a valid columns values are between 1 and 5, and you try -3"	|
		| "I 6 3"		| "H 3 5 9 A"		| "a valid rows values are between 1 and 3, and you try 9"			|
		| "I 5 4"		| "H 3 4 0 A"		| "a valid rows values are between 1 and 4, and you try 0"			|
		| "I 5 4"		| "H 3 4 A C R"	| "this command require 4 arguments"														|
		| "I 5 4"		| "H 3 4"				| "this command require 4 arguments"														|
		| "I 5 4"		| "H S 4 5 A"		| "the coordinates M N must be integers"												|
		| "I 5 4"		| "H 4 H 6 A"		| "the coordinates M N must be integers"												|
		| "I 5 4"		| "H 4 2 Z A"		| "the coordinates M N must be integers"												|
		| "I 5 4"		| "H 4 1 4 5H"	| "the colour must be a Capital Letter A-Z"											|