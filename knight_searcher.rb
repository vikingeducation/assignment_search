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
      x, y = target_coords[0], target_coords[1]
      stack = []
      stack.push(tree.root)
      current_depth = 0

      until stack.empty?
        current_node = stack.pop
        return current_node if current_node.x == x && current_node.y == y

        current_node.depth = current_depth

        # naive DFS method - simply push the children of each node in order
        # onto the stack
        current_node.children.each do |child|
          stack.push(child) if child.depth.nil?
        end

        current_depth += 1
      end

      nil
    end

    def moves_taken_to(target)
      stack = []
      num_moves = -1
      current_node = target
      while current_node
        stack.push("[#{current_node.x}, #{current_node.y}]")
        current_node = current_node.parent
        num_moves += 1
      end

      puts "Number of Moves: #{num_moves}"
      puts stack.pop until stack.empty?
    end
  end
end

if $0 == __FILE__
  include KnightsTravails
  tree = MoveTree.new([0, 0], 5)
  tree.inspect

  searcher = KnightSearcher.new(tree)

  puts "\nRunning BFS"
  result = searcher.bfs_for([4, 2])
  searcher.moves_taken_to(result)

  puts "\nRunning DFS"
  result = searcher.dfs_for([4, 2])
  searcher.moves_taken_to(result)
end
