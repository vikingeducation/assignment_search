require "knight_searcher"


describe KnightSearcher do 

  let(:knight){ KnightSearcher.new([3, 3], 3) }
  
  describe "#initialize" do 
    it "sets an instance variable tree to an instance of MoveTree" do
      expect(knight.tree).to be_an_instance_of(MoveTree)  
    end
       
  end

  describe "#bfs" do 
    it "raises an argument error if target is not an array" do 
      expect{ knight.bfs(1) }.to raise_error(ArgumentError)
    end

    it "returns the square node if target is [1, 2]" do 
      expect(knight.bfs([1, 2]).x).to eq(1)
    end

    it "returns the square node if target is [3, 3]" do 
      expect(knight.bfs([3, 3]).x).to eq(3)
    end

    it "returns the square node if target is [1, 4]" do 
      expect(knight.bfs([1, 4]).x).to eq(1)
    end

    it "returns the square node if target is [0, 0]" do 
      expect(knight.bfs([0, 0]).x).to eq(0)
    end

    it "returns nil if target is [6, 7]" do 
      expect(knight.bfs([6, 8])).to be nil
    end

    it "returns the square node if target is [4, 1]" do 
      expect(knight.bfs([4, 1]).x).to eq(4)
    end  
  end

  describe "#dfs" do 
    it "raises an argument error if target is not an array" do 
      expect{ knight.dfs(1) }.to raise_error(ArgumentError)
    end

    it "returns the square node if target is [1, 2]" do 
      expect(knight.dfs([1, 2]).x).to eq(1)
    end

    it "returns the square node if target is [0, 0]" do 
      expect(knight.dfs([0, 0]).x).to eq(0)
    end

    it "returns the square node if target is [2, 1]" do 
      expect(knight.dfs([2, 1]).x).to eq(2)
    end
  end

  describe "#bfs_path" do 
    it "raises an argument error if target is not an array" do 
      expect{ knight.bfs_path(1) }.to raise_error(ArgumentError)
    end

    it "returns 1 if target is [1, 2]" do 
      expect(knight.bfs_path([1, 2])).to eq(1)
    end

    it "returns 3 if target is [3, 2]" do 
      expect(knight.bfs_path([3, 2])).to eq(3)
    end

    it "returns -1 if target is [6, 7]" do 
      expect(knight.bfs_path([6, 8])).to eq(-1)
    end
  end

  describe "#dfs_path" do 
    it "raises an argument error if target is not an array" do 
      expect{ knight.dfs_path(1) }.to raise_error(ArgumentError) 
    end

    it "returns 1 if target is [1, 2]" do 
      expect(knight.dfs_path([1, 2])).to eq(1)
    end

    it "returns 3 if target is [3, 2]" do 
      expect(knight.dfs_path([3, 2])).to eq(3)
    end
    
  end

end



