require "knight"
require "knight_searcher"

describe KnightSearcher do
  let(:tree){ MoveTree.new([0, 0], 1) }
  let(:searcher){ KnightSearcher.new(tree) }

  describe "#initialize" do
    it "takes a tree as input" do
      ks = KnightSearcher.new(tree)
      expect(ks.is_a? KnightSearcher).to be(true)
    end
  end

  describe "#bfs_for" do
    it "takes a target_coords and returns the sequence of moves
    to get there" do
      result = searcher.bfs_for([2, 1])
      expect(result).to eq({moves: 1, path: [[0, 0]]})
    end

    it "returns `nil` if nothing is found" do
      expect(searcher.bfs_for([3, 3])).to be(nil)
    end
  end

  describe "#dfs_for" do
    it "takes a target_coords and returns the sequence of moves
    to get there" do
      result = searcher.dfs_for([2, 1])
      expect(result).to eq({moves: 1, path: [[0, 0]]})
    end

    it "works with larger trees" do
      res = KnightSearcher.new(MoveTree.new([0,0], 20)).dfs_for([6,0])
      expect(res[:moves]).to eq(4)
    end
  end

end
