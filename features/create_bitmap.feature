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
