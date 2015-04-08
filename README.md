# BitmapCmdEditor

This is an interactive command script, input consists of a string containing a sequence of commands, where a command is represented by a single capital letter at the beginning of the line. Parameters of the command are separated by white spaces and they follow the command character.

Pixel co-ordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.

# Ruby version
		2.0+

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitmap_cmd_editor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitmap_cmd_editor

## Usage

After install the gem in your system you will have avaible the command bitmap_cmd_editor.
So, run in your terminal `bitmap_cmd_editor` then you should see this:

Available Commands:
-------------------

	I M N - Create a new M x N image with all pixels coloured white (O).
	C - Clears the table, setting all pixels to white (O).
	L X Y C - Colours the pixel (X,Y) with colour C.
	V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
	H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
	F X Y C - Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
	S - Show the contents of the current image
	X - Terminate the session

## Contributing

1. Fork it ( https://github.com/diegopiccinini/bitmap_cmd_editor.git/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
