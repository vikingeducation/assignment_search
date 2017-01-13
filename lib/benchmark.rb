require_relative 'knight_searcher'


knight_searcher_1 = KnightSearcher.new(MoveTree.new(3, 3, 2))

p knight_searcher_1.bfs_for([1, 7])
p knight_searcher_1.dfs_for([1, 7])

puts "------"

t0 = Time.now
knight_searcher_2 = KnightSearcher.new(MoveTree.new(3, 3, 5))
t1 = Time.now
puts "It took #{t1-t0} seconds to create the tree..."
puts knight_searcher_2.tree.inspect

puts "------"

all_coords = []
(0..7).each do |x|
  (0..7).each do |y|
    all_coords << [x, y]
  end
end

t0 = Time.now
all_coords.each do |coords|
  p knight_searcher_2.bfs_for(coords)
end
t1 = Time.now
puts "It took #{t1-t0} seconds to run a bfs search for each square of the 8x8 grid..."

puts "------"

t0 = Time.now
all_coords.each do |coords|
  r = knight_searcher_2.dfs_for(coords)
  p r[0]
end
t1 = Time.now
puts "It took #{t1-t0} seconds to run a dfs search for each square of the 8x8 grid..."
