module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		# To validate a new bitmap image table created
		class ClearImageValidator
			class << self
				# @param args [Array] the command 0=> 'I' and 1=> columns 2 =>rows
				def validate(args)
					begin
						raise ClearImageArgumentError.new(
							ErrorMessage.new(:clear_image_wrongs_arguments).show_content) unless args.count == 1
						:valid
					rescue  => err
						err.message
					end
				end
			end
		end
	end
end
