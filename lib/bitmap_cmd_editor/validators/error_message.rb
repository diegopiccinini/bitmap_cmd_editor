module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		# An intance contains te error_type and a message to the user
		class ErrorMessage
			MESSAGES = {
				:command_not_exist => "This command is not available, please check the available commands",

			}
			# initialize the message
			# @param content [String] text message to the user
			# @param error_type [Symbol] to qualifies the error
			# @param args [Hash] to include params in the response for example {:min => 1 , :max => 10}
			def initialize(error_type = :invalid,  args = {}, content = nil)
				unless content
					@content=MESSAGES[error_type]
				else
					@content = content
				end
				@error_type = error_type
				@args = args
				show_content
			end
			# @return text message [String] it could contain arguments
			def show_content
				puts "\n" + @content % @args
			end
		end
	end
end
