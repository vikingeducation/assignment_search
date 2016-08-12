# board is 8x8
require 'pry'

class Board

	attr_reader :board

	def initialize

		@board = Array.new( 8 ) { Array.new( 8, 0 ) }

	end



end


