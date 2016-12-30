require_relative 'move_tree'

class KnightSearcher

	def initialize(knight_tree)
		@move_tree = knight_tree
	end

	def bfs_for(coords)
		x = coords[0]
		y = coords[1]
		steps = bfs_traverse(x,y)
	end

	def dfs_for(coords)
		x = coords[0]
		y = coords[1]
		steps = dfs_traverse(x,y)
	end

	def bfs_traverse(x, y)
		#puts "\n ******* Starting BFS Traverse For (#{x}, #{y}) *******"
		bfs_traverse_q = Queue.new
		bfs_traverse_q.enqueue(@move_tree.root)
		loop do
			node = bfs_traverse_q.dequeue
			if satisy?(node.x, node.y, x, y)
				return print_path(node)
			end
			node.children.each do |child|
				bfs_traverse_q.enqueue(child)
			end
			break if bfs_traverse_q.empty?
		end
	end

	def dfs_traverse(x, y)
		#puts "\n ******* Starting DFS Traverse For (#{x}, #{y}) *******"
		dfs_traverse_s = Stack.new
		dfs_traverse_s.push(@move_tree.root)
		loop do
			node = dfs_traverse_s.pop
			if satisy?(node.x, node.y, x, y)	
				return print_path(node)
			end
			node.children.each do |child|
				dfs_traverse_s.push(child)
			end
			break if dfs_traverse_s.empty?
		end
	end

	def print_path(node)
		print_q = []
		print_q << node
		until(node.parent.nil?)
			print_q << node.parent
			node = node.parent
		end
		i = 0
		loop do
			break if print_q.empty?
			node_to_print = print_q.pop
			#puts "#{i} : (#{node_to_print.x}, #{node_to_print.y})"
			i += 1
		end
		i
	end

	def satisy?(x,y,target_x, target_y)
		(x == target_x) && (y == target_y)
	end
end

move_tree = MoveTree.new([2,2], 3)
move_tree.construct
searcher = KnightSearcher.new(move_tree)
bfs_better = 0
dfs_better = 0
they_did_equal = 0
5.times do |x|
	5.times do |y|
		dfs_steps = searcher.dfs_for([x,y])
		bfs_steps = searcher.bfs_for([x,y])
		puts "(#{x}, #{y}) : BFS is #{bfs_steps} while DFS is #{dfs_steps}"
		if dfs_steps > bfs_steps
			puts "BFS performed better"
			bfs_better += 1
		elsif dfs_steps == bfs_steps
			puts "They performed equally"
			they_did_equal += 1
		else
			puts "DFS performed better"
			dfs_better += 1
		end
	end
end

puts "So in #{bfs_better} cases, BFS performed better and in #{dfs_better} cases, DFS performed better while in #{they_did_equal} cases they performed equally"