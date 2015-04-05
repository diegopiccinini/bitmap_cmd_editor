module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		# To validate the command and show the user a help message
		class CommandValidator
			class << self
				# @param input [String] the input command string
				def validate(input)
					begin
						args=input.split(' ')
						raise NotImplementedCommand unless BitmapCmdEditor::COMMANDS.include?(args[0])
						:valid
					rescue NotImplementedCommand => nic
						ErrorMessage.new(:command_not_exist)
					end
				end
			end
		end

	end
end
