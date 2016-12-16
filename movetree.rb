Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  def initiate(coordinate, depth)
    @coordinate = coordinate
    @max_depth = depth
  end



end