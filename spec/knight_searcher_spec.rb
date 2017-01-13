require 'knight_searcher'

describe KnightSearcher do
  let(:knight_searcher_1) { KnightSearcher.new(MoveTree.new(3, 3, 2)) }
  let(:knight_searcher_2) { KnightSearcher.new(MoveTree.new(0, 0, 3)) }
  let(:knight_searcher_3) { KnightSearcher.new(MoveTree.new(3, 3, 1)) }

  describe 'bfs_for' do
    it 'should return an array containing depth required as well as sequence of moves' do
      output_data_1 = knight_searcher_1.bfs_for([1, 7])
      expect(output_data_1).to eq([2, [3, 3], [2, 5], [1, 7]])
      output_data_2 = knight_searcher_2.bfs_for([4, 5])
      expect(output_data_2).to eq([3, [0, 0], [1, 2], [2, 4], [4, 5]])
    end

    it 'should return not found if target is not in tree' do
      expect(knight_searcher_1.bfs_for([0, 7])).to eq("[0, 7] not found!")
    end
  end

  describe 'dfs_for' do
    it 'should return an array containing depth required as well as sequence of moves' do
      expect(knight_searcher_3.dfs_for([5, 2])).to eq([5, [3, 3], [1, 2], [1, 4], [2, 1], [2, 5], [5, 2]])
      expect(knight_searcher_2.dfs_for([0, 2])).to eq([5, [0, 0], [2, 1], [0, 0], [2, 1], [1, 2], [0, 2]])
    end

    it 'should return not found if target is not in tree' do
      expect(knight_searcher_2.dfs_for([7, 7])).to eq("[7, 7] not found!")
    end
  end

end
