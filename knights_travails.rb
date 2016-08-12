# determine the # of moves to get knight from one position to the next

require_relative 'knight'
require_relative 'board'
require_relative 'tree'

require 'pry'

# Root node is the starting position
# Each child of the root is then all squares fanning out from that Root



class KnightsTravail


	def initialize( start, target )

		@tree = Tree.new( start )
		@target = target

	end



	def find_moves

		# first we take the first move and add it to the queue

	end



end


game = KnightsTravail.new( [3,4], [6,7] )
game.find_moves