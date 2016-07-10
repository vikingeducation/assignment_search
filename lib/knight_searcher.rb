=begin
  Part II: Breadth-First Search

  Now it's time to search through our tree. We'll start by testing out BFS.

  1. Create a KnightSearcher class (DONE)

  2. whose initialize method takes a tree input. (DONE)

  > searcher = KnightSearcher.new( knight_tree )

  3. Write the bfs_for method which takes a target_coords input and kicks off a breadth-first search of the nodes in the tree.

  # See the BFS lesson for implementation tips.

  4. Upon locating the target square, the method should output the sequence of moves used to get there as well as the final depth required.

  > searcher.bfs_for([1,3])
  => 2 Moves:
  => [3,3]
  => [2,5]
  => [1,3]
=end

require_relative 'move_tree'

class KnightSearcher

  def initialize(knight_tree)
    @knight_tree = knight_tree
  end

  def bfs_for(target_input)
    # kick off the BFS
    # We're talking a Queue
    target_x = target_input[0]
    target_y = target_input[1]
    queue = []
    queue << @knight_tree.root_node
    until queue.empty? || ( queue[0].x == target_x && queue[0].y == target_y )
      queue[0].children.each do |child|
        queue << child
      end
      queue.shift
    end
    output_results_for_bfs(queue)
  end

  def output_results_for_bfs(queue)
    if queue.empty?
      puts "Sequence does not exist in that tree, increase the depth and try again!"
    else
      moves = sequence_of_moves(queue[0])
      puts "#{queue[0].depth} Moves:"
      moves.each do |move|
        print move
        puts ""
      end
    end
  end

  def sequence_of_moves(final_move)
    moves_array = []
    moves_array.unshift([final_move.x, final_move.y])
    current_move = final_move
    until current_move.parent.nil?
      moves_array.unshift([current_move.parent.x, current_move.parent.y])
      current_move = current_move.parent
    end
    moves_array
  end

=begin
  Part III: Depth-First Search

  With BFS behind you, DFS shouldn't be much different.

  1. Add a dfs_for method to the KnightSearcher class which also takes target_coords. (DONE)

  2. This time it should kick off a depth-first search for the target coordinates. (DONE)

  See the DFS lesson for implementation tips.

  3. Do not use Recursion. (DONE)

  4. Start iteratively, and only then refactor it to a recursive one if you wanted to. (DONE)

  5. Upon locating the target square, the method should output the sequence of moves used to get there as well as the final depth required. (DONE)

  6. Test it out on different values and compare with BFS. Are they always equal? (DONE)

  # Note: your results may vary depending on your
  #       child selection mechanism
  KnightSearcher.new(MoveTree.new([0,0], 20)).dfs_for([1,2])
  1 Move:
  [0,0]
  [1,2]

  KnightSearcher.new(MoveTree.new([0,0], 20)).dfs_for([6,0])
  4 Moves:
  [0,0]
  [2,1]
  [4,0]
  [5,2]
  [6,0]
=end

  def dfs_for(target_input)
    target_x = target_input[0]
    target_y = target_input[1]
    stack = []
    stack << @knight_tree.root_node

    until stack.empty? || ( stack[-1].x == target_x && stack[-1].y == target_y )
      current_move = stack.pop
      current_move.children.each do |child|
        stack << child
      end
    end
    output_results_for_dfs(stack)
  end

  def output_results_for_dfs(stack)
    if stack.empty?
      puts "Sequence does not exist in that tree, increase the depth and try again!"
    else
      moves = sequence_of_moves(stack[-1])
      puts "#{stack[-1].depth} Moves:"
      moves.each do |move|
        print move
        puts ""
      end
    end
  end

end

searcher = KnightSearcher.new( MoveTree.new([0,0],7) )
searcher.dfs_for([3,4])

=begin
  Part IV: Benchmarking

  1. Create a simple benchmarking exercise which runs a series of similar searches using each method thousands of times. 

  2. Which is faster?
  Depends on the aim.

  3. What is the difference in the depth of solutions returned?
  # BFS returns smaller depths!

  time_before_bfs = Time.now
    1000.times { searcher.bfs_for([5,5]) }
  time_after_bfs = Time.now

  time_before_dfs = Time.now
    1000.times { searcher.dfs_for([5,5]) }
  time_after_dfs = Time.now

  puts "BFS: #{time_after_bfs - time_before_bfs}"
  puts "DFS: #{time_after_dfs - time_before_dfs}"
=end