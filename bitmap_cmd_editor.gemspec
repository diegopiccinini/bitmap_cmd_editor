# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitmap_cmd_editor/version'

Gem::Specification.new do |spec|
  spec.name          = "bitmap_cmd_editor"
  spec.version       = BitmapCmdEditor::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Diego Hernán Piccinini Lagos"]
  spec.email         = ["diego@guiasrails.es"]
  spec.summary       = %q{Produce a Ruby 2.0 program that simulates a basic interactive bitmap editor. Bitmaps are represented as an M x N matrix of pixels with each element representing a colour.}
  spec.description   = %q{The input consists of a string containing a sequence of commands, where a command is represented by a single capital letter at the beginning of the line. Parameters of the command are separated by white spaces and they follow the command character.

Pixel co-ordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.0.0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "shoulda-matchers", '2.8.0'
  spec.add_development_dependency "rspec-expectations", '3.2.0'
  spec.add_development_dependency "cucumber", '2.0.0'
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "yard"

  spec.has_rdoc = 'yard'
end
