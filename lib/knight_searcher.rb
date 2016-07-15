class KnightSearcher
	attr_accessor :move_tree

	def initialize(tree=nil)
		@move_tree = tree
	end

	def bfs_for(x, y)
		queue = [@move_tree.tree]
		node, found = nil, false
		begin
			node = queue.pop
			break if (found = found?(x, y, node))
			node.children.each do |n|
				queue.unshift(n)
			end
		end until queue.empty?
		found ? output_moves(node) : not_found
	end

	def dfs_for(x, y)
		stack = [@move_tree.tree]
		node, found = nil, false
		begin
			node = stack.pop
			break if (found = found?(x, y, node))
			node.children.each do |n|
				stack.push(n)
			end
		end until stack.empty?
		found ? output_moves(node) : not_found
	end

	private
		def output_moves(node)
			puts "Moves: #{node.depth}"
			nodes = []
			while node
				x = node.x
				y = node.y
				nodes << "[#{x}, #{y}]"
				node = node.parent
			end
			puts nodes.reverse!.join("\n")
			nodes
		end

		def not_found
			puts "Not found"
		end

		def found?(x, y, node)
			x == node.x && y == node.y
		end
end

