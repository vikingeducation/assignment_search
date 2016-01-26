require 'knight_searcher'

describe KnightSearcher do

  let(:ks_bot_left){KnightSearcher.new(MoveTree.new([0,0], 1))}

  describe "#initialize" do

    it "raises an error if argument is not given" do
      expect{KnightSearcher.new}.to raise_error
    end

  end

  describe "#bfs_for" do

    it "raises an error if argument is not given" do
      expect{ks_bot_left.bfs_for}.to raise_error
    end

    it "does not raise error if one argument is given" do
      expect{ks_bot_left.bfs_for([3,3])}.to_not raise_error
    end

  end

end