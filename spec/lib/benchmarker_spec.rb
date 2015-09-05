require 'spec_helper'

describe Benchmarker do
	let(:t){MoveTree.new}
	let(:s){KnightSearcher.new(t)}
	let(:b){Benchmarker.new(s)}

	before do
		allow(s).to receive(:puts)
	end

	describe '#initialize' do
		it 'accepts a KnightSearcher as input' do
			expect {b}.to_not raise_error
		end
	end

	describe '#run' do
		it 'accepts an integer as input' do
			expect {b.run(1)}.to_not raise_error
		end

		it 'returns a hash with keys :bfs and :dfs' do
			h = b.run(1)
			expect(h).to have_key(:bfs)
			expect(h).to have_key(:dfs)
		end
	end

	describe '#search' do
		it 'accepts an integer and symbol name of the search method as input' do
			expect do
				b.search(1, :bfs_for)
				b.search(1, :dfs_for)
			end.to_not raise_error
		end

		it 'returns a hash with keys :time and :moves' do
			h = b.search(1, :dfs_for)
			expect(h).to have_key(:time)
			expect(h).to have_key(:moves)
		end
	end

	context 'MoveTree is large' do
		before do
			t = MoveTree.new([0, 0], 7)
			s.tree = t
			b.searcher = s
		end

		describe '#analyze' do
			it 'returns a hash of analyzation data' do
				results = b.run(10)
				expect(b.analyze(results)).to be_kind_of(Hash)
			end
		end

		describe '#print' do
			it 'outputs the results of analyzing a search' do
				expect(b).to receive(:puts).at_least(1).times
				results = b.run(10)
				analysis = b.analyze(results)
				b.print(analysis)
			end
		end

		describe '#the_works' do
			before do
				allow(b).to receive(:run).and_return(b.run(1))
				allow(b).to receive(:analyze).and_return(b.analyze(b.run(1)))
				allow(b).to receive(:puts)
			end

			it 'calls #run' do
				expect(b).to receive(:run).with(1)
				b.the_works(1)
			end

			it 'calls #analyze' do
				expect(b).to receive(:analyze)
				b.the_works(1)
			end

			it 'calls #print' do
				expect(b).to receive(:print)
				b.the_works(1)
			end
		end
	end
end