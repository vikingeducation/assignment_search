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
    def valid_move?(x, y)
      (0..7).include?(x) && (0..7).include?(y)
    end
  end
end
