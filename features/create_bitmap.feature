Feature: Create a Bitmap
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
		When The user type "I 500 6"
		Then He should see the message "the maximun columns allowed are 250"

  Scenario: Creating an image with more rows than allowed
    Given a bitmap created
		When The user type "I 5 645"
		Then He should see the message "the maximun rows allowed are 250"

  Scenario: Creating an image with less columns than allowed
    Given a bitmap created
		When The user type "I 0 6"
		Then He should see the message "the minimun columns allowed is 1"

  Scenario: Creating an image with less rows than allowed
    Given a bitmap created
		When The user type "I 7 -6"
		Then He should see the message "the minimun rows allowed is 1"