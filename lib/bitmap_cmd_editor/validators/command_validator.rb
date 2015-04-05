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
						raise NotImplementedCommand.new(ErrorMessage.new(:command_not_exist).show_content) unless BitmapCmdEditor::COMMANDS.include?(args[0])
						:valid
					rescue NotImplementedCommand => err
						err.message
					end
				end
			end
		end

	end
end
