module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		# An intance contains te error_type and a message to the user
		class ErrorMessage
			MESSAGES = {
				:command_not_exist => "This command is not available, please check the available commands",
				:more_than_max => "the maximun %{obj} allowed are %{max} and you want %{quantity}",
				:less_than_min => "the minimun %{obj} allowed is %{max} and you want %{quantity}",
				:create_image_wrong_arguments => "the command I require 2 arguments"
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
			end
			# @return text message [String] it could contain arguments
			def show_content
				"\n" + @content % @args
			end
		end
	end
end
