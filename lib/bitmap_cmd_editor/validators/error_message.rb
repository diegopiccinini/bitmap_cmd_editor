module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		# An intance contains te error_type and a message to the user
		class ErrorMessage
			MESSAGES = {
				:invalid => "This operation is invalid",
				:command_not_exist => "This command is not available, please check the available commands",
				:more_than_max => "the maximun %{obj} allowed are %{max} and you want %{quantity}",
				:less_than_min => "the minimun %{obj} allowed is %{min} and you want %{quantity}",
				:command_wrong_arguments => "this command require %{arguments} arguments",
				:clear_image_wrongs_arguments => "clear image hasn't arguments",
				:print_table_arguments => "print table hasn't arguments",
				:colours_pixel_out_of_range => "a valid %{obj} values are between %{min} and %{max}, and you try %{quantity}",
				:coordinates_are_not_integer => "the coordinates M N must be integers",
				:out_of_range => "a valid %{obj} values are between %{min} and %{max}, and you try %{quantity}",
				:the_colour_is_invalid => "the colour must be a Capital Letter A-Z"
			}
			# initialize the message
			# @param content [String] text message to the user
			# @param error_type [Symbol] to qualifies the error
			# @param args [Hash] to include params in the response
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
