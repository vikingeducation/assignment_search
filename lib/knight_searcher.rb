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
end

searcher = KnightSearcher.new( MoveTree.new([0,0],7) )
searcher.bfs_for([6,6])
