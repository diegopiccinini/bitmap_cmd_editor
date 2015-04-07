module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		# To validate a new bitmap image table created
		class CreateImageValidator
			class << self
				# @param args [Array] the command 0=> 'I' and 1=> columns 2 =>rows
				def validate(args)
					begin
						raise CreateImageArgumentError.new(
							ErrorMessage.new(:command_wrong_arguments, {:arguments => 2}).show_content) unless args.count == 3
						begin
							columns= Integer(args[1])
							rows= Integer(args[2])
						rescue => err
							raise TypeError.new(ErrorMessage.new(:coordinates_are_not_integer).show_content)
						end
						ValidatorHelper.more_than_max('columns',BitmapCmdEditor::MAX_COLUMNS,columns)

						ValidatorHelper.more_than_max('rows',BitmapCmdEditor::MAX_ROWS,rows)

						ValidatorHelper.less_than_min('columns',BitmapCmdEditor::MIN_COLUMNS,columns)

						ValidatorHelper.less_than_min('rows',BitmapCmdEditor::MIN_ROWS,rows)

						:valid
					rescue  => err
						err.message
					end
				end
			end
		end
	end
end
