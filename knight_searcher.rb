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
    no_find = 0
    queue = [@t.root]
    until queue[0].x == @x && queue[0].y == @y
      queue[0].children.each do |child|
        queue.push(child)
      end
      moves << [queue[0].x, queue[0].y]
      queue.shift
      if queue.empty?
        no_find += 1
        return [moves.size, @t.max_depth, no_find]
      end
    end
    moves << [queue[0].x, queue[0].y]
    # print_results(moves, queue[0].depth)
    [moves.size, queue[0].depth, no_find]
  end


  def dfs_for(target_coords)
    @x = target_coords[0]
    @y = target_coords[1]
    moves = []
    stack = [@t.root]
    # binding.pry
    while stack.length > 0
      if stack.last.x == @x && stack.last.y == @y
        return [moves.size, stack.last.depth, 0]
      end
      moves << [stack.last.x, stack.last.y]
      if stack.last.children.size > 0
        stack.pop.children.each do |child|
          stack.push(child)
        end
      else
        stack.pop
      end
    end
    [moves.size, @t.max_depth, 1]
  end




# old and wrong DFS
  #   until (stack.last.x == @x && stack.last.y == @y)
  #     moves << [stack.last.x, stack.last.y]
  #     if stack.last.children.size > 0
  #       stack.last.children.each do |child|
  #         stack.push(child)
  #       end
  #     end
  #     stack.pop
  #     if stack.empty?
  #       no_find += 1 
  #       return [moves.size, @t.max_depth, no_find]
  #     else
  #       until moves.include?([stack.last.x, stack.last.y]) == false 
  #         stack.pop
  #         if stack.empty? 
  #           no_find += 1
  #           return [moves.size, @t.max_depth, no_find]
  #         end
  #       end
  #     end
  #   end
  #   moves << [stack.last.x, stack.last.y]
  #   # print_results(moves, stack.last.depth)
  #   [moves.size, stack.last.depth, no_find]
    
  # end

  def print_results(moves, depth)
    puts "#{moves.size} moves:"
    moves.each do |move|
      print "#{move}\n"
    end
    puts "Depth of result: #{depth}"
    puts
  end

  def bfs_benchmark
    results = []
    1000.times do
      results << bfs_for([rand(7), rand(7)])
    end
    total_moves = 0
    total_depth = 0
    no_finds = 0
    results.each do |search|
      total_moves += search[0]
      total_depth += search[1]
      no_finds += search[2]
    end
    puts "Average moves for BFS: #{total_moves/1000.00}"
    puts "Average depth for BFS: #{total_depth/1000.00}"
    puts "Number of searches returning no result: #{no_finds}"
  end

  def dfs_benchmark
    results = []
    1000.times do
      results << dfs_for([rand(7),rand(7)])
    end
    total_moves = 0
    total_depth = 0
    no_finds = 0
    results.each do |search|
      total_moves += search[0]
      total_depth += search[1]
      no_finds += search[2]
    end
    puts "Average moves for DFS: #{total_moves/1000.00}"
    puts "Average depth for DFS: #{total_depth/1000.00}"
    puts "Number of searches returning no result: #{no_finds}"
  end


end

t = MoveTree.new([4, 4], 4)
k = KnightSearcher.new(t)

puts k.dfs_benchmark
puts k.bfs_benchmark
