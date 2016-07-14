Move = Struct.new(:x, :y, :depth, :children, :parent)



class MoveTree

  

  def initialize(position, max_depth)

    @starting_move = Move(position[0], position[1], 0, [], nil)
    @max_depth = max_depth
    @possible_move=[[-2, 1],
                    [-1, 2],
                    [ 1, 2],
                    [ 2, 1],
                    [-2,-1],
                    [-1,-2],
                    [ 1,-2],
                    [ 2,-1]]

  end

  def valid_move?(x, y)
    (1..8).include?(x) && (1..8).include?(y)
  end


  def move_tree(max_depth)
    counter = 0
    while counter < max_depth
    @possible_move.each do |move|
      (starting_position + starting_move).valid?
      starting_move.children << Move.new(new_x, new_y, 1, nil, starting_position)
    end
    counter += 1
  end


end