square = Struct.new(:x, :y, :depth, :children)

class MoveTree

  def initialize(start, max_depth)
    @start = start
    @max_depth = max_depth
  end


  def build_tree
    
  end
  

  def get_valid_moves_from(coords)

    x = coords[0]
    y = coords[1]
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