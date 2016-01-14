require_relative 'move_tree.rb'

class KnightSearcher

  def initialize(tree)
    @tree = tree
    @queue = []
  end

  def bfs_for(target_coords)
    @queue << @tree.root
    current_node = @queue.shift

    until([current_node.x, current_node.y]) == target_coords || current_node.nil?
      current_node.children.each { |c| @queue << c }
      current_node = @queue.shift
    end
    @queue = []
    print_output(current_node)
  end

  def dfs_for(target_coords)
    @queue << @tree.root
    current_node = @queue.pop

    until([current_node.x, current_node.y]) == target_coords || current_node.nil?
      current_node.children.each { |c| @queue << c }
      current_node = @queue.pop
    end
    @queue = []
    print_output(current_node)
  end

  def print_output(node)
    puts "#{node.depth} Moves:"
    move_list = []
    until node == nil
      move_list << [node.x, node.y]
      node = node.parent
    end
    move_list.reverse.each { |loc| puts loc.inspect }
  end
end

tree = MoveTree.new([0,0], 8)
searcher = KnightSearcher.new(tree)
searcher.bfs_for([6,2])
searcher.dfs_for([6,2])
