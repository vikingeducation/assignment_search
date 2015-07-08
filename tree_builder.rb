Square = Struct.new(:x, :y. :depth, :children)

class MoveTree

  def initialize(coord = [0,0], max_depth = 1) #constructs a tree
    @coord = coord
    @max_depth = max_depth
    @board = create_board
    potential_moves(coord, max_depth)
  end

  def create_board #creates 8x8 board
    board = Array.new{8}
    board.each do |index|
      board[index] = Array.new(8)
    end
  end

  def potential_moves(origin, max_depth)
    #check if position is empty
    #[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,-1], [-2,1]
    origin

  end

  def valid_coord(coord)
    x = coord[0]
    y = coord[1]
    (0..7).include?(x) && (0..7).include?(y)
  end

  def inspect

  end

end