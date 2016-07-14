Move = Struct.new(:x, :y, :depth, :children, :parent)
class MoveTree
  attr_accessor :start, :max, :root
  BOARD_SIZE = 8
  VECTORS = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [-2, 1], [-2, -1], [2, -1]]

  def initialize(start, max_depth)
    @start = start
    @max = max_depth
    @root = Move.new(start[0], start[1], 0, [], nil)
    @board = Array.new
    @total_nodes = 1
  end

  def start_generate
    generate_tree(@root)
  end

  def generate_tree(parent)
    return nil if parent.depth == @max
    create_children(parent)
    parent.children.each do |child|
      generate_tree(child)
    end
  end

  def my_inspect
    puts "Your tree has #{@total_nodes} Move nodes and maximum depth of #{@max}."
  end

  def create_children(parent)
    VECTORS.each do |vector|
      a = parent.x + vector[0]
      b = parent.y + vector[1]
      if (0..7).include?(a + vector[0]) &&
         (0..7).include?(b + vector[1]) &&
         @root.x != a && @root.y != b
        parent.children << Move.new(a, b, (parent.depth + 1), [], parent)
        @total_nodes += 1
      end
    end
  end
end
