require_relative "movetree.rb"

class KnightSearcher
  attr_accessor :tree
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

m = MoveTree.new([3,3], 3)
m.start_generate
k = KnightSearcher.new(m)
puts k.parent_trace(k.bfs_for([1,3]))

# def bfs_for(coords)
#   children = []
#   return @current_node if (@current_node.x == coords[0] && @current_node.y == coords[1])
#   @current_node.children.each {|x| children << x}
#   children.each do |child|
#     break if (@current_node.x == coords[0] && @current_node.y == coords[1])
#     @current_node = child
#     bfs_for(coords)
#   end
#   @current_node = @current_node.parent
#   puts "#{@current_node.x},#{@current_node.y}"


# end
