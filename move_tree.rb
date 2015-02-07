Square = Struct.new(:x, :y, :depth, :children)

class MoveTree
  def initialize(coordinate_pair, max_depth)
    @start = Square.new(coordinate_pair[0], coordinate_pair[1], 0, [])
    @node_count = 0
    @max_depth = max_depth
    @possible_moves = [[-2, 1], [-1, 2], [1, 2], [2,1], [2, -1], [1, -2], [-1, -2], [-2, -1]]
  end

  def inspect
    puts "This tree has #{node_count} nodes and a max depth of #{max_depth}"
  end

  def generate_tree (node)
    @possible_moves.each do |move|
      offset_x = node.x + move[0]
      offset_y = node.y + move[1]
      return if out_of_bounds?([offset_x, offset_y])
      return if node.depth == max_depth
      child_node = Square.new(offset_x, offset_y, node.depth+1, [])
      node.children << child_node
      generate_tree(child_node)
    end
  end

  def out_of_bounds?(coordinate_pair)
    if ((coordinate_pair[0] < 0) || (coordinate_pair[0] > 7) || (coordinate_pair[1] < 0) || (coordinate_pair[1] > 7))
      return true
    else
      return false
    end
  end


end
