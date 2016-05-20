Move = Struct.new(:y, :x, :depth, :children, :parent)

class MoveTree

  attr_accessor :start_y, :start_x, :board, :root

  def initialize(start, depth)
    @start_x, @start_y, @depth = start[0], start[1], depth
    @board = Array.new(8) { Array.new(8) {"-"} }
    @root = Move.new(start_y, start_x, 0, [], nil)
    build_tree(@start_y, @start_x, depth)
  end

  def build_tree(y, x, depth)
    1.upto(depth) do |depth|
      move_up(y, x, depth, @root)
      move_down(y,x)
      move_left(y,x)
      move_right(y,x)
    end
  end

  def move_up(y, x, depth, parent)
    y -= 2
    x -= 1
    if (y).between?(0,7) && (x).between?(0,7)
      parent.children << Move.new(y, x, depth, nil, parent)
    end
  end
end
