Square = Struct.new(:x, :y, :depth, :children)

class MoveTree

  def initialize(start, max_depth)
    @root = Square.new(start[0], start[1], 0, [])
    @max_depth = max_depth
    @node_count = 1
    build_tree
  end


  def inspect
    puts "Tree has #{@node_count} nodes at max depth of #{@max_depth}"
  end


  def build_tree
    queue = [@root]

    until queue.empty?

      current_node = queue.shift
      moves = get_valid_moves_from(current_node.x, current_node.y)
      depth = current_node.depth + 1

      moves.each do |move|
        child = Square.new(move[0], move[1], depth, [])
        
        current_node.children << child
        @node_count += 1
        queue << child unless depth == @max_depth
      end

    end    
  end
  

  def get_valid_moves_from(x, y)

    valid_moves = []
    legal_moves = [ [x+1, y-2], [x+2, y-1], [x+2, y+1], [x+1, y+2],
                    [x-1, y+2], [x-2, y+1], [x-2, y-1], [x-1, y-2] ]
    
    legal_moves.each do |move|
      if (1..8).include?(move[0]) && (1..8).include?(move[1])
         valid_moves << move
      end
    end

    valid_moves

  end
  
end