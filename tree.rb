
Move = Struct.new( :coord, :moves, :parent )

class Tree

	attr_reader :start

	def initialize( start )

		@start = Move.new( start, [], nil )

	end



end