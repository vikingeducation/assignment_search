Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree
  attr_accessor :root
  attr_reader :coordinate, :pair, :max_depth

  POSSIBLE_MOVES = [[-1,2],[-1,-2],[1,2],[1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]

  def initialize( pair, max_depth)
    @max_depth = max_depth
    @pair = pair
    @root = Move.new(pair[0], pair[1], 0, [], nil)
    @count = 1
    create_tree
  end

  def create_tree
    stack = []
    stack << @root

    until stack.empty?
      current_node = stack.pop
      current_node.children = create_children(current_node)

      current_node.children.each do |child|
        stack << child unless child.depth == @max_depth
      end
    end
  end


  def create_children(current_node)
    depth = current_node.depth + 1
    pair_x, pair_y = current_node.x, current_node.y
    children = []

    POSSIBLE_MOVES.each do |move_x, move_y|
      if (pair_x-move_x).between?(1,8) && (pair_y-move_y).between?(1,8)
        children << Move.new(pair_x-move_x, pair_y-move_y, depth, [], current_node)
        @count += 1
      end
    end
    children
  end


  def inspect
    puts "there is #{@count} move nodes, and a maximum depth of #{@max_depth}"
  end
end

tree = MoveTree.new([4,4], 2)
tree.inspect