Move = Struct.new(:x, :y, :depth, :children, :parent)
#Cell = Struct.new(:x, :y, :empty)

class MoveTree

  def initialize(coords, max_depth)
    @root = Move.new(coords[0], coords[1], 0, [], [])
    @move_count = 0
    @max_depth = max_depth
    @move_tree = add_moves #array of move structs
    

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
    current_move2 = @root
    p current_move.children
    until current_move.depth >= @max_depth && current_move2.depth >= @max_depth
      [-2, 2].each do |delta2|
        [-1, 1].each do |delta1|
          
          x_coord = current_move.x + delta2 
          y_coord = current_move.y + delta1

          x_coord2 = current_move.x + delta1
          y_coord2 = current_move.y + delta2
          
          if x_coord.between?(0, 7) && y_coord.between?(0, 7)
            next_move = Move.new(x_coord, y_coord, current_move.depth + 1, [], current_move)
            p current_move.children
            current_move.children << next_move
            current_move = next_move
            @move_count += 1
          end

          if x_coord2.between?(0, 7) && y_coord2.between?(0, 7)
            next_move2 = Move.new(x_coord2, y_coord2, current_move2.depth + 1, [], current_move2)
            current_move2.children << next_move2
            current_move2 = next_move2
            @move_count += 1
          end
          
        end
      end
    end
    @root
  end

  def inspect
    puts "Your tree has #{@move_count} Move nodes and a maximum depth of #{@max_depth}."
  end
end


m = MoveTree.new([4, 4], 1)
p m.add_moves
m.inspect

#x = 4, y = 4

# 3, 6
# 3, 2
# 5, 6
# 5, 2
# 2, 5
# 2, 3
# 6, 5
# 6, 3