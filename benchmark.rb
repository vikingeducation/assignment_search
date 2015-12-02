require_relative 'graph_searcher'
require_relative 'knight_searcher'

class Benchmark

  def initialize(prompt = true)
    puts "Welcome to the Benchmarker App for the Knight's Travails!"

    if prompt
      puts "Let's get started by understanding what data you want to gather."
      @board_size = get_board_size
      @max_depth = get_max_depth
    else
      @board_size = 8
      @max_depth = 6
    end
  end

  def run
    data_scenarios = get_data_scenarios
    data_type_results = run_data_type(data_scenarios)

    search_scenarios = get_scenarios
    tree_results = run_knight_searcher(search_scenarios)
    graph_results = run_graph_searcher(search_scenarios)

    render_results(data_type_results, tree_results, graph_results)
  end

  private

  def run_data_type(scenarios)
    results = []

    scenarios.each do |scenario|
      start_time = Time.now
      result = MoveTree.new([0,0], scenario[0], scenario[1]).inspect(false)
      result[:runtime] = Time.now - start_time
      result[:type] = 'tree'
      results << result

      start_time = Time.now
      result = EdgeList.new(scenario[1]).inspect
      result[:runtime] = Time.now - start_time
      result[:type] = 'graph'
      results << result
    end
    results
  end

  def get_data_scenarios
    results = []
    (1..@max_depth).each do |depth|
      (3..@board_size).each do |size|
        results << [depth, size]
      end
    end
    results
  end

  def get_scenarios
    [
      [[0,0], [1,2]],
      [[0,0], [6,0]]
    ]
  end

  def run_knight_searcher(scenarios)
    results = []

    scenarios.each do |scenario|
      start_coords = scenario[0]
      stop_coords = scenario[1]
      tree = MoveTree.new(start_coords, @max_depth, @board_size)

      # Run BFS
      start_time = Time.now
      result = KnightSearcher.new(tree).bfs_for(stop_coords, false)
      result[:runtime] = Time.now - start_time
      results << result

      # Run DFS
      start_time = Time.now
      result = KnightSearcher.new(tree).bfs_for(stop_coords, false)
      result[:runtime] = Time.now - start_time
      results << result
    end

    results
  end

  def run_graph_searcher(scenarios)
    results = []


    results << GraphSearcher.new(EdgeList.new(@board_size), false).bfs_for([0,0], [1,2], false)
    results << GraphSearcher.new(EdgeList.new(@board_size), false).bfs_for([0,0], [6,0], false)
    results << GraphSearcher.new(EdgeList.new(@board_size), false).dfs_for([0,0], [1,2], false)
    results << GraphSearcher.new(EdgeList.new(@board_size), false).dfs_for([0,0], [6,0], false)
    # binding.pry
    results
  end

  def render_results(data_type_results, tree_results, graph_results)
    puts data_type_results
    puts tree_results
    puts graph_results
  end

  def get_board_size
    print " enter board size > "
    gets.chomp.to_i
  end

  def get_max_depth
    print " enter max moves (depth) > "
    gets.chomp.to_i
  end
end

b = Benchmark.new(false)
b.run
