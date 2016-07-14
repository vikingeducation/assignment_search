require_relative "movetree.rb"

class KnightSearcher
  attr_accessor :movetree
  def initialize(movetree)
    @tree = movetree
    @current_node = movetree.root
  end

  def bfs_for(coords)
    children = []
    return @current_node if (@current_node.x == coords[0] && @current_node.y == coords[1])
    @current_node.children.each {|x| children << x}
    children.each do |child|
      break if (@current_node.x == coords[0] && @current_node.y == coords[1])
      @current_node = child
      bfs_for(coords)
    end
    @current_node = @current_node.parent
    puts "#{@current_node.x},#{@current_node.y}"
    

  end



end

m = MoveTree.new([0,0], 2)
m.start_generate
k = KnightSearcher.new(m)
k.bfs_for([1,2])
