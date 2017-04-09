module KnightsTravails
  class MoveTree
    Move = Struct.new(:x, :y, :depth, :children, :parent)

    attr_reader :max_depth,
                :num_nodes,
                :root

    def initialize(starting_coords, max_depth)
      @starting_coords = starting_coords
      @max_depth = max_depth
      @num_nodes = 0
      @root = nil
    end

    def inspect
    end

    private

    def build_tree
    end

    # we use array indices for x and y coordinates of the chessboard,
    # so valid coordinates range from (0,0) to (7,7)
    def valid_position?(x, y)
      (0..7).include?(x) && (0..7).include?(y)
    end

    # returns an array of possible moves for our Knight
    # from a starting coordinate
    def possible_moves(x, y)
      moves = []
      move_offsets = [[-2, 1], [-2, -1], [2, 1], [2, -1],
                      [1, 2], [-1, 2], [1, -2], [-1, -2]]

      move_offsets.each do |move_offset|
        new_x, new_y = x + move_offset[0], y + move_offset[1]
        moves << [new_x, new_y] if valid_position?(new_x, new_y)
      end

      moves
    end
  end
end
