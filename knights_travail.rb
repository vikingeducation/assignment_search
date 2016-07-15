Move = Struct.new(:x, :y, :depth, :children, :parent)
#Cell = Struct.new(:x, :y, :empty)

class MoveTree
  attr_reader :root
  def initialize(coords, max_depth)
    @root = Move.new(coords[0], coords[1], 0, [], nil)
    @move_count = 1
    @max_depth = max_depth
    #@move_tree = add_moves #array of move structs
    

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


    parent = @root

    until parent.depth >= @max_depth && parent.depth >= @max_depth
      get_children(parent)
      parent.children.each do |child|
        parent = child
        get_children(parent)
      end
    end
    @root
  end

  def inspect
    puts "Your tree has #{@move_count} Move nodes and a maximum depth of #{@max_depth}."
  end

  def get_children(parent)
    x_coord = parent.x
    y_coord = parent.y
    x_coord2 = parent.x
    y_coord2 = parent.y

    [-2, 2].each do |delta2|
      [-1, 1].each do |delta1|
           
           puts "parent x:#{parent.x}, parent y: #{parent.y}" 

        x_coord = parent.x + delta2 
        y_coord = parent.y + delta1
        puts "parent depth = #{parent.depth}"
        if x_coord.between?(0, 7) && y_coord.between?(0, 7)
          
          

          
          puts "x:#{x_coord}, y: #{y_coord}"
          next_move = Move.new(x_coord, y_coord, parent.depth + 1, [], parent)
          parent.children << next_move
          @move_count += 1
        end
        x_coord2 = parent.x + delta1
        y_coord2 = parent.y + delta2 
        puts "parent depth = #{parent.depth}"
        if x_coord2.between?(0, 7) && y_coord2.between?(0, 7)
           

          puts "x:#{x_coord2}, y: #{y_coord2}"
          next_move2 = Move.new(x_coord2, y_coord2, parent.depth + 1, [], parent)
          parent.children << next_move2
          @move_count += 1
        end
        
      end
    end
    parent
  end
end


m = MoveTree.new([4, 4], 1)
parent = m.root
p m.get_children(parent)
m.inspect

#x = 4, y = 4

# 3, 6
# 3, 2 yes
# 5, 6
# 5, 2
# 2, 5
# 2, 3 yes
# 6, 5
# 6, 3