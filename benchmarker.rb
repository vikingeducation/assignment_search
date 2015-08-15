require_relative 'search.rb'
require_relative 'tree_builder.rb'

class BenchMarker

  def initialize(search_count = 20, tree_size = 9)
    move_tree = MoveTree.new([1,1], tree_size)
    @search = KnightSearcher.new(move_tree)
    @search_count = search_count
  end


  def make_random_coords
    coords = []

    @search_count.times do 
      coords << [rand(1..8), rand(1..8)]
    end

    coords
  end


  def run_time_trials(search_coords, search_type)
    results = {:nodes_searched => [], :depths => []}

    start_time = Time.now

    search_coords.each do |coords|
      result = @search.send search_type, coords
      results[:nodes_searched] << result[1]
      results[:depths] << result[0].depth
    end

    results[:time_in_ms] = ((Time.now - start_time) * 1000).round(3) 
    results[:average_nodes_searched] = results[:nodes_searched].reduce(:+) / @search_count
    results[:average_depth] = results[:depths].reduce(:+) / @search_count

    results
  end


  def render_stats
    search_coords = make_random_coords

    bfs_results = run_time_trials(search_coords, :bfs_for)
    dfs_results = run_time_trials(search_coords, :dfs_for)

    puts "BFS Stats"
    stats_printer(bfs_results)

    puts "DFS Stats"
    stats_printer(dfs_results)
  end


  def stats_printer(results)
    puts "Total Time for #{@search_count} random searches: #{results[:time_in_ms]} milliseconds"
    puts "Average number of nodes per search: #{results[:average_nodes_searched]}"
    puts "Highest number of nodes searched: #{results[:nodes_searched].max}"
    puts "Average depth of results: #{results[:average_depth]}"
    puts "Deepest result: #{results[:depths].max}"
    print "\n"
  end
  
  
end