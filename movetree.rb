Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  MOVE_PAIRS = [ [1, 2],[2, 1], [2, -1], 
                 [1,-2],[-1,-2],[-2,-1], 
                 [-2,1],[-1,2]
               ]

	def initialize(coord_pair, max_depth = 1)
		@coord_pair = coord_pair
		@max_depth = max_depth
    @board_size = 8
	end


  def build_tree
    
  end

  def possible_moves(move)
    MOVE_PAIRS.map do |x, y|
      new_x = move.x + x
      new_y = move.y + y
      [new_x, new_y] unless off_board?(new_x, new_y)
    end.compact
  end

  def off_board?(x, y)
    x >=@board_size || y >= @board_size || x < 0 || y < 0
  end


	def inspect
		puts "Your tree has #{total_nodes} Move nodes and a maximum depth of #{max_depth}"
	end
end

tree = MoveTree.new([3,3], 1)
move = Move.new(2,2)
print tree.possible_moves(move)