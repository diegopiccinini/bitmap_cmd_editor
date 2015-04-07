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

  Scenario: Creating an image with more columns than allowed
    Given a bitmap created
		When The user attempts to create "I 500 6"
		Then He should see the message "the maximun columns allowed are 250 and you want 500"

  Scenario: Creating an image with more rows than allowed
    Given a bitmap created
		When The user attempts to create "I 5 645"
		Then He should see the message "the maximun rows allowed are 250 and you want 645"

  Scenario: Creating an image with less columns than allowed
    Given a bitmap created
		When The user attempts to create "I 0 6"
		Then He should see the message "the minimun columns allowed is 1 and you want 0"

  Scenario: Creating an image with less rows than allowed
    Given a bitmap created
		When The user attempts to create "I 7 -6"
		Then He should see the message "the minimun rows allowed is 1 and you want -6"

  Scenario: Creating an image with more arguments than allowed
    Given a bitmap created
		When The user attempts to create "I 7 8 10"
		Then He should see the message "the command I require 2 arguments"

  Scenario: Creating an image with less arguments than allowed
    Given a bitmap created
		When The user attempts to create "I 7"
		Then He should see the message "the command I require 2 arguments"

  Scenario: Creating an image with wrong type arguments
    Given a bitmap created
		When The user attempts to create "I S 3"
		Then He should see the message "the arguments M N should be integers"