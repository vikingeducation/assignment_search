require 'colorize'

Move = Struct.new(:x, :y, :depth, :parent, :children)

class MoveTree

	attr_accessor :root

	def initialize(coords, max_depth)
		@max_depth = max_depth
		@root = Move.new(coords[0], coords[1], 0, nil, [])
	end

	def construct	
		traversal_q = []
		traversal_q << @root
		i = 0
		loop do
			cur_node = traversal_q.pop
			x = cur_node.x
			y = cur_node.y
			puts "Cur node is #{x} and #{y}"
			cur_node.children << Move.new(x - 2, y - 1, i + 1, cur_node, []) if lu_avail?(cur_node)
			cur_node.children << Move.new(x - 2, y + 1, i + 1, cur_node, []) if ru_avail?(cur_node)
			cur_node.children << Move.new(x - 1, y - 2, i + 1, cur_node, []) if ul_avail?(cur_node)
			cur_node.children << Move.new(x - 1, y + 2, i + 1, cur_node, []) if ur_avail?(cur_node)
			cur_node.children << Move.new(x + 1, y - 2, i + 1, cur_node, []) if dl_avail?(cur_node)
			cur_node.children << Move.new(x + 1, y + 2, i + 1, cur_node, []) if dr_avail?(cur_node)
			cur_node.children << Move.new(x + 2, y - 1, i + 1, cur_node, []) if ld_avail?(cur_node)
			cur_node.children << Move.new(x + 2, y + 1, i + 1, cur_node, []) if rd_avail?(cur_node)
			cur_node.children.each do |child|
				puts "Cur node has children"
				traversal_q << child
			end
			i += 1
			break if i == @max_depth || traversal_q.empty?
		end		
	end

	def print_all
		print_q = []
		print_q << @root
		while(!print_q.empty?)
			node = print_q.pop
			puts "A possible move to (#{node.x}, #{node.y})"
			node.children.each do |child|
				print_q << child
			end
		end
	end

	def lu_avail?(node) # l u u
		node.y > 0 && node.x > 1
	end

	def ru_avail?(node) # r u u
		node.y < 4 && node.x > 1
	end

	def ul_avail?(node) # u l l
		node.y > 0 && node.x > 1
	end

	def ur_avail?(node) # u r r
		node.y > 0 && node.x < 3
	end

	def dl_avail?(node) # d l l
		node.y < 4 && node.x > 1
	end

	def dr_avail?(node) # d r r
		node.y < 4 && node.x < 3
	end

	def ld_avail?(node) # l d d
		node.y < 3 && node.x > 0
	end

	def rd_avail?(node) # r d d
		node.y < 3 && node.x < 4
	end

end

move_tree = MoveTree.new([2,2], 2)
move_tree.construct
move_tree.print_all

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

