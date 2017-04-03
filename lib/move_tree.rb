Move = Struct.new(:x , :y, :depth, :children, :parent)

class MoveTree

  attr_reader :starting_square, :max_depth, :starting_position

  def initialize(starting_position, max_depth)
    raise ArgumentError, "starting_position must be an array!" unless starting_position.is_a?(Array)
    @max_depth = max_depth
    @starting_position = starting_position
    @starting_square = Move.new(starting_position[0], starting_position[1])
    @possible_moves  = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  end

  def add_children(square, depth = 1)
    raise ArgumentError, "input must be a struct!" unless square.is_a?(Struct)

    possible_squares = @possible_moves.map do |coord|
      Move.new(coord[0] + square.x, coord[1] + square.y, depth, nil, square)
    end
    square.children = possible_squares.select { |node| node.x.between?(0, 7) && node.y.between?(0, 7) }
  end

  def add_more_children(squares = @starting_square.children, depth = 1)
    return if depth == @max_depth
   
    squares.each do |square|
      add_children(square, depth + 1)
      add_more_children(square.children, depth + 1)
    end
  end

end











