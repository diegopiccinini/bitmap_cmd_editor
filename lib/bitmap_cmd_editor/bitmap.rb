module BitmapCmdEditor
	# @author Diego Hernán Piccinini Lagos
	# It's the main object is instantiated empty when the application start
	class Bitmap
		# @param (see CommandValidator#initialize)
		attr_reader :table
		def process_command(input)

			validator=Validators::CommandValidator.validate(input)
			if validator == :valid
				args = input.split(' ')
				case args[0]
				when 'I'
					create_image(args)
				end
			else
				validator
			end
		end
		def to_s
			input
		end
		def create_image(args)
			validator=Validators::CreateImageValidator.validate(args)
			if validator == :valid
				@columns=Integer(args[1])
				@rows = Integer(args[2])
				@table = Array.new(@rows,Array.new(@columns,'O'))
			else
				validator
			end
		end
	end
end