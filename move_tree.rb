Move = Struct.new(:x, :y, :depth, :children, :parent)


class MoveTree

	def initialize(coords, max_depth)
		@coords = coords
		@max_depth = max_depth
		@root = Move.new(@coords[0], @coords[1], 0, [], nil)
		@total_nodes = 0
	end

	def inspect
		puts "Your tree has #{@total_nodes} Move nodes and depth of #{@max_depth}"
	end
end
