
Coordinate = Struct.new(:x, :y, :searched)

class MoveGraph

	MOVE_PAIRS = [ [1, 2],[2, 1], [2, -1],
                 [1,-2],[-1,-2],[-2,-1],
                 [-2,1],[-1,2]
               ]

  attr_reader :start, :coordinates

	def initialize(board_size = 8)
    @board_size = board_size
    @matrix = Array.new(board_size) { Array.new(board_size) }
    @coordinates = {}
	end

  #   0  1  2   3  4  5  6   7
  # 0 (Struct of :possible coordinates, :searched or not searched)
  # 1
  # 2
  # 3
  # 4
  # 5
  # 6
  # 7

	def build_graph
    @matrix.each_with_index do |row, x|
      row.each_with_index do |move, y|
        move = Coordinate.new(x,y)
        @matrix[x][y] = possible_moves(move)
      end
    end
	end

  def get_coordinates(x,y)
    @matrix[x][y]
  end

  # make all identical coordinates point to the same object
  # so when we set searched=true, they all change
  def make_coordinate_hash
    @matrix.each_with_index do |row, x|
      row.each_with_index do |move, y|
        move = Coordinate.new(x,y)
        @coordinates[[x,y]] = move
      end
    end
  end

  def possible_moves(move)
    MOVE_PAIRS.map do |x, y|
      new_x = move.x + x
      new_y = move.y + y
      @coordinates[[new_x, new_y]] unless off_board?(new_x, new_y)
    end.compact
  end

  def off_board?(x, y)
    x >=@board_size || y >= @board_size || x < 0 || y < 0
  end

end

mg = MoveGraph.new
mg.make_coordinate_hash
mg.build_graph
# print mg.get_coordinates(0,0)
c = Coordinate.new(1,3)
arr = [c, c]
print arr
c.searched = true
print arr
print mg.coordinates