Move = Struct.new(:x, :y, :depth, :children, :parent)
  $BOARD_SIZE = 8
  $VECTORS = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [-2, 1], [-2, -1], [2, -1]]
class MoveTree
  attr_accessor :start, :max, :root

  def initialize(start, max_depth)
    @start = start
    @max = max_depth
    @root = Move.new(start[0], start[1], 0, [], nil)
    @board = Array.new
  end

  create_children(parent)
    $VECTORS.each do |vector|
      x = parent.x +vector[0]
      y = parent.y + vector[1]
      if (0..7).include?(x + vector[0]) &&  (0..7).include?(y + vector[1]) && @root.x != x && @root.y != y
        parent.children << Move.new(x, y], parent.depth +1, [], parent)
      end
    end
  end

end
