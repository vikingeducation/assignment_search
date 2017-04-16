
# require_relative 'move_tree'
require_relative 'knight_searcher'

class BenchmarkTest

  attr_accessor :bfs_time, :dfs_time, :knight_searcher

  def initialize
     tree = MoveTree.new([1,2],1)
     @knight_searcher = KnightSearcher.new( tree )
     @bfs_time, @dfs_time = 0, 0
  end

  def bfs_measure(coords)
    start_time = Time.now
    10.times do
      @knight_searcher.bfs_for(coords)
    end
    @bfs_time = (Time.now - start_time) / 60
  end

  def dfs_measure(coords)
    start_time = Time.now
    10.times do
      @knight_searcher.dfs_for(coords)
    end
    @dfs_time  = (Time.now - start_time) / 60
  end

  def statistics
    puts "Breadth-first search vs Depth-first search"
    puts "The bfs searcher took #{@bfs_time} and the dfs searcher took #{@dfs_time}"
  end

end