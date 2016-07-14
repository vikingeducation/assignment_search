Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  def initialize(coordinates, max_depth=1)
    @coordinates = coordinates
    @max_depth = max_depth
    @board_max = 7
    @board_min = 0
  end

  def get_coordinates(x, y)
   coordinate_array = [
    [x+2, y-1],
    [x+2, y+1],
    [x-2, y-1],
    [x-2, y+1],
    [x+1, y-2],
    [x+1, y+2],
    [x-1, y-2],
    [x-1, y+2],
   ] 
  end

  def invalid_coordinate?(input)
    input < @board_min || input > @board_max
  end

  def invalid_move?(x,y)
   invalid_coordinate?(x) || invalid_coordinate?(y) 
  end

  def next_coordinate(x,y)
    get_coordinates.reject {|coordinates| invalid_move?}
  end

end