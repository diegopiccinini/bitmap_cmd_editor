module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		# To validate a new bitmap image table created
		class CreateImageValidator
			# @param input [String] the input command string
			def initialize(input)
				begin
					args=input.split(' ')
					raise CreateImageArgumentError unless args.count==3
					:valid
				rescue CreateImageArgumentError => ciae
					ErrorMessage.new(:wrong_create_image_arguments,{:quantity => args.count })
				end
			end
		end

	end
end
