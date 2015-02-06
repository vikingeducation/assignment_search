class MoveTree

  Square = Struct.new(:x,:y,:depth,:children)

  attr_reader :tree, :max_depth, :num_of_nodes

  def initialize(coordinates,max_depth)
    @tree = Square.new(coordinates[0],coordinates[1],0,[])
    @max_depth = max_depth
    @num_of_nodes = 1
    attach_children(@tree)
  end

  def attach_children(node)
    depth = node.depth
    until depth == max_depth
      depth += 1
      relative_moves.each do |move|
        new_x = node.x + move[0]
        new_y = node.y + move[1]
        next_location = [new_x,new_y]
        if on_the_board?(next_location)
          new_node = Square.new(new_x,new_y,depth,[])
          node.children << new_node
          @num_of_nodes += 1
          attach_children(new_node)
        end
      end
    end
  end

  def inspect
    puts "This tree has #{num_of_nodes} nodes and a max depth of #{max_depth}."
  end

  def relative_moves
    [[-2,-1],[-2,1],[-1,-2],[-1,2],[1,-2],[1,2],[2,-1],[2,1]]
  end

  def on_the_board?(coordinates)
    coordinates.all? { |coord| (0..7).include? coord }
  end
end