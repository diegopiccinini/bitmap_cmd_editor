Feature: Create a Bitmap
  Scenario: Create a new M x N image
  	Given I run `bitmap_cmd_editor` interactively
		When I type "I 5 6"
		Then this bitmap should be created
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
			|O|O|O|O|O|
