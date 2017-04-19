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

	def dfs_for(target_coords)
		stack = []
		@x = target_coords[0]
		@y = targer_coords[1]
		stack << @tree.root
		until stack.empty?
			current_node = stack.pop
			if current_node.x == @x && current_node.y == y
				return current_node
			end

	end


end