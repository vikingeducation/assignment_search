# Knight's Travails

# Knight - build and inspect tree


module KnightsTravails

  class MoveTree
    attr_reader :start_node, :max_depth, :node_count

    # cf tree set up test
    def initialize (start_coords, max_depth)
      x, y = start_coords[0], start_coords[1]

      @start_node = Move.new(x, y, nil, nil, [])
      @max_depth = max_depth
      @node_count = 1 # initial node

      build_tree
      puts inspect
    end

    def inspect
      "Move Tree starts at [#{start_node.x}, #{start_node.y}]; maximum depth: #{max_depth}; number of nodes: #{node_count}."
    end

    private

    # build tree of moves recursively until maximum depth reached
    def build_tree(current_node = self.start_node, depth = 0)

      if depth < self.max_depth
        append_next_moves(current_node)

        # build new tree from children
        current_node.children.each do |child|
          build_tree(child, depth + 1)
        end
      end

    end

    # append all possible next moves to current move
    # update number of nodes
    def append_next_moves(current_move)
      return unless current_move.children.empty?

      next_moves = possible_moves(current_move)
      @node_count += next_moves.size
      next_moves.each do |move|
        new_move = Move.new(move[0], move[1], nil, current_move, [])
        current_move.children << new_move
      end
    end

    # return array of legal moves from a particular position, in the form of coordinate pairs
    def possible_moves(move)
      x, y = move.x, move.y

      [ [x+2, y-1], [x+2, y+1],
        [x-2, y-1], [x-2, y+1], 
        [x+1, y+2], [x-1, y+2],
        [x+1, y-2], [x-1, y-2] ].select {|move| legal?(move)}
    end

    # is move legal?
    def legal?(move)
      move[0].between?(0, 7) && move[1].between?(0,7)
    end

  end # class MoveTree

end # module KnightsTravails








