require 'bfs'

describe KnightSearcher do
  context '#initialize' do
    it 'take a tree as input' do
      tree = MoveTree.new([3, 3], 1)
      s = KnightSearcher.new(tree)
    end
  end

  context '#bfs_for' do
    it 'find the shortest way' do
      tree = MoveTree.new([3, 3], 5)
      s = KnightSearcher.new(tree)
      s.bfs_for([1, 2])
    end
  end
end
