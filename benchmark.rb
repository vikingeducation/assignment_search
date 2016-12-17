require_relative 'knight_searcher.rb'


bfs_time = []
dfs_time = []


1000.times do 
  root_coordinates = [rand(7), rand(7)]
  b = MoveTree.new([rand(7), rand(7)], rand(5))
  a = KnightSearcher.new(b)
  target_coordinates = [rand(7), rand(7)]

  bfs_start = Time.now
  a.bfs_for(target_coordinates)
  bfs_end = Time.now
  bfs_time << bfs_end - bfs_start

  dfs_start = Time.now
  a.dfs_for(target_coordinates)
  dfs_end = Time.now
  dfs_time << dfs_end - dfs_start
end



bfs_time.inject(:+)
dfs_time.inject(:+)


