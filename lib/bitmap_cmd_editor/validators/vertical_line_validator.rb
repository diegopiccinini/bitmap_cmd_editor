module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		class VerticalLineValidator
			class << self
				# @param args [Array] the command 0=> 'V' and 1=> column 2 => row start 3 => row end 4 => colour
				# @param bitmap_columns [Integer] number of columns of the image created
				# @param bitmap_rows [Integer] number of rows of the image created
				def validate(args, bitmap_columns, bitmap_rows)
					begin
						raise VerticalLineArgumentError.new(
							ErrorMessage.new(:command_wrong_arguments, {:arguments => 4}).show_content) unless args.count == 5

						begin
							column= Integer(args[1])
							row_start= Integer(args[2])
							row_end= Integer(args[3])
						rescue => err
							raise TypeError.new(ErrorMessage.new(:coordinates_are_not_integer).show_content)
						end

						ValidatorHelper.out_of_range('columns',BitmapCmdEditor::MIN_COLUMNS,bitmap_columns,column)

						ValidatorHelper.out_of_range('rows',BitmapCmdEditor::MIN_ROWS,bitmap_rows,row_start)

						ValidatorHelper.out_of_range('rows',BitmapCmdEditor::MIN_ROWS,bitmap_rows,row_end)

						raise TypeError.new(ErrorMessage.new(:the_colour_is_invalid).show_content) unless ('A'..'Z').include?args[4]

						:valid
					rescue  => err
						err.message
					end
				end
			end
		end
	end
end
