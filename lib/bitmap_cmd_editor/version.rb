Dir[File.join(File.dirname(__FILE__),'*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__),'validators','*.rb')].each {|file| require file }

module BitmapCmdEditor
  VERSION = "0.0.2"
  COMMANDS = ['X','I','C','L','V','H']
  #TODO implement ,'F','S'
  MAX_COLUMNS = 250
  MIN_COLUMNS = 1
  MAX_ROWS = 250
  MIN_ROWS = 1
  WELCOME_MESSAGE = <<-EOF
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
EOF
end
