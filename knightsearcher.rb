require './movetree.rb'

class KnightSearcher
	def initialize(tree)
    @tree = tree
	end

	def bfs_for(target_coords)
    queue = []
    queue << @tree.start
    while move = queue.shift
      if [move.x, move.y] == target_coords
        return show_path(move)
      end
      move.children.each { |child| queue << child}
    end
    puts "Couldn't find it."
	end

	def dfs_for(target_coords)
    stack = []
    stack << @tree.start
    while move = stack.pop
      if [move.x, move.y] == target_coords
        return show_path(move)
      end
      move.children.each { |child| stack << child}
    end
    puts "Couldn't find it."
	end

  def show_path(move)
    puts "#{move.depth} Moves:"
    puts "[#{move.x},#{move.y}]"
    while move = move.parent
      puts "[#{move.x},#{move.y}]"
    end
  end

end

tree = MoveTree.new([3,3], 5)
tree.build_tree

searcher = KnightSearcher.new(tree)
searcher.bfs_for([0,7])
searcher.dfs_for([5,1])
# >> 3 Moves:
# >> [0,7]
# >> [2,6]
# >> [4,5]
# >> [3,3]
# >> 4 Moves:
# >> [5,1]
# >> [3,2]
# >> [1,3]
# >> [2,5]
# >> [3,3]
