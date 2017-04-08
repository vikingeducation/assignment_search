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
  end
end
