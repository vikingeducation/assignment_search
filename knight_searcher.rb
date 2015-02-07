require_relative 'move_tree'
require_relative 'moves'

class KnightSearcher
  include Moves

  attr_reader :tree

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(target_coords)
    search_queue = []
    node = tree.root
    until [node.x,node.y] == target_coords
      search_queue += node.children
      node = search_queue.shift
    end
    puts "#{target_coords} was found in #{node.depth} moves."
    print_results(node)
    return node.depth
  end

  def dfs_for(target_coords)
    search_stack = []
    node = tree.root
    until [node.x,node.y] == target_coords
      search_stack += node.children
      node = search_stack.pop
    end
    puts "#{target_coords} was found in #{node.depth} moves."
    print_results(node)
    return node.depth
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