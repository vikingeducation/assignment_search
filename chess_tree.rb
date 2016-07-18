Node = Struct.new(:x, :y, :depth, :children, :parent)

class ChessTree
  attr_reader :size, :max_depth, :start, :root, :initial_depth 
  POSSIBLE_MOVES = [[1,2],[2,1], [-1, -2], [-2, -1],
                    [-1, 2], [2, -1], [1,-2],[-2, 1]]

  def initialize(size, max_depth)
    @total_children = 0
    @root = nil
    @size = size + 1
    @max_depth = max_depth
    @start = ""
    @finish = ""
    @initial_depth = 0
  end

  def ask_start
    puts "Where do you want to start?(pick an x, y coordinate)"
    @start = gets.chomp.split(",").map(&:to_i)
  end

  def ask_target
    puts "Where do you want to finish?(pick an x, y coordinate)"
    @finish = gets.chomp.split(",").map(&:to_i)
  end

  def make_root
    start = ask_start
    @root = Node.new(start[0], start[1], 0, [], nil)
  end

=begin
  def create_tree
    make_root
    current_node = @root
    make_children(current_node)
    counter = 1
    until counter > max_depth
      current_node.children.each do |child|
        make_children(child)
        counter += 1
        current_node = child
      end
    end
  end
=end

  def make_children(node)
    #return nil if node.depth > @max_depth
    POSSIBLE_MOVES.each do |move|
      if (node.x + move[0] < size && node.y + move[1] < size) &&
          (node.x + move[0] >= 0 && node.y + move[1] >= 0)
        child = Node.new(node.x + move[0], node.y + move[1], node.depth + 1, [], node)
        node.children << child
        @total_children += 1
        @initial_depth += 1
        make_children(child) unless child.depth == @max_depth
      else
        next
      end
    end
  end

  def check_target?(child)
    child.x == @finish[0] && child.y = @finish[1]
  end
end