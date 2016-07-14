Move = Struct.new(:x, :y, :depth, :children, :parent)
#Cell = Struct.new(:x, :y, :empty)

class MoveTree
  def intialize(coords, max_depth)
    @root = Move.new(coords[0], coords[1], 0, nil, nil)
    @max_depth = max_depth
    @move_tree = add_moves #array of move structs
    @move_count = @move_tree.length

  end

  def add_moves
    #( x+1, y+2 )
    #( x+2, y+1 )
    #( x+2, y-1 )
    #( x-1, y-2 )
    #( x-2, y-1 )
    #( x-2, y+1 )
    #( x+1, y-2 )
    #( x-1, y+2 )
    current_move = @root

    [-2, 2].each do |delta2|
      [-1, 1].each do |delta1|
        
        x_coord = current_move.x + delta2 
        y_coord = current_move.y + delta1

        x_coord2 = current_move.x + delta1
        y_coord2 = current_move.y + delta2
        
        if x_coord.between?(0, 7) && y_coord.between?(0, 7)
          next_move = Move.new(x_coord, y_coord, current_move.depth + 1, nil, current_move)
        elsif x_coord2.between?(0, 7) && y_coord2.between?(0, 7)
          next_move2 = Move.new(x2_coord, y2_coord, current_move.depth + 1, nil, current_move)
        end
        
      end
    end
  end

  def inspect
    puts "Your tree has #{@move_count} Move nodes and a maximum depth of #{@max_depth}."
  end
end