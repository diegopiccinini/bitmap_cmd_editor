Feature:  Draw a vertical segment
 With command V X Y1 Y2 C - Draw a vertical segment of colour C in column X
 between rows Y1 and Y2 (inclusive).
	Scenario: Drawing a vertical segment
    Given a bitmap was created typing the command "I 5 6"
		When The user type "V 2 1 4 W"
		Then the bitmap should be
			|O|W|O|O|O|
			|O|W|O|O|O|
			|O|W|O|O|O|
			|O|W|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|

  Scenario Outline: Trying to draw a vertical line with invalid commands
    Given a bitmap was created typing the command <Command I>
		When The user tries to colour <Command L>
		Then He should see the message <Message>

		Examples:
		|Command I	| Command L			| Message																												|
		| "I 5 6"		| "V 7 2 4 A"		| "a valid columns values are between 1 and 5, and you try 7"		|
		| "I 5 6"		| "V -1 2 4 A"	| "a valid columns values are between 1 and 5, and you try -1"	|
		| "I 6 3"		| "V 3 9 3 A"		| "a valid rows values are between 1 and 3, and you try 9"			|
		| "I 5 4"		| "V 3 0 4 A"		| "a valid rows values are between 1 and 4, and you try 0"			|
		| "I 6 3"		| "V 3 3 9 A"		| "a valid rows values are between 1 and 3, and you try 9"			|
		| "I 5 4"		| "V 3 1 -2 A"	| "a valid rows values are between 1 and 4, and you try -2"			|
		| "I 5 4"		| "V 3 4 A C R"	| "this command require 4 arguments"														|
		| "I 5 4"		| "V 3 4"				| "this command require 4 arguments"														|
		| "I 5 4"		| "V S 4 5 A"		| "the coordinates M N must be integers"												|
		| "I 5 4"		| "V 4 H 6 A"		| "the coordinates M N must be integers"												|
		| "I 5 4"		| "V 4 2 Z A"		| "the coordinates M N must be integers"												|
		| "I 5 4"		| "V 4 1 4 5H"	| "the colour must be a Capital Letter A-Z"											|