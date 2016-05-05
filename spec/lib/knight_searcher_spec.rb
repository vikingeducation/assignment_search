require 'spec_helper'

describe KnightSearcher do
	let(:t){MoveTree.new([0, 0], 7)}
	let(:s){KnightSearcher.new(t)}
	let(:captor){StringIO.new}

	before do
		$stdout = captor
	end

	after do
		$stdout = STDOUT
	end

	describe '#initialize' do
		it 'accepts a MoveTree as input' do
			expect {s}.to_not raise_error
		end
	end

	describe '#tree' do
		it 'is an accessor' do
			expect do
				s.move_tree
				s.move_tree = t
			end.to_not raise_error
		end
	end

	describe '#bfs_for' do
		it 'accepts a coordinate pair as input' do
			expect do
				s.bfs_for(0, 0)
			end.to_not raise_error
		end

		it 'results in the number of moves being output' do
			expect do
				s.bfs_for(0, 0)
			end.to output(/^Moves: [\d]+/).to_stdout
		end

		it 'results in the path from start to finish being output' do
			expect do
				s.bfs_for(7, 7)
			end.to output(/[0, 0].*[7, 7]/).to_stdout
		end
	end

	describe '#dfs_for' do
		it 'accepts a coordinate pair as input' do
			expect do
				s.dfs_for(0, 0)
			end.to_not raise_error
		end

		it 'results in the number of moves being output' do
			expect do
				s.dfs_for(0, 0)
			end.to output(/^Moves: [\d]+/).to_stdout
		end

		it 'results in the path from start to finish being output' do
			expect do
				s.dfs_for(7, 7)
			end.to output(/[0, 0].*[7, 7]/).to_stdout
		end
	end
end

