module BitmapCmdEditor
	module Validators
		# @author Diego Hernán Piccinini Lagos
		# To validate a command print table
		class PrintTableValidator
			class << self
				# @param args [Array] the command 0=> 'S'
				def validate(args)
					begin
						raise PrintTableArgumentError.new(
							ErrorMessage.new(:print_table_arguments).show_content) unless args.count == 1
						:valid
					rescue  => err
						err.message
					end
				end
			end
		end
	end
end
