Dir[File.join(File.dirname(__FILE__),'*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__),'validators','*.rb')].each {|file| require file }

module BitmapCmdEditor
  VERSION = "0.0.1"
  COMMANDS = ['X','I']
  #TODO implement 'C','L','V','H','F','S'
  MAX_COLUMNS = 250
  MIN_COLUMNS = 1
  MAX_ROWS = 250
  MIN_ROWS = 1
end
