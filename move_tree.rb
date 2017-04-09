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

      build_tree
    end

    def inspect
    end

    private

    # builds the MoveTree based on the starting coordinate provided,
    # as well as the desired depth
    def build_tree
      x, y = @starting_coords[0], @starting_coords[1]
      @root = Move.new(x, y, 0, [], nil)

      current_node = nil
      current_depth = 0
      queue = []
      queue << @root

      until current_depth == self.max_depth
        queue.length.times do
          current_node = queue.shift

          possible_moves(current_node.x, current_node.y).each do |possible_move|
            move_node = Move.new(possible_move[0], possible_move[1], nil, [], current_node)

            current_node.children << move_node
            queue << move_node
          end
        end
        current_depth += 1
      end

      @root
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


if $0 == __FILE__
  move_tree = KnightsTravails::MoveTree.new([0, 0], 1)
  p move_tree.root
end
