require_relative '../lib/knight_searcher'

RSpec.describe KnightSearcher do
  let(:move_tree) { MoveTree.new([0, 0], 2)}
  let(:kniggit) { KnightSearcher.new(move_tree) }

  describe '#bfs_for' do
    let(:target_square) { [3, 3] }

    it 'returns the depth of the final move and moves to get there' do
      expect(kniggit.bfs_for(target_square))
        .to eq "2 Moves:\n[0, 0]\n[1, 2]\n[3, 3]\n"
    end
  end

  describe '#dfs_for' do
    let(:target_square) { [3, 3] }

    it 'returns the depth of the final move and moves to get there' do
      expect(kniggit.dfs_for(target_square))
        .to eq "2 Moves:\n[0, 0]\n[2, 1]\n[3, 3]\n"
    end
  end
end