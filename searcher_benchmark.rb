require_relative './knight_searcher'

module KnightsTravails
  class SearcherBenchmark
    attr_reader :searcher

    def initialize(searcher)
      @searcher = searcher
    end

    def run_benchmark
    end
  end
end
