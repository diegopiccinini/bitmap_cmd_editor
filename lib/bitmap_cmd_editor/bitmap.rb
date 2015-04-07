module BitmapCmdEditor
	# @author Diego Hernán Piccinini Lagos
	# It's the main object is instantiated empty when the application start
	class Bitmap

		attr_reader :table, :columns, :rows

		# @param (see CommandValidator#initialize)
		def initialize
			@table=[]
			@columns = 0
			@rows = 0
		end

		# process the operations commands availables view the constant COMMANDS, X is excluded because it is a
		# system command not a bitmap command
		# @param input [String] the command typed for example: I 5 6
		# @return CommandValidator.validate response [Symbol|String] could be :valid or Error Message string
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
				when 'V'
					draw_vertical_line(args)
				end
			else
				validator
			end
		end
    private

			# For create image table map for M columns and N rows with the command I M N
			# @param input [String] the command typed for example: I 5 6
			# @return CreateImageValidator.validate response [Symbol|String] could be :valid or Error Message string
			def create_image(args)
				validator=Validators::CreateImageValidator.validate(args)
				if validator == :valid
					@columns=Integer(args[1])
					@rows = Integer(args[2])
					@table = fill_table(@columns,@rows)
				end
				validator
			end

			# clear the image with the command C all values will be O
			# @param input [String] in this case is C
			# @return CreateImageValidator.validate response [Symbol|String] could be :valid or Error Message string
			def clear_image(args)
				validator=Validators::ClearImageValidator.validate(args)
				if validator == :valid
					@table = fill_table(@columns,@rows)
				end
				validator
			end

			# to fill a coordinate with specific colour with command L M N C
			# @param input [String] in this case the command is for example L 4 2 A
			# @return ColourPixelValidator.validate response [Symbol|String] could be :valid or Error Message string
			def colours_pixel(args)
				validator=Validators::ColourPixelValidator.validate(args, @columns, @rows)
				if validator == :valid
					column=Integer(args[1]) - 1
					row = Integer(args[2]) - 1
					@table[row][column]=args[3]
				end
				validator
			end

			# to create a fill all  table coordinates with a colour
			# @return table [Array]
			def fill_table(columns, rows, colour = 'O')
				table = []
				rows.times do |row|
					table[row] =Array.new(columns,colour)
				end
				table
			end

			# to draw a vertical line
			# @param input [String] in this case the command is for example V 2 1 4 W
			# @return VerticalLineValidator.validate response [Symbol|String] could be :valid or Error Message string
			def draw_vertical_line(args)
				validator=Validators::VerticalLineValidator.validate(args, @columns, @rows)
				if validator == :valid
					column=Integer(args[1]) - 1
					row_start = Integer(args[2]) - 1
					row_end = Integer(args[3]) - 1
					(row_start..row_end).each do |row|
						@table[row][column]=args[4]
					end
				end
				validator
			end
	end
end