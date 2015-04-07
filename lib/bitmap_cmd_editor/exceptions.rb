module BitmapCmdEditor
  # @author Diego Hernán Piccinini Lagos
  class NotImplementedCommand < NotImplementedError; end
  class CreateImageArgumentError < ArgumentError; end
  class MoreColumnsThanAllowed < RangeError; end
  class MoreRowsThanAllowed < RangeError; end
  class LessColumnsThanAllowed < RangeError; end
  class LessRowsThanAllowed < RangeError; end
  class OutOfRange < RangeError; end
  class ClearImageArgumentError < ArgumentError; end
  class ColourPixelArgumentError < ArgumentError; end
  class HorizontalLineArgumentError < ArgumentError; end
  class VerticalLineArgumentError < ArgumentError; end
  class FillRegionArgumentError < ArgumentError; end
end