require_relative './move_tree'

module KnightsTravails
  class KnightSearcher
    attr_reader :tree

    def initialize(tree)
      @tree = tree
    end

    def bfs_for(target_coords)
      x, y = target_coords[0], target_coords[1]
      queue = []
      queue << tree.root

      until queue.empty?
        current_node = queue.shift
        return current_node if current_node.x == x && current_node.y == y

        current_node.children.each { |child| queue << child }
      end

      nil
    end

    def dfs_for(target_coords)
    end
  end
end

if $0 == __FILE__
  include KnightsTravails
  tree = MoveTree.new([0, 0], 1)
  searcher = KnightSearcher.new(tree)
  p searcher.bfs_for([2, 1])
end
