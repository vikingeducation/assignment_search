require 'dfs'

describe KnightSearcher do
  context '#initialize' do
    it 'take a tree as input' do
      tree = MoveTree.new([3, 3], 1)
      s = KnightSearcher.new(tree)
    end
  end

  context '#dfs_for' do
    it 'find the shortest way' do
      tree = MoveTree.new([3, 3], 5)
      s = KnightSearcher.new(tree)
      s.dfs_for([4, 5])
    end
  end
end
