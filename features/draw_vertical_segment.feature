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
