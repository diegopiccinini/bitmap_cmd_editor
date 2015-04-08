Feature: Show Content
	S - Show the contents of the current image

	Scenario: Showing Table
		Given I run `bitmap_cmd_editor` interactively
		And I type "I 5 6"
		And I type "L 4 1 E"
		And I type "L 3 2 E"
		And I type "L 4 2 E"
		And I type "L 3 3 E"
		And I type "L 2 5 E"
		And I type "F 4 2 H"
		When I type "S"
		And I type "X"
		Then it should pass with:
				"""
				Welcome to the Bitmap Command Editor
				------------------------------------

				Available Commands:
				-------------------

					I M N - Create a new M x N image with all pixels coloured white (O).
					C - Clears the table, setting all pixels to white (O).
					L X Y C - Colours the pixel (X,Y) with colour C.
					V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
					H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
					F X Y C - Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
					S - Show the contents of the current image
					X - Terminate the session

				O O O H O
				O O H H O
				O O H O O
				O O O O O
				O E O O O
				O O O O O

				End the Session...
				"""