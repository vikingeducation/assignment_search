require_relative 'knight2'

class KnightSearcher
  require 'pry'

  def initialize(tree)
    @t = tree
  end

  def bfs_for(target_coords)
    @x = target_coords[0]
    @y = target_coords[1]
    moves = []
    queue = [@t.root]
    until queue[0].x == @x && queue[0].y == @y
      queue[0].children.each do |child|
        queue.push(child)
      end
      moves << [queue[0].x, queue[0].y]
      queue.shift
    end
    moves << [queue[0].x, queue[0].y]
    print_results(moves)
    puts "Depth of result: #{queue[0].depth}"
  end


  def dfs_for(target_coords)
    @x = target_coords[0]
    @y = target_coords[1]
    moves = []
    stack = [@t.root]
    # binding.pry
    until (stack.last.x == @x && stack.last.y == @y)
      moves << [stack.last.x, stack.last.y]
      if stack.last.children.size > 0
        stack.last.children.each do |child|
          stack.push(child)
        end
      end
      stack.pop
      if stack.empty? 
        return "Result not found"
      else
        until moves.include?([stack.last.x, stack.last.y]) == false 
          stack.pop
        end
      end
    end
    moves << [stack.last.x, stack.last.y]
    print_results(moves)
    puts "Depth of result: #{stack.last.depth}"
    
  end

  def print_results(moves)
    puts "#{moves.size} moves:"
    moves.each do |move|
      print "#{move}\n"
    end
    puts
  end


end

t = MoveTree.new([3, 3], 6)
k = KnightSearcher.new(t)
k.dfs_for([1,6])
puts
k.bfs_for([1,6])