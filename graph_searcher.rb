require_relative 'edge_list'

class GraphSearcher

  def initialize(edge_list)
    @edge_list = edge_list
    puts "#{@edge_list.squares.size} nodes and #{@edge_list.edge_list.size} edges"
  end

  # Breadth-First Search
  def bfs_for(start_coords, end_coords)
    # Put the root node in the queue
    start_node = @edge_list.find_square(start_coords)
    start_node.distance = 0
    queue = [start_node]
    count = 0

    loop do
      current_node = queue[0]
      count += 1

      # Check the first node in the queue. If it matches, return it.  If not, add its children to the queue.
      if [current_node.x, current_node.y] == end_coords
        output_results(queue[0], count, 'BFS')
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

  # Depth-First Search
  def dfs_for(start_coords, end_coords)
    # Put the root node on the stack.
    start_node = @edge_list.find_square(start_coords)
    start_node.distance = 0
    stack = [start_node]
    count = 0

    loop do
      current_node = stack.pop
      count += 1

      # Check the top node on the stack. If it matches, return it.  If not, put children on the stack.
      if [current_node.x, current_node.y] == end_coords
        output_results(current_node, count, 'DFS')
        break
      else
        edges = @edge_list.edge_list.select{|pair| pair[0] == current_node}
        edges.each do |edge|
          neighbor = edge[1]

          # Skip neighbor if it has been visited at a lower depth
          next unless neighbor.distance.nil? || neighbor.distance > current_node.distance

          neighbor.distance = current_node.distance + 1
          neighbor.predecessor = current_node
          stack << neighbor
        end
      end

      # Check if no nodes left
      if stack.empty?
        puts "Reached end of stack with no matches"
        break
      end
    end
  end

  private

  def output_results(end_node, count, type)
    moves = [end_node]

    loop do
      current_node = moves[0]
      if current_node.predecessor.nil?
        break
      else
        moves.unshift(current_node.predecessor)
      end
    end

    puts "#{type} success in #{moves.size - 1} moves and #{count} steps:"
    moves.each{ |move| puts "[#{move.x}, #{move.y}]"}
  end
end

# Uncomment these to see visual representation of an adjacency list for the Graph in the edge list
# a = AdjacencyList.new(EdgeList.new(8))
# a.print_adj_list

# TODO: Make it so the edge list can be cleared of depth and ancestors
GraphSearcher.new(EdgeList.new(8)).bfs_for([0,0], [1,2])
GraphSearcher.new(EdgeList.new(8)).bfs_for([0,0], [6,0])
GraphSearcher.new(EdgeList.new(8)).dfs_for([0,0], [1,2])
GraphSearcher.new(EdgeList.new(8)).dfs_for([0,0], [6,0])
