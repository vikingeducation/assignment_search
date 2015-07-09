require './knight_searcher.rb'

tree = MoveTree.new([0,0],6)

search = KnightSearcher.new(tree)


t_start = Time.now

10000.times {search.dfs_for(5,5)}


t_end = Time.now


total = t_end - t_start

dfs_result = "Average time for DFS was #{total/10000} seconds and the total time was #{total}"


t_start = Time.now

10000.times {search.bfs_for(5,5)}


t_end = Time.now


total = t_end - t_start

puts dfs_result
puts "Average time for BFS was #{total/10000} seconds and the total time was #{total}"
