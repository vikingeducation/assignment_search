require_relative 'move_tree'
require_relative 'moves'

class KnightSearcher
  include Moves

  attr_reader :tree

  def initialize(tree)
    @tree = tree
  end

  def search(target_coords)
    to_be_searched = []
    node = tree.root
    until [node.x,node.y] == target_coords
      to_be_searched += node.children
      node = yield(to_be_searched)
    end
    puts "#{target_coords} was found in #{node.depth} moves."
    print_results(node)
    return node.depth
  end

  def bfs_for(target_coords)
    search(target_coords) { |queue| queue.shift }
  end

  def dfs_for(target_coords)
    search(target_coords) { |stack| stack.pop }
  end

  def print_results(node)
    moves_to_print = []
    until node.nil?
      moves_to_print << [node.x,node.y]
      node = node.parent
    end
    until moves_to_print.empty?
      print "#{moves_to_print.pop}\n"
    end
  end
end