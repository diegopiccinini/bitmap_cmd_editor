Feature: Clear table
	Scenario: Cleaning the table
    Given a bitmap created
		And The user type "I 5 6"
		And The user type "L 2 3 A"
		And the bitmap should be
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|A|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
		When The user type "C"
		Then the bitmap should be
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|

