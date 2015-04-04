
module BitmapCmdEditor
  # @author Diego Hernán Piccinini Lagos
  # This class handle the the interactive loop until X + Enter to exit
	class Client
		class << self
			def get_commands
				begin
					output_message = <<-EOF
Welcome to the Bitmap Command Editor
------------------------------------

Commands available:
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
					puts output_message

					loop do
						STDOUT.flush
						input = gets.chomp
						if input=="X"
							puts "\nEnd the Session..."
							break
						else
							raise ArgumentError
							break
						end
					end

				rescue
					raise ScriptError
				end
			end
		end
	end
end
