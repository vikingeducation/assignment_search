# initialize a movetree with co-ords and max depth
# build tree
  # create a queue
  # add starting node to be co-ords and add depth to be 0
  # pop from queue set as current node
  # find valid moves for current node
    # set as children, and add to queue with depth(parent's depth + 1), parent
    # break if max depth reached

  



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

  def next_coordinates(x,y)
    get_coordinates(x, y).reject {|coordinates| invalid_move?(*coordinates)}
  end

end

t = MoveTree.new(1,2)
p t.next_coordinates(0,0)