Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  def initialize(coordinates, max_depth=1)
    @coordinates = coordinates
    @max_depth = max_depth
  end




end