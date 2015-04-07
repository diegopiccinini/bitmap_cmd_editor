module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		# To validate a new bitmap image table created
		class ValidatorHelper
			class << self

				def more_than_max(obj,max,quantity)
					raise MoreColumnsThanAllowed.new(ErrorMessage.new(
						:more_than_max,
						{:obj=> obj , :max => max,:quantity => quantity }
						).show_content) if quantity > max

				end

				def less_than_min(obj,min,quantity)
					raise LessColumnsThanAllowed.new(ErrorMessage.new(
							:less_than_min,
							{:obj=> obj , :min => min,:quantity => quantity }
							).show_content) if quantity < min
				end

				def out_of_range(obj,min,max,quantity)
					raise OutOfRange.new(ErrorMessage.new(
							:out_of_range,
							{:obj=> obj , :min => min,:max => max,:quantity => quantity }
							).show_content) if quantity<min or quantity>max
				end

			end
		end
	end
end