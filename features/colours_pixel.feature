Feature: Colours a Pixel
 the command L X Y C - Colours the pixel (X,Y) with colour C.
	Scenario: Colouring a Bitmap
    Given a bitmap was created typing the command "I 5 6"
		When The user type "L 4 1 E"
		And The user type "L 3 2 B"
		Then the bitmap should be
			|O|O|O|E|O|
			|O|O|B|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|

  Scenario Outline: Trying to colour a Bitmap with invalid commands
    Given a bitmap was created typing the command <Command I>
		When The user tries to colour <Command L>
		Then He should see the message <Message>

		Examples:
		|Command I| Command L	| Message																														|
		| "I 5 6"		| "L 7 2 A"		| "a valid columns values are between 1 and 5, and you try 7"		|
		| "I 5 6"		| "L -1 2 A"	| "a valid columns values are between 1 and 5, and you try -1"	|
		| "I 6 3"		| "L 3 9 A"		| "a valid rows values are between 1 and 3, and you try 9"			|
		| "I 5 4"		| "L 3 0 A"		| "a valid rows values are between 1 and 4, and you try 0"			|
		| "I 5 4"		| "L 3 4 A C"	| "this command require 3 arguments"														|
		| "I 5 4"		| "L 3 4"			| "this command require 3 arguments"														|
		| "I 5 4"		| "L S 4 A"		| "the coordinates M N must be integers"												|
		| "I 5 4"		| "L 4 H A"		| "the coordinates M N must be integers"												|
		| "I 5 4"		| "L 4 3 5H"	| "the colour must be a Capital Letter A-Z"											|
