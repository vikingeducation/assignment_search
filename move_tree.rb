require 'colorize'
require_relative 'queue'
require_relative 'stack'

Move = Struct.new(:x, :y, :depth, :parent, :children)

class MoveTree

	attr_accessor :root

	def initialize(coords, max_depth)
		@max_depth = max_depth
		@root = Move.new(coords[0], coords[1], 0, nil, [])
	end

	def construct	
		traversal_q = Queue.new
		traversal_q.enqueue(@root)
		i = 0
		loop do
			cur_node = traversal_q.dequeue
			x = cur_node.x
			y = cur_node.y
			i = cur_node.depth
			cur_node.children << Move.new(x - 2, y - 1, i + 1, cur_node, []) if lu_avail?(cur_node)
			cur_node.children << Move.new(x - 2, y + 1, i + 1, cur_node, []) if ru_avail?(cur_node)
			cur_node.children << Move.new(x - 1, y - 2, i + 1, cur_node, []) if ul_avail?(cur_node)
			cur_node.children << Move.new(x - 1, y + 2, i + 1, cur_node, []) if ur_avail?(cur_node)
			cur_node.children << Move.new(x + 1, y - 2, i + 1, cur_node, []) if dl_avail?(cur_node)
			cur_node.children << Move.new(x + 1, y + 2, i + 1, cur_node, []) if dr_avail?(cur_node)
			cur_node.children << Move.new(x + 2, y - 1, i + 1, cur_node, []) if ld_avail?(cur_node)
			cur_node.children << Move.new(x + 2, y + 1, i + 1, cur_node, []) if rd_avail?(cur_node)
			cur_node.children.each do |child|
				traversal_q.enqueue(child)
			end
			break if i == (@max_depth+1) || traversal_q.empty?
		end		
	end

	def traverse_all_queue
		total_moves = 0
		print_q = Queue.new
		print_q.enqueue(@root)
		loop do
			node = print_q.dequeue
			total_moves += 1
			node.children.each do |child|
				print_q.enqueue(child)
			end
			break if print_q.empty?
		end
		total_moves
	end

	def inspect
		puts "Your tree has #{traverse_all_queue} Move nodes and a maximum depth of #{@max_depth}."
	end

	def lu_avail?(node) # l u u
		(node.y > 0 && node.x > 1)
	end

	def ru_avail?(node) # r u u
		(node.y < 4 && node.x > 1)
	end

	def ul_avail?(node) # u l l
		(node.y > 1 && node.x > 0)
	end

	def ur_avail?(node) # u r r
		(node.y < 3 && node.x > 0)
	end

	def dl_avail?(node) # d l l
		(node.y > 1 && node.x < 4)
	end

	def dr_avail?(node) # d r r
		(node.y < 3 && node.x < 4)
	end

	def ld_avail?(node) # l d d
		(node.y > 0 && node.x < 3)
	end

	def rd_avail?(node) # r d d
		(node.y < 4 && node.x < 3)
	end

end

#move_tree = MoveTree.new([2,2], 2)
#move_tree.construct
#move_tree.print_all
#move_tree.inspect

#    0 1 2 3 4
# 0 ⬛⬜⬛⬜⬛
# 1 ⬜⬛⬜⬛⬜
# 2 ⬛⬜⬛⬜⬛
# 3 ⬜⬛⬜⬛⬜
# 4 ⬛⬜⬛⬜⬛

# left up
# right up
# up left
# up right
# down left
# down right
# left down
# right down

