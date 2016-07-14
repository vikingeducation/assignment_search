# move_tree.rb

class MoveTree
  def initialize(start_coordinates, max_depth = 1)
    @start_x = start_coordinates[0]
    @start_y = start_coordinates[1]
    @max_depth = max_depth
    @root = Move.new(@start_x, @start_y, 0, nil, nil)
    generate_moves_starting_at(@root)
  end

  def generate_moves_starting_at(move)

  end

  def all_possible_moves(move)

  end

  def all_possible_coordinates(x, y)
    possible_moves = [
      [x + 1, y + 2],
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x + 1, y - 2],
      [x - 1, y - 2],
      [x - 2, y - 1],
      [x - 2, y + 1],
      [x - 1, y + 2],
    ]

    possible_moves.select. do |coordinates|
      coordinates.all? do |x, y|
        coordinates[
      end

    end

  end
end

