module BitmapCmdEditor
	# @author Diego Hernán Piccinini Lagos
	# It's the main object is instantiated empty when the application start
	class Bitmap
		# @param (see CommandValidator#initialize)
		attr_reader :table
		def initialize
			@table=[]
			@columns = 0
			@rows = 0
		end
		def process_command(input)

			validator=Validators::CommandValidator.validate(input)
			if validator == :valid
				args = input.split(' ')
				case args[0]
				when 'I'
					create_image(args)
				when 'C'
					clear_image(args)
				when 'L'
					colours_pixel(args)
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
				@table = []
				@rows.times do |row|
					@table[row] =Array.new(@columns,'O')
				end

			else
				validator
			end
		end

		def clear_image(args)
			validator=Validators::ClearImageValidator.validate(args)
			if validator == :valid
				@table = Array.new(@rows,Array.new(@columns,'O')) if (@rows * @columns) > 0
			else
				validator
			end
		end

		def colours_pixel(args)
			validator=Validators::ColourPixelValidator.validate(args)
			if validator == :valid
				column=Integer(args[1]) - 1
				row = Integer(args[2]) - 1
				@table[row][column]=args[3]
				:valid
			else
				validator
			end
		end
	end
end