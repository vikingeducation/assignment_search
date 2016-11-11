Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree
  
  MOVEMENT_VECTORS = [ 
  										 [1,2], [1,-2], [-1,2], [-1,-2]
  										 [2,1], [2,-1], [-2,1], [-2,-1]
										 ]

	attr_reader :max_depth

  def initialize(starting_position, max_depth = 1)
  	@max_depth = max_depth
  	@starting_position = starting_position
  end

  def inspect	
  	# Your tree has 9 move nodes and a max depth of 1
  	"Your tree has #{move_nodes} and a max depth of #{max_depth}"
  end

  def 

end