require_relative 'square.rb'

class MoveTree
	attr_accessor :start, :depth
	attr_reader :tree

	def initialize(start=nil, depth=nil)
		@start = start || [0, 0]
		@depth = depth || 3
		@board_size = 8
		build_tree
	end

	def start=(value)
		@start = value
		build_tree
	end

	def depth=(value)
		@depth = value
		build_tree
	end

	def inspect
		"<#MoveTree @num_nodes=#{@num_nodes}, @depth=#{@depth}>"
	end

	private
		def build_tree
			@num_nodes = 0
			x = @start[0]
			y = @start[1]
			@tree = create_node(x, y)
		end

		def create_node(x, y, depth=0, parent=nil)
			@num_nodes += 1
			node = Square.new(x, y, depth, [], parent)
			unless depth == @depth
				adjacent_moves(x, y) do |x, y|
					node.children << create_node(x, y, depth + 1, node)
				end
			end
			node
		end

		def adjacent_moves(x, y)
			[
				[x + 1, y + 2],
				[x + 1, y - 2],
				[x + 2, y + 1],
				[x + 2, y - 1],
				[x - 1, y + 2],
				[x - 1, y - 2],
				[x - 2, y + 1],
				[x - 2, y - 1]
			].each do |coordinates|
				x = coordinates[0]
				y = coordinates[1]
				yield(x, y) if in_bounds?(x, y)
			end
		end

		def in_bounds?(x, y)
			[
				x >= 0,
				x < @board_size,
				y >= 0,
				y < @board_size
			].all? {|i| i == true}
		end
end