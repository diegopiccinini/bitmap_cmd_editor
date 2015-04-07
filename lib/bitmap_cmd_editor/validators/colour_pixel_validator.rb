module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		class ColourPixelValidator
			class << self
				# @param args [Array] the command 0=> 'I' and 1=> columns 2 =>rows 3 => colour
				def validate(args)
					begin
						raise ColourPixelError.new(
							ErrorMessage.new(:command_wrong_arguments, {:arguments => 3}).show_content) unless args.count == 4



						:valid
					rescue  => err
						err.message
					end
				end
			end
		end
	end
end
