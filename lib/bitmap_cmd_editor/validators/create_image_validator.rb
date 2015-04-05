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
							ErrorMessage.new(:create_image_wrong_arguments).show_content) unless args.count == 3
						begin
							columns= Integer(args[1])
							rows= Integer(args[2])
						rescue => err
							raise TypeError.new("the arguments M N should be integers")
						end
						raise MoreColumnsThanAllowed.new(ErrorMessage.new(
							:more_than_max,
							{:obj=>'columns' , :max => BitmapCmdEditor::MAX_COLUMNS,:quantity => columns }
							).show_content) if columns > BitmapCmdEditor::MAX_COLUMNS
						raise MoreRowsThanAllowed.new(ErrorMessage.new(
							:more_than_max,
							{:obj=>'rows' , :max => BitmapCmdEditor::MAX_ROWS,:quantity => rows }
							).show_content) if rows > BitmapCmdEditor::MAX_ROWS
						raise LessColumnsThanAllowed.new(ErrorMessage.new(
							:less_than_min,
							{:obj=>'columns' , :max => BitmapCmdEditor::MIN_COLUMNS,:quantity => columns }
							).show_content) if columns < BitmapCmdEditor::MIN_COLUMNS
						raise LessRowsThanAllowed.new(ErrorMessage.new(
							:less_than_min,
							{:obj=>'rows' , :max => BitmapCmdEditor::MIN_ROWS,:quantity => rows }
							).show_content) if rows < BitmapCmdEditor::MIN_ROWS
						:valid
					rescue  => err
						err.message
					end
				end
			end
		end
	end
end
