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
				when 'H'
					draw_horizontal_line(args)
				when 'F'
					fill_region(args)
				when 'S'
					print_table(args)
				end
			else
				validator
			end
		end
    private

			# For create image table map for M columns and N rows with the command I M N
			# @param args [String] the command typed for example: I 5 6
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
			# @param args [String] in this case is C
			# @return CreateImageValidator.validate response [Symbol|String] could be :valid or Error Message string
			def clear_image(args)
				validator=Validators::ClearImageValidator.validate(args)
				if validator == :valid
					@table = fill_table(@columns,@rows)
				end
				validator
			end

			# to fill a coordinate with specific colour with command L M N C
			# @param args [String] in this case the command is for example L 4 2 A
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
			# @param columns [Integer]
			# @param rows [Integer]
			# @param colour [String]
			# @return table 2 dimensions [Array] pixels coordinates rows and coloumns with colour
			def fill_table(columns, rows, colour = 'O')
				table = []
				rows.times do |row|
					table[row] =Array.new(columns,colour)
				end
				table
			end

			# to draw a vertical line
			# @param args [String] in this case the command is for example V 2 1 4 W
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

			# to draw a horinzontal line
			# @param args [String] in this case the command is for example H 2 1 4 C
			# @return VerticalLineValidator.validate response [Symbol|String] could be :valid or Error Message string
			def draw_horizontal_line(args)
				validator=Validators::HorizontalLineValidator.validate(args, @columns, @rows)
				if validator == :valid
					column_start=Integer(args[1]) - 1
					column_end = Integer(args[2]) - 1
					row = Integer(args[3]) - 1
					(column_start..column_end).each do |column|
						@table[row][column]=args[4]
					end
				end
				validator
			end

			# to fill a region with specific colour with command F M N C
			# @param args [String] in this case the command is for example F 4 2 A
			# @return FillRegionValidator.validate response [Symbol|String] could be :valid or Error Message string
			def fill_region(args)
				validator=Validators::FillRegionValidator.validate(args, @columns, @rows)
				if validator == :valid
					column=Integer(args[1]) - 1
					row = Integer(args[2]) - 1
					searched = []
					same_region = [[row , column]]
					begin
						same_region, searched = get_region(same_region,searched)
					end while not (same_region - searched).empty?

					same_region.each do |fill_coordinate|
						r=fill_coordinate[0]
						c=fill_coordinate[1]
						@table[r][c]=args[3]
					end
				end
				validator
			end

			# search the same colour adjacent pixels
			# @param same_region [Array] the region has finded
			# @param searched [Array] the pixels that it has a previous search
			def get_region(same_region, searched)

				diff = same_region - searched
				# search only the points not searched before
				diff.each do |find_center|
					row= find_center[0]
					column = find_center[1]
					if row> (BitmapCmdEditor::MIN_ROWS - 1)
						same_region.push [row - 1 , column]  if @table[row - 1][column] == @table[row][column]
					end
					if row< (@rows -1)
						same_region.push [row + 1 , column]  if @table[row + 1][column] == @table[row][column]
					end
					if column> (BitmapCmdEditor::MIN_COLUMNS - 1 )
						same_region.push [row  , column - 1]  if @table[row][column - 1] == @table[row][column]
					end
					if column< (@columns - 1)
						same_region.push [row , column + 1]  if @table[row][column  + 1] == @table[row][column]
					end
					searched.push find_center
				end
				same_region = same_region.uniq
				searched = searched.uniq
				[same_region , searched]
			end


			# print the table with the command S
			# @param args [String] in this case is S
			# @return PrintTableValidator.validate response [Symbol|String] could be :valid or Error Message string
			def print_table(args)
				validator=Validators::PrintTableValidator.validate(args)
				if validator == :valid
					puts "\n"
					@table.each do |row|
						puts row.join(' ')
					end
				end
				validator
			end
	end
end