module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		# To validate the command and show the user a help message
		#
		class CommandValidator

			def initialize(input)
				begin
					raise NotImplementedCommand unless BitmapCmdEditor::COMMANDS.include?(input[0])
				rescue NotImplementedCommand => nic
					ErrorMessage.new(:command_not_exist)
				end
			end
		end

	end
end
