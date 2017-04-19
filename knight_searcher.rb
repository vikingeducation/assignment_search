require_relative 'move_tree'

class KnightSearcher

	def initialize(tree)
		@tree = tree

	end

	def bfs_for(target_coords)
		@x,@y = target_coords[0],target_coords[1]
		queue = []
		until queue.empty?
		@queue << @tree.root
		if @tree.root.x && @tree.root.y == @x && @y
			return true
		else
			queue.unshift
			queue << @tree.root.children
		end


	end


end