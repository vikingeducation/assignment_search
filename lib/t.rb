require './my_knight_search.rb'

first = Coord.new(3, 3)
last =  Coord.new(1, 3)
node = Node.new(first, nil, [])

ks = KnightSearcher.new
# puts "Node 3 3's children:"
# p ks.add_children(node).map { |n| [n.coord.x, n.coord.y] }


ks.find_best_path(first, last)
