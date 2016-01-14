
Coordinate = Struct.new(:x, :y, :depth)

class MoveGraph

	MOVE_PAIRS = [ [1, 2],[2, 1], [2, -1],
                 [1,-2],[-1,-2],[-2,-1],
                 [-2,1],[-1,2]
               ]

  attr_reader :start

	def initialize(board_size = 8)
    @board_size = board_size
    @start = Coordinate.new(x, y, 0)
    @count = 1
    @list = Hash.new(board_size**2) { Array.new }
	end

	def build_list

	end
end