require_relative 'knight_searcher'

Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree
	attr_accessor :root, :max_depth, :total_nodes, :moves

	def initialize(coords, max_depth)
		@coords = coords
		@max_depth = max_depth
		@root = Move.new(@coords[0], @coords[1], 0, [], nil)
		@total_nodes = 0
		build_tree(@root)
	end

	def inspect
		puts "Your tree has #{@total_nodes} Move nodes and depth of #{@max_depth}"
	end

	def moves(x, y)
		@moves =[[x+1,y+2], 
						 [x+2,y+1],
						 [x+2,y-1],
						 [x+1,y-2],
						 [x-1,y-2],
						 [x-2,y-1],
						 [x-2,y+1], 
						 [x-1,y+2]]

		
	end

	def build_tree(head, depth=0)
		until depth < max_depth

			create_children(head, depth)
			
			head.children.each do |child|
				build_tree(child, depth+1)
			end
	end

	def create_children(current_node, depth)
		moves(current_node.x, current_node.y)
			@moves.each do |x,y|
				new_node = Move.new(x, y, depth+1, [], current_node)
				current_node.children << new_node
				@total_nodes +1

			end
			end
	end

		
	


end

tree = MoveTree.new([3,0], 1)
tree.inspect

