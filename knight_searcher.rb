class KnightSearcher
	def initialize(tree)
		@tree = tree
	end

	public 

	# Breadth First Search Method (Queue)
	def bfs_for(coords, current_node = @tree, queue = [], hit_squares = [])
		if is_current_square_match?(coords, current_node)
			match_found(coords, current_node)
		else
			hit_squares << get_coords_from_node(current_node)
			current_node.children.each {|child| queue.unshift(child) unless hit_squares.include?(get_coords_from_node(child))} if current_node.children
			next_node = queue.pop
			next_node.nil? ? not_found(coords) : bfs_for(coords, next_node, queue, hit_squares) 
		end
	end

	private

	def match_found(coords, node)
		move_count, move_chain = 0, []
		until node.parent.nil?
			move_chain << get_coords_from_node(node)
			move_count += 1
			node = node.parent
		end
		move_chain << get_coords_from_node(node)
		puts "It took #{move_count} moves to reach #{coords}"
		move_chain.reverse.each {|move| print "#{move}\n"}
	end

	def not_found(coords)
		puts "Sorry, the coords #{coords} were not found in this Move Tree."
	end

	def is_current_square_match?(coords, node)
		(node.x == coords[0] && node.y == coords[1]) ? true : false
	end

	# Helper method get_coords simply returns the coords
	# of a particular node in array format ([1,1])
	def get_coords_from_node(node)
		[node.x,node.y]
	end

end