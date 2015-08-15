Square = Struct.new(:coords, :depth, :parent_coords, :children)

class MoveTree

  attr_accessor :root

  def initialize(start, max_depth)
    @root = Square.new(start, 0, [], [])
    @max_depth = max_depth
    @node_count = 1
    build_tree
  end


  def tree_inspect
    puts "Tree has #{@node_count} nodes at max depth of #{@max_depth}"
  end


  def build_tree
    queue = [@root]

    until queue.empty?

      current_node = queue.shift
      moves = get_valid_moves_from(current_node.coords, current_node.parent_coords)
      
      childs_parent_coords = current_node.parent_coords + [current_node.coords]
      childs_depth = current_node.depth + 1

      moves.each do |move|
        child = Square.new(move, childs_depth, childs_parent_coords, [])
        current_node.children << child
        @node_count += 1

        queue << child unless childs_depth == @max_depth
      end

    end
  end
  

  def get_valid_moves_from(coords, parent_coords)

    x = coords[0]
    y = coords[1]
    valid_moves = []
    legal_moves = [ [x+1, y-2], [x+2, y-1], [x+2, y+1], [x+1, y+2],
                   [x-1, y+2], [x-2, y+1], [x-2, y-1], [x-1, y-2] ]
    
    legal_moves.each do |move|
      if (1..8).include?(move[0]) && 
         (1..8).include?(move[1]) &&
         !parent_coords.include?(move) # We don't want to move back to any parent's coords
            valid_moves << move
      end
    end

    valid_moves

  end
  
end