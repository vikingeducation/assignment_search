require_relative 'chess_tree'

class KnightSearcher
  def initialize(tree)
    @tree = tree
  end


  def bfs_for(target)
    queue = []
    queue.push(@tree.root)
    until queue.empty?
      if queue[0].x == target[0] && queue[0].y == target[1]
        return list_moves(queue[0])
      else
        queue[0].children.each do |child|
          queue.push(child)
        end
        queue.shift
      end
    end
  end

  def dfs_for(target)
    stack = []
    stack.push(@tree.root)
    until stack.empty?
      current = stack.pop
      if current.x == target[0] && current.y == target[1]
        return list_moves(current)
      else
        current.children.each do |child|
          stack.push(child)
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
    puts "The knight took #{moves.length} moves."
    print "Moves: [#{@tree.root.x}, #{@tree.root.y}]"
    until moves.empty? do
      current = moves.pop
      print " -> [#{current.x}, #{current.y}]"
    end
    puts
  end

end

def benchmark
  t = Time.new
  yield
  puts "It took #{ Time.new - t} seconds."
end

c = ChessTree.new(8, 8, [0,0])
c.create_tree
searcher = KnightSearcher.new(c)
puts "Where to?"
target = gets.chomp.split(",").map(&:to_i)
benchmark do
  puts "Breadth:"
  searcher.print_moves(searcher.bfs_for(target))
end
puts
benchmark do
  puts "Depth:"
  searcher.print_moves(searcher.dfs_for(target))
end
puts
