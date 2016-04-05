Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  attr_reader :root

  POSSIBLE_MOVES = [[-1,2],[-1,-2],[1,2],[1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]

  def initialize( pair, max_depth = 1)
    @max_depth = max_depth
    @root = Move.new(pair[0], pair[1], 0, [], nil)
    @count = 1
    @board_size = 8
    create_tree
  end

  def create_tree
    stack = [@root]

    while current_node = stack.pop
      current_node.children = create_children(current_node)

      current_node.children.each do |child|
        stack << child unless child.depth == @max_depth
      end
    end
  end


  def create_children(current_node)
    depth = current_node.depth + 1
    x, y = current_node.x, current_node.y
    children = []

    POSSIBLE_MOVES.each do |move_x, move_y|
      new_x = x + move_x
      new_y = y + move_y
      children << Move.new(new_x, new_y, depth, [], current_node) unless off_board?(new_x, new_y)
      @count += 1
    end
    children
  end

  def off_board?(x, y)
    x < 1 || y < 1 || x > @board_size || y > @board_size
  end


  def inspect
    puts "there is #{@count} move nodes, and a maximum depth of #{@max_depth}"
  end
end

#tree = MoveTree.new([4,4], 2)
#tree.inspect