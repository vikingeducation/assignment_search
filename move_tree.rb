 Move = Struct.new(:x, :y, :depth, :parent, :children)

 class MoveTree
    attr_reader :start_node, :max_depth, :node_count
    
    # tree = MoveTree.new([3,3], 1)
    def initialize(start_coords, max_depth)
      x, y = start_coords[0], start_coords[1]

      @start_node = Move.new(x, y, nil, nil, [])
      @max_depth = max_depth
      @node_count = 1 # the initial one

      build_tree
      puts inspect
    end
    
    def inspect
      "This move tree begins at [#{start_node.x},#{start_node.y}], has a maximum depth of #{max_depth}, and has #{node_count} total nodes."
    end



    private

    #recursively builds the tree of possible moves to the given
    # @max_depth.
    def build_tree(current_node = self.start_node, depth = 0)

      if depth < self.max_depth
        append_next_moves(current_node)

        # build the tree again on each child
        current_node.children.each do |child| 
          build_tree(child, depth + 1)
        end
      end

    end
    

    # appends all possible next_moves to the current move
    # properly updates the number of nodes
    def append_next_moves(current_move)
      return unless current_move.children.empty?

      next_moves = possible_moves(current_move)
      @node_count += next_moves.size


      next_moves.each do |move| 
        new_move = Move.new( move[0], move[1], 
                               nil, current_move , [] )
        current_move.children << new_move
      end
    end


    #takes a Move
    #returns a 2D array of all legal moves for a knight 
    #from one position, in the form of coordinate pairs
    def possible_moves(move)
      x, y = move.x, move.y

      [ [x+2, y-1], [x+2, y+1], 
        [x-2, y+1], [x-2, y-1],
        [x+1, y+2], [x-1, y+2], 
        [x+1, y-2], [x-1, y-2] ].select { |move| legal?(move) } 
    end

    #checks if a move is legal for a knight from the current location
    def legal?(move)
      move[0].between?(0, 7) && move[1].between?(0,7)
    end
  end #class