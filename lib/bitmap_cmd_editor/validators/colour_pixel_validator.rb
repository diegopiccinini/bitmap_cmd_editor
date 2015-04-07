module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		class ColourPixelValidator
			class << self
				# @param args [Array] the command 0=> 'L' and 1=> columns 2 =>rows 3 => colour
				# @param bitmap_columns [Integer] number of columns of the image created
				# @param bitmap_rows [Integer] number of rows of the image created
				def validate(args, bitmap_columns, bitmap_rows)
					begin
						raise ColourPixelArgumentError.new(
							ErrorMessage.new(:command_wrong_arguments, {:arguments => 3}).show_content) unless args.count == 4

						begin
							columns= Integer(args[1])
							rows= Integer(args[2])
						rescue => err
							raise TypeError.new(ErrorMessage.new(:coordinates_are_not_integer).show_content)
						end
						ValidatorHelper.out_of_range('columns',BitmapCmdEditor::MIN_COLUMNS,bitmap_columns,columns)

						ValidatorHelper.out_of_range('rows',BitmapCmdEditor::MIN_ROWS,bitmap_rows,rows)

						raise TypeError.new(ErrorMessage.new(:the_colour_is_invalid).show_content) unless ('A'..'Z').include?args[3]

						:valid
					rescue  => err
						err.message
					end
				end
			end
		end
	end
end
