Move = Struct.new(:x, :y, :depth, :children, :parent)

VECTORS = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]

class MoveTree

  def initialize(starting, depth)
    @starting_pos = starting
    @depth = depth
  end

  def build_move(x, y, depth)
    Move.new(x, y, depth)
  end

  def moves_array
    # From any position we can move + or - 2 to either x or y and + or - 1 to the other direction.
    # potential x's are x -2 and x + 2
    # potential y's are y - 1 and y + 1


  end

end
