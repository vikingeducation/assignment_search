require_relative 'move_tree.rb'
require 'pry'

class KnightSearcher

  def initialize(tree)
    @tree = tree
    @searched_nodes = []
  end

  #conducts search through iterations of depth layers
  def bfs_for(target_coords)
    queue = [@tree.root]
    until queue.empty?
      curr_node = queue[0] 
      if match?(curr_node, target_coords)
        search_trail
        break
      end
      queue += curr_node.children
      #search queue for children
      queue.shift
    end
  end

  def dfs_for(target_coords)
    stack = [@tree.root]
    until stack.empty?
      curr_branch = stack.pop
      break if match?(curr_branch, target_coords)
      stack += curr_branch.children
    end
    search_trail
  end


  def match?(curr_node, target_coords)
    @searched_nodes << curr_node
    [curr_node.x, curr_node.y] == target_coords
  end

  def search_trail
    puts "#{@searched_nodes.size} Moves:"
    @searched_nodes.each {|node| puts "[#{node.x}, #{node.y}]" }
    return
  end

end

=begin

load 'knight_searcher.rb'
b = MoveTree.new([3,3], 1)
a = KnightSearcher.new(b)
a.dfs_for([4,1])
a.bfs_for([4,1])


=end