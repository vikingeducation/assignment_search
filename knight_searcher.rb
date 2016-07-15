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
      if queue.empty?
        puts "Result not found"
        return
      end
    end
    moves << [queue[0].x, queue[0].y]
    print_results(moves, queue[0].depth)
    [moves, queue[0].depth]
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
        puts "Result not found"
        return
      else
        until moves.include?([stack.last.x, stack.last.y]) == false 
          stack.pop
          if stack.empty? 
            puts "Result not found"
            return
          end
        end
      end
    end
    moves << [stack.last.x, stack.last.y]
    print_results(moves, stack.last.depth)
    [moves, stack.last.depth]
    
  end

  def print_results(moves, depth)
    puts "#{moves.size} moves:"
    moves.each do |move|
      print "#{move}\n"
    end
    puts "Depth of result: #{depth}"
    puts
  end


end

t = MoveTree.new([2, 2], 5)
k = KnightSearcher.new(t)
k.dfs_for([1,6])
puts
k.bfs_for([1,6])