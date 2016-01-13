Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  def initialize(coords, max_depth)
    @max_depth = max_depth
  end

end