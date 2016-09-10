require_relative 'linked_list'
require_relative 'edge_list'
require 'pry'

class AdjacencyList
  attr_reader :adjacency_list, :edge_list

  def initialize(edge_list)
    # TODO: unmake instance variables if not needed
    board_size = edge_list.board_size
    @edge_list = edge_list
    @adjacency_list = get_adjacency_list(edge_list, board_size)
  end

  def print_adj_list
    puts "Nodes    Edges"
    puts "-------- ------------------"
    @adjacency_list.each_with_index do |square_linked_list, index|
      square = @edge_list.squares[index]
      print "[#{square.x}, #{square.y}]-->".ljust(9)
      print_linked_list(square_linked_list)
      print "\n"
    end
  end

  private

  def print_linked_list(list)
    return if list.nil?

    edge_array = []
    current_node = list.head.next

    loop do
      break if current_node.nil?
      square = @edge_list.squares[current_node.square]
      edge_array << "[#{square.x}, #{square.y}]"
      current_node = current_node.next
    end
    print edge_array.join(', ')
  end

  def get_adjacency_list(edge_list, board_size)
    alist = Array.new(board_size ^ 2)

    edge_list.edge_list.each do |edge|
      current_node = edge[0].id
      next_node = edge[1].id

      if alist[current_node].nil?
        linked_list = LinkedList.new
        linked_list.add_node_to_end(current_node)
        alist[current_node] = linked_list
      end

      alist[current_node].add_node_to_end(next_node)
    end

    alist
  end
end

# e = EdgeList.new(5)
# puts "#{e.squares.size} nodes and #{e.edge_list.size} edges"
# a = AdjacencyList.new(e)
# # puts "#{a.adjacency_list}"
# a.print_adj_list

