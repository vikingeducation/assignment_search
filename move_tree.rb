  class MoveTree
    include KnightsTravails
    attr_accessor :start_node, :max_depth, :node_count

    def initialize(coords = nil, max_depth = nil)
      @start_node = Move.new(coords[0], coords[1], nil, nil, []) || [0,0]
      @max_depth = max_depth || 3
      @board_size = 8
      @node_count = 0
      build_tree
      puts inspect
    end

    def inspect
      "Your tree starts with [#{start_node.x}, #{start_node.y}].  It has a maximum depth of #{max_depth}, and #{node_count} total nodes."
    end

    def build_tree
      x = @start_node[0]
      y = @start_node[1]
      @tree = create_node(x, y)
    end

    def create_node(x, y, depth = 0, parent = nil)
      @node_count += 1
      node = Move.new(x, y, depth, [], parent)
      unless depth == @depth
        possible_moves(x, y) do |ex, why|
          node.children << create_node(ex, why, depth + 1, node)
        end
        node
      end
    end

    def possible_moves(x, y)
      [[x + 2, y - 1], [x + 2, y + 1],
       [x - 2, y + 1], [x - 2, y - 1],
       [x + 1, y + 2], [x - 1, y + 2],
       [x + 1, y - 2], [x - 1, y - 2]].select {|pos_move| legal?(pos_move)}
    end

    def legal?(move)
      ((move[0]).between?(0, 7)) && ((move[1]).between?(0, 7))
    end

  end
