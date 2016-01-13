move = Struct.new

some_move = Move.new(:x, :y, :depth, :children, :parent)

class MoveTree

	def initialize(coord_pair, max_depth = 1)
		@coord_pair = coord_pair
		@max_depth = max_depth
	end

	def inspect
		puts "Your tree has #{total_nodes} Move nodes and a maximum depth of #{max_depth}"
	end
end

tree = MoveTree.new([3,3], 1)