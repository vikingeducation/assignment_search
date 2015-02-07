require_relative 'knight_searcher'

corner_start = MoveTree.new [0,0],7
center_start = MoveTree.new [3,3],7

corner_searcher = KnightSearcher.new(corner_start)
center_searcher = KnightSearcher.new(center_start)

# BFS block
bfs_start = Time.now
bfs_depth = 0
bfs_depth += corner_searcher.dfs_for [0,7]
bfs_depth += corner_searcher.bfs_for [7,7]
bfs_depth += corner_searcher.bfs_for [7,0]
bfs_depth += corner_searcher.bfs_for [4,4]
bfs_depth += center_searcher.bfs_for [0,7]
bfs_depth += center_searcher.bfs_for [7,7]
bfs_depth += center_searcher.bfs_for [7,0]
bfs_depth += center_searcher.bfs_for [4,4]
bfs_time = Time.now - bfs_start

#DFS block
dfs_start = Time.now
dfs_depth = 0
dfs_depth += corner_searcher.dfs_for [0,7]
dfs_depth += corner_searcher.dfs_for [7,7]
dfs_depth += corner_searcher.dfs_for [7,0]
dfs_depth += corner_searcher.dfs_for [4,4]
dfs_depth += center_searcher.dfs_for [0,7]
dfs_depth += center_searcher.dfs_for [7,7]
dfs_depth += center_searcher.dfs_for [7,0]
dfs_depth += center_searcher.dfs_for [4,4]
dfs_time = Time.now - dfs_start

puts "Breadth-First search"
print "time: "
puts bfs_time
print "avg. depth: "
puts bfs_depth.to_f / 8
puts "Depth-First search"
print "time: "
puts dfs_time
print "avg. depth: "
puts dfs_depth.to_f / 8

# BENCHMARKING RESULTS

# Breadth-First search
# time: 3.585513
# avg. depth: 4.25

# Depth-First search
# time: 0.001577
# avg. depth: 6.5

# BFS produces more efficient paths, but DFS is much faster to run.