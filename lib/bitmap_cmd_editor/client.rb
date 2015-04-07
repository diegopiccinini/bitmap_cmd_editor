require 'readline'

module BitmapCmdEditor
  # @author Diego Hernán Piccinini Lagos
  # This class handle the the interactive loop until X + Enter to exit

	class Client
		class << self
			# getting commands in a loop
			def get_commands
				begin
					puts WELCOME_MESSAGE
					bitmap = Bitmap.new
					loop do
						input = Readline.readline("> ")
						input.strip!

						# the command X must not be processed it's only to exit
						if input=='X'
							puts "\nEnd the Session..."
							break
						else
								process=bitmap.process_command(input)
								puts process unless process==:valid
						end
					end

				rescue => err
					puts err.message
				end
			end
		end
	end
end
