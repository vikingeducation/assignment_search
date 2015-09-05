require 'spec_helper'

describe Square do
	let(:s){Square.new(0, 0, 1, [])}

	it 'has an x' do
		expect {s.x}.to_not raise_error
	end

	it 'has a y' do
		expect {s.y}.to_not raise_error
	end

	it 'has a depth' do
		expect {s.depth}.to_not raise_error
	end

	it 'has children' do
		expect {s.children}.to_not raise_error
	end
end