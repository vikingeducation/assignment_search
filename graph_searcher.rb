require_relative 'adjacency_list'

class GraphSearcher

  def initialize(adjacency_list)
    @adjacency_list = adjacency_list
    @edge_list = adjacency_list.edge_list
  end

  # Breadth-First tree search
  def bfs_for(start_coords, end_coords)
    start_node = @edge_list.find_square(start_coords)
    start_node.distance = 0

    # end_square = @edge_list.find_square(end_coords)

    queue = [start_node]
    count = 0

    loop do
      current_node = queue[0]
      count += 1
      # binding.pry
      if [current_node.x, current_node.y] == end_coords
        output_results(queue[0], count)
        break
      else
        edges = @edge_list.edge_list.select{|pair| pair[0] == current_node}
        edges.each do |edge|
          neighbor = edge[1]
          next unless neighbor.distance.nil?

          neighbor.distance = current_node.distance += 1
          neighbor.predecessor = current_node
          queue << neighbor
        end
        queue.delete_at(0)
      end

      # Check if no nodes left
      if queue.empty?
        puts "Reached end of queue with no matches"
        break
      end
    end
  end

  private

  def output_results(end_node, count)
    moves = [end_node]

    loop do
      current_node = moves[0]
      # binding.pry
      if current_node.predecessor.nil?
        break
      else
        moves.unshift(current_node.predecessor)
      end
    end

    puts "Success in #{moves.size - 1} moves and #{count} steps:"
    moves.each{ |move| puts "[#{move.x}, #{move.y}]"}
  end
end

e = EdgeList.new(8)
puts "#{e.squares.size} nodes and #{e.edge_list.size} edges"
a = AdjacencyList.new(e)
# puts "#{a.adjacency_list}"
# a.print_adj_list

# GraphSearcher.new(a).bfs_for([2,2], [7,4])
# Max depth of 10 gives 22B nodes with board size of 8.

# GraphSearcher.new(a).bfs_for([0, 0], [1,2])
# GraphSearcher.new(a).dfs_for([1,2])
GraphSearcher.new(a).bfs_for([0, 0],[6,0])
# GraphSearcher.new(a).dfs_for([6,0])