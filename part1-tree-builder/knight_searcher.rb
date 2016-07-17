require_relative 'move_tree'

class KnightSearcher

  def initialize(tree)
    #for bfs
    @tree = tree
    @path = []
    @queue = []
    @moves = 0
    @current_node = nil
    @checked_moves = []

    #for dfs
    @stack = []
  end

  def bfs_for(target_coords)
   find_target(target_coords)
   find_path(target_coords)
   print_message
  end

  def find_target(target_coords)
    @queue << @tree.root
    @current_node = @queue.shift
    @checked_moves << @current_node
    until [@current_node.x,@current_node.y] == target_coords
      @current_node.children.each do |child|
        @queue << child
      end   
      @current_node = @queue.shift
      until !@checked_moves.include?(@current_node)
        @current_node = @queue.shift
      end
      @checked_moves << @current_node
    end
  end

  def find_path(target_coords)
    @path << target_coords
    until @current_node == @tree.root
      @path << [@current_node.parent.x,@current_node.parent.y]
      @moves += 1
      @current_node = @current_node.parent
    end
  end

  def print_message
    puts "#{@moves} moves:"
    index = @path.length-1
    index.downto(0) {|i| puts "[#{@path[i][0]},#{@path[i][1]}]"}
  end

  def dfs_for(target_coords)
    @stack << @tree.root
    @current_node = @stack.pop
    @checked_moves << @current_node
    until ([@current_node.x,@current_node.y] == target_coords)
      if @current_node.children
        @current_node.children.each do |child|
          @stack << child
        end
      end
      @current_node = @stack.pop
      until !@checked_moves.include?(@current_node)
        @current_node = @stack.pop
      end
      @checked_moves << @current_node
    end
    find_path(target_coords)
    print_message
  end

end

tree = MoveTree.new([3,3],3)
bfs_searcher = KnightSearcher.new(tree)
dfs_searcher = KnightSearcher.new(tree)
bfs_searcher.bfs_for([1,3])
dfs_searcher.dfs_for([1,3])
