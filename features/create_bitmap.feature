Feature: Create a Bitmap
	the command I M N - Create a new M x N image with all pixels coloured white (O).

  Scenario: Create a new M x N image
    Given a bitmap created
		When The user type "I 5 6"
		Then this bitmap should be created
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|

  Scenario Outline: Trying create an invalid image
    Given a bitmap created
		When The user attempts to create <Command>
		Then He should see the message <Message>
		Examples:
		| Command   | Message																									|
		| "I 500 6" | "the maximun columns allowed are 250 and you want 500"	|
		| "I 5 645" | "the maximun rows allowed are 250 and you want 645"			|
		| "I 0 6"		| "the minimun columns allowed is 1 and you want 0"				|
		| "I 7 -6"	| "the minimun rows allowed is 1 and you want -6"					|
		| "I 500 6" | "the maximun columns allowed are 250 and you want 500"	|
		| "I 7 8 10"| "the command I require 2 arguments"											|
		| "I 7"			| "the command I require 2 arguments"											|
		| "I S 3"		| "the coordinates M N must be integers"									|
		| "I 2 H"		| "the coordinates M N must be integers"									|
