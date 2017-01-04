require_relative "knight_tree"
require_relative "knight_searcher"

class BenchmarkSearching

  def initialize()
    @root_series = roots_creator
    @target_series = target_creator
  end

  def breadth_vs_depth_search
    dfs = test_1000_searches_dfs
    bfs = test_1000_searches_bfs
    puts "The total time of depth searching is #{dfs} while breadth is #{bfs}"
  end

  private

  def roots_creator
    roots = []
    10.times {|combination_number| roots << [rand(8), rand(8)] }
    roots
  end

  def target_creator
    targets = []
    10.times {|combination_number| targets << [rand(8), rand(8)] }
    targets
  end

  def test_1000_searches_dfs
    total_time = 0
    time_start = Time.new
    @root_series.each do |comb|
      searcher = KnightSearcher.new( MoveTree.new([comb[0], comb[1]], 6) )
      @target_series.each do |targets|
        searcher.dfs_for([targets[0], targets[1]])
      end
    end
    total_time = Time.new - time_start
  end

  def test_1000_searches_bfs
    total_time = 0
    time_start = Time.new
    @root_series.each do |comb|
      searcher = KnightSearcher.new( MoveTree.new([comb[0], comb[1]], 6) )
      @target_series.each do |targets|
        searcher.bfs_for([targets[0], targets[1]])
      end
    end
    total_time = Time.new - time_start
  end

end

BenchmarkSearching.new.breadth_vs_depth_search