Move = Struct.new(:x, :y, :depth, :children, :parent)

VECTORS = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]

class MoveTree

  def initialize(starting)
    @starting_pos = Move.new(starting[0], starting[1])
    @depth = depth
  end

  def build_move(x, y)
    Move.new(x, y)
  end

  def build_trees(starting_pos)
    @depth.times do 
      moves = moves_array(starting_pos)
      moves.map! do |move| 
        Move.new(move[0], move[1])
      end
      moves.each do |move|
        add_move(move)
      end
    end
  end

  def add_move(move)
    current_lvl = @starting_pos
    loop do
      
    end
  end

  def moves_array(starting_pos)
    x = starting_pos[0]
    y = starting_pos[1]
    possible_moves = []
    VECTORS.each do |move|
      possible_moves << [x + move[0], y + move[1]]
    end
    # iterate through possible_moves, removing any x,y pair in which either x or y is greater than 7 or less than 0
    possible_moves.select {|move| move[0] < 7 && move[1] < 7 && move[0] >= 0 && move[1] >= 0 }
  end

end
