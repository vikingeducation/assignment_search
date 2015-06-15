class KnightSearcher
	def initialize(tree)
		@tree = tree
	end

	public 

	# Breadth First Search Method (Queue)
	def bfs_for(coords, current_node = @tree, queue = [], hit_squares = [], benchmark = false)
		if is_current_square_match?(coords, current_node)
			match_found(coords, current_node, benchmark)
		else
			hit_squares << get_coords_from_node(current_node)
			current_node.children.each {|child| queue.unshift(child) unless hit_squares.include?(get_coords_from_node(child))} if current_node.children
			next_node = queue.pop
			next_node.nil? ? not_found(coords, benchmark) : bfs_for(coords, next_node, queue, hit_squares, benchmark) 
		end
	end

	# Depth First Search Method (Stack)
	def dfs_for(coords, current_node = @tree, stack = [], hit_squares = [], benchmark = false)
		if is_current_square_match?(coords, current_node)
			match_found(coords, current_node, benchmark)
		else
			hit_squares << get_coords_from_node(current_node)
			current_node.children.each {|child| stack.unshift(child) unless hit_squares.include?(get_coords_from_node(child))} if current_node.children
			next_node = stack.shift
			next_node.nil? ? not_found(coords, benchmark) : dfs_for(coords, next_node, stack, hit_squares, benchmark) 
		end
	end

	# Benchmarking Method
	def benchmark(iterations = 3000)
		bfs_times, bfs_moves, dfs_times, dfs_moves = [], [], [], []
		run_benchmark(bfs_times, bfs_moves, iterations){|coords| bfs_for(coords, @tree, [], [], true)}
		run_benchmark(dfs_times, dfs_moves, iterations){|coords| dfs_for(coords, @tree, [], [], true)}

		all_stats, final_stats = [bfs_times, bfs_moves, dfs_times, dfs_moves], []
		all_stats.each {|stat_arr| final_stats << stat_arr.inject{|sum, el| sum + el}.to_f/stat_arr.length}

		puts "Breadth First Stats: Average time = #{final_stats[0]} ms & Average move count = #{final_stats[1]}"
		puts "Depth First Stats: Average time = #{final_stats[2]} ms & Average move count = #{final_stats[3]}"
	end

	private

	def match_found(coords, node, benchmark)
		move_count, move_chain = 0, []
		until node.parent.nil?
			move_chain << get_coords_from_node(node)
			move_count += 1
			node = node.parent
		end
		if benchmark == true
			move_count
		else
			move_chain << get_coords_from_node(node)
			puts "It took #{move_count} moves to reach #{coords}"
			move_chain.reverse.each {|move| print "#{move}\n"}
		end
	end

	def not_found(coords, benchmark)
		puts "Sorry, the coords #{coords} were not found in this Move Tree." unless benchmark == true
	end

	def is_current_square_match?(coords, node)
		(node.x == coords[0] && node.y == coords[1]) ? true : false
	end

	# Helper method get_coords simply returns the coords
	# of a particular node in array format ([1,1])
	def get_coords_from_node(node)
		[node.x,node.y]
	end

	# Run Benchmark:
	# Defaults to 3000 times (from :benchmark, above) but can set manually.
	def run_benchmark(times, moves, iterations)
		sample_coords = (1..BOARD_SIZE).to_a
		iterations.times do
			test_coords = [sample_coords.sample, sample_coords.sample]
			start_time = Time.now
			move_count = yield(test_coords)
			end_time = Time.now
			times << (end_time - start_time) * 1000
			# QUESTION: When I made the sample coords 'smart' (by adding BOARD_SIZE)
			# above, I sometimes had a nil sneak its way into the dfs_moves array. This
			# didn't happen for the bfs_moves array. I thought this was strange. Any thoughts
			# on how a nil could wind up in this array? I added the 'unless' statement below to
			# accommodate for this potential error but it doesn't solve it. 
			moves << move_count unless move_count.nil? 
		end
	end
end