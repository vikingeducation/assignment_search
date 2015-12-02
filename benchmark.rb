require 'rainbow'
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
    loop do
      selection = get_selection

      case selection
      when 1
        puts "Processing tree vs graph... (takes a bit of time)"
        data_scenarios = get_data_scenarios
        data_type_results = run_data_type(data_scenarios)
        render_data_type_results(data_scenarios, data_type_results)
      when 2
        puts "Processing... (takes a bit of time)"
        search_scenarios = get_scenarios
        tree_results = run_knight_searcher(search_scenarios)
        graph_results = run_graph_searcher(search_scenarios)
        render_results(tree_results, graph_results)
      else
        break
      end
    end
  end

  private

  def get_selection
    puts "---------------------------------------"
    puts "  What would you like to do?"
    puts "   1 = Analyze tree vs graph creation"
    puts "   2 = Analyze tree vs graph search"
    puts "  Type anything else to quit."
    puts "---------------------------------------"
    print " > "
    gets.chomp.to_i
  end

  def run_data_type(scenarios)
    results = []

    scenarios.each do |scenario|
      5.times do
        start_time = Time.now
        result = MoveTree.new([0,0], scenario[0], scenario[1]).inspect(false)
        result[:scenario] = scenario
        result[:runtime] = Time.now - start_time
        result[:type] = 'tree'
        results << result

        start_time = Time.now
        result = EdgeList.new(scenario[1]).inspect
        result[:scenario] = scenario
        result[:runtime] = Time.now - start_time
        result[:type] = 'graph'
        results << result
      end
    end
    results
  end

  def get_data_scenarios
    # depth, board size
    [
      [3, 3],
      [3, 8],
      [8, 3],
      [8, 8]
    ]
  end

  def get_scenarios
    starts = []
    stops = []
    scenarios = []

    max = @board_size - 1
    (0..max).each do |r|
      (0..max).each do |c|
        starts << [r, c]
        stops << [r, c]
      end
    end

    stops.shuffle!
    starts.each_with_index do |coord, index|
      unless coord == stops[index]
        scenarios << [coord, stops[index]]
      end
    end
    scenarios
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
      result = KnightSearcher.new(tree).dfs_for(stop_coords, false)
      result[:runtime] = Time.now - start_time
      results << result
    end

    results
  end

  def run_graph_searcher(scenarios)
    results = []

    scenarios.each do |scenario|
      start_coords = scenario[0]
      stop_coords = scenario[1]
      e1 = EdgeList.new(@board_size)
      e2 = EdgeList.new(@board_size)

      # BFS
      start_time = Time.now
      result = GraphSearcher.new(e1, false).bfs_for(start_coords, stop_coords, false)
      result[:runtime] = Time.now - start_time
      results << result

      # DFS
      start_time = Time.now
      result = GraphSearcher.new(e2, false).dfs_for(start_coords, stop_coords, false)
      result[:runtime] = Time.now - start_time
      results << result
    end

    results
  end

  def render_results(tree_results, graph_results)
    puts Rainbow("Search stats using Tree data type\n(with max_depth of #{@max_depth})").green
    search_results_analyzer(tree_results)

    puts Rainbow("Search stats using Graph data type\n(note that max_depth is not implemented)").magenta
    search_results_analyzer(graph_results)
  end

  def search_results_analyzer(results)
    by_search = results.group_by{|r| r[:type]}
    by_search.each do |search_type, type_result|
      puts " #{search_type} averages:"
      sum_moves = 0
      sum_steps = 0
      sum_time = 0
      count = 0
      type_result.each do |result|
        sum_moves += result[:moves]
        sum_steps += result[:steps]
        sum_time += result[:runtime]
        count += 1
      end
      render_search_subset(sum_moves/count, sum_steps/count, (sum_time/count).round(5))
    end
  end

  def render_search_subset(avg_moves, avg_steps, avg_runtime)
    puts "   moves = #{avg_moves}"
    puts "   steps = #{avg_steps}"
    puts "   runtime = #{avg_runtime}"
  end

  def render_data_type_results(scenarios, results)
    by_scenario = results.group_by{|r| r[:scenario]}

    by_scenario.each do |scenario, s_results|
      puts Rainbow(" Max depth, Board size = #{scenario}").ljust(50).black.bg(:white)
      by_type = s_results.group_by{|r| r[:type]}
      by_type.each do |type, t_results|
        sum_nodes = 0
        sum_edges = 0
        sum_time = 0
        count = 0
        t_results.each do |r|
          sum_nodes += r[:nodes]
          sum_edges += r[:edges] unless r[:edges].nil?
          sum_time += r[:runtime]
          count += 1
        end
        render_data_subset(type, sum_nodes, sum_edges, sum_time, count)
      end
    end
  end

  def render_data_subset(type, sum_nodes, sum_edges, sum_time, count)
    string = "  #{type} averages:\n    nodes = #{sum_nodes/count},  edges = #{sum_edges/count}, runtime = #{(sum_time/count).round(5)}"
    if type == 'tree'
      puts Rainbow(string).green
    else
      puts Rainbow(string).magenta
    end
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

b = Benchmark.new
b.run
