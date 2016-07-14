# knights_travails.rb

Move = Struct.new(:x, :y, :depth, :children, :parent)

#tree of moves

#construct a tree of potential moves from a given position using Move
#two inputs: 
#coordinate pair x*, y* to represent starting position
#max_depth  depth* to prevent tree from infinite loops



class MoveTree
  attr_reader :coord, :max_depth, :root

  def initialize(coord, max_depth)
    @root = Move.new(coord[0], coord[1], 0, nil, nil)

    @coord = coord #probably won't need this
    @max_depth = max_depth
    
  end

  #total # of nodes and max depth 

  def inspect
    p "Your tree has #{something} Move nodes and a maxium depth of #{@max_depth}"
  end

end



