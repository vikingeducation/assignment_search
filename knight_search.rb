require_relative "movetree.rb"

class KnightSearcher
  attr_accessor :tree, :current_node
  def initialize(movetree)
    @tree = movetree
    @current_node = nil
    @queue = [movetree.root]
    @checked_values = []
  end

  def bfs_for(coords)
    puts @queue.map{ |node| node_value(node) }.inspect
    @current_node = @queue.shift
    return @current_node if match?(@current_node, coords)
    @current_node.children.each do |child|
      next if child.nil?
      if !child.nil? && !@checked_values.include?(node_value(child)) && !@queue.include?(node_value(child))
        @queue << child
      end
    end
    @checked_values << node_value(@current_node)
    bfs_for(coords)
  end



  def parent_trace(node)
    ancestors = [node]
    until ancestors.last == @tree.root
      ancestors << node.parent
      node = node.parent
    end
    ancestors.reverse.each do |node|
      puts "#{node.x}, #{node.y}"
    end
  end

  def node_value(node)
    [node.x, node.y]
  end

  def match?(node, coords)
    return false if node.nil?
    node.x == coords[0] && node.y == coords[1]
  end

end

m = MoveTree.new([0,0], 3)
m.start_generate
k = KnightSearcher.new(m)
k.bfs_for([3,6])
