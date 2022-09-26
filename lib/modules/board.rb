class Board
  attr_reader :width, :height

  def initialize
    default_size = 7
    @width  = default_size
    @height = default_size
  end
end
