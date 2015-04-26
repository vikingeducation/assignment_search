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

	# Depth First Search Method (Stack)
	def dfs_for(coords, current_node = @tree, stack = [], hit_squares = [])
		if is_current_square_match?(coords, current_node)
			match_found(coords, current_node)
		else
			hit_squares << get_coords_from_node(current_node)
			current_node.children.each {|child| stack.unshift(child) unless hit_squares.include?(get_coords_from_node(child))} if current_node.children
			next_node = stack.shift
			next_node.nil? ? not_found(coords) : dfs_for(coords, next_node, stack, hit_squares) 
		end
	end

	# Benchmarking Method
	def benchmark
		bfs_times, bfs_moves, dfs_times, dfs_moves = [], [], [], []
		run_benchmark(bfs_times, bfs_moves){|coords| bfs_for_benchmark(coords)}
		run_benchmark(dfs_times, dfs_moves){|coords| dfs_for_benchmark(coords)}
		all_stats, final_stats = [bfs_times, bfs_moves, dfs_times, dfs_moves], []
		all_stats.each {|stat_arr| final_stats << stat_arr.inject{|sum, el| sum + el}.to_f/stat_arr.length}
		
		puts "Breadth First Stats: Average time = #{final_stats[0]} ms & Average move count = #{final_stats[1]}"
		puts "Depth First Stats: Average time = #{final_stats[2]} ms & Average move count = #{final_stats[3]}"
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

	# BECHMARKING METHODS:
	# The below methods are being used for benchmarking purposes only.
	# They shouldn't be used anwyere aside from the :benchmark method itself.

	# Breadth First Search BENCHMARKING (Queue)
	def bfs_for_benchmark(coords, current_node = @tree, queue = [], hit_squares = [])
		if is_current_square_match?(coords, current_node)
			get_move_count(current_node)
		else
			hit_squares << get_coords_from_node(current_node)
			current_node.children.each {|child| queue.unshift(child) unless hit_squares.include?(get_coords_from_node(child))} if current_node.children
			next_node = queue.pop
			next_node.nil? ? false : bfs_for_benchmark(coords, next_node, queue, hit_squares) 
		end
	end

	# Depth First Search BENCHMARKING (Stack)
	def dfs_for_benchmark(coords, current_node = @tree, stack = [], hit_squares = [])
		if is_current_square_match?(coords, current_node)
			get_move_count(current_node)
		else
			hit_squares << get_coords_from_node(current_node)
			current_node.children.each {|child| stack.unshift(child) unless hit_squares.include?(get_coords_from_node(child))} if current_node.children
			next_node = stack.shift
			next_node.nil? ? false : dfs_for_benchmark(coords, next_node, stack, hit_squares) 
		end
	end

	# Match Found for BENCHMARKING
	def get_move_count(node)
		move_count = 0
		until node.parent.nil?
			move_count += 1
			node = node.parent
		end
		move_count
	end

	def run_benchmark(times, moves)
		sample_coords = [1,2,3,4,5]
		3000.times do
			test_coords = [sample_coords.sample, sample_coords.sample]
			start_time = Time.now
			move_count = yield(test_coords)
			end_time = Time.now
			times << (end_time - start_time) * 1000
			moves << move_count
		end
	end
end