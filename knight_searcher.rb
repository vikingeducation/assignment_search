require_relative 'move_tree.rb'

class KnightSearcher

  attr_accessor :tree, :current_node

  def initialize(tree)
    @root = tree.root
    @current_node = @root
    @path = []
    @depth = @current_node.depth
  end

  def bfs_for(target_coords)
    queue = [@root]
    until queue.empty?
      if queue[0].x == target_coords[0] && queue[0].y == target_coords[1]
        return list_moves(queue[0])
      else
        queue[0].children.each do |child|
          queue << child
        end
        queue.shift
      end
    end
  end

  def dfs_for(target_coords)
    stack = [@root]
    until stack.empty?
      current = stack.pop
      if current.x == target_coords[0] && current.y == target_coords[1]
        return list_moves(current)
      else
        current.children.each do |child|
          stack << child
        end
      end
    end
  end

  def list_moves(move)
    moves = []
    until move.parent.nil?
      moves << move
      move = move.parent
    end
    moves
  end

  def print_moves(moves)
    puts "# #{moves.length} Moves:"
    print "Moves: [#{@root.x}, #{@root.y}]"
    until moves.empty? do
      current = moves.pop
      print "\n   --> [#{current.x}, #{current.y}]"
    end
    puts
  end

  def benchmark
    t = Time.new
    yield
    puts "# It took #{Time.new - t} seconds."
  end

end

search = KnightSearcher.new(MoveTree.new([0, 0], 5))
search.benchmark do
  search.print_moves(search.bfs_for([1, 3]))
end
search.benchmark do
  search.print_moves(search.dfs_for([1, 3]))
end