module BitmapCmdEditor
  # @author Diego Hernán Piccinini Lagos
  class NotImplementedCommand < NotImplementedError; end
  class CreateImageArgumentError < ArgumentError; end
  class MoreColumnsThanAllowed < RangeError; end
  class MoreRowsThanAllowed < RangeError; end
  class LessColumnsThanAllowed < RangeError; end
  class LessRowsThanAllowed < RangeError; end
end