require 'knight_searcher'

describe KnightSearcher do

  describe "#initialize" do
    it "raises an error if argument is not given" do
      expect{KnightSearcher.new}.to raise_error
    end
  end

end