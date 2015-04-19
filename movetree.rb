Square = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  attr_reader :start_pos, :parent_node

  def initialize(coordinates, max_depth)
    @start_pos = Square.new(coordinates[0], coordinates[1], 0, [], nil)
    @max_depth = max_depth
    @size = 1
    @valid_moves = [ [-2, 1], [2, -1], [-2, -1], [2, 1], [1, 2], [-1, 2], [1, -2], [-1, -2]]
    create_tree(@start_pos)
  end

  def in_bounds?(coordinates)
    coordinates.all? { |coord| (0..7).include?(coord) }
  end

  def inspect
    puts "Your tree has #{@size} nodes and a max depth of #{@max_depth}."
  end

  def create_tree(parent_node)
    @valid_moves.each do |move|
      new_node_x = parent_node.x + move[0]
      new_node_y = parent_node.y + move[1]
      depth = parent_node.depth + 1
      if in_bounds?([new_node_x, new_node_y])
        new_node = Square.new(new_node_x, new_node_y, depth, [], parent_node)
        parent_node.children << new_node
        @size += 1
        if new_node.depth < @max_depth
          create_tree(new_node)
        end
      end
    end
  end

end
