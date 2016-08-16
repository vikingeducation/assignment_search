# determine the # of moves to get knight from one position to the next

require_relative 'knight'
require_relative 'board'
require_relative 'tree'

require 'pry'




class KnightsTravail


	def initialize( start, target )

		@tree = Tree.new( start )
		@target = target

	end



	def find_moves


	end



end


game = KnightsTravail.new( [3,4], [6,7] )
game.find_moves