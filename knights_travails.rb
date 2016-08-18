require_relative 'tree'
require_relative 'benchmark'

class KnightSearcher

  attr_accessor :tree, :current_node

  def initialize( tree, destination )

    @start = tree.root

    @current_node = @start

    @destination = destination

    @path = []

    @depth = @current_node.depth

    @time = nil

  end


  def dfs

    stack = []

    @current_node = @start

    until [ @current_node.x, @current_node.y ] == [ @destination[ 0 ], @destination[ 1 ] ]

      @current_node.children.each do | c |

        stack << c

      end

      @current_node = stack.pop

    end


    @path = path( @current_node )

    print_path

  end


  def bfs

    queue = []

    @current_node = @start

    until [ @current_node.x, @current_node.y ] == [ @destination[ 0 ], @destination[ 1 ] ]

      @current_node.children.each do | node |

        queue << node

      end

      @current_node = queue.shift

    end

    @path = path( @current_node )

    print_path



  end



  def start_timer

    @time = Benchmark.new

  end


  def end_timer

    puts @time.elapsed_time

  end



  def path( node )

    @path << node

    while node.depth != 0

      @path << node.parent
      node = node.parent

    end

    @path.reverse

  end


  def print_path

    puts "Reached target in #{ @current_node.depth } moves"

    @path.each do | move |

      puts "#{ move.x }, #{ move.y }"

    end

  end




  def dfs_benchmark

    start_timer

    1000.times do

      x, y = rand(7), rand(7)
      target = [ rand( 7 ), rand( 7 ) ]

      knight_dfs = KnightSearcher.new( Tree.new( [ x, y ], 5 ), target )

      knight_dfs.dfs

    end

    puts "FINAL TIME FOR DFS:"
    end_timer

  end



  def bfs_benchmark

    start_timer

    1000.times do

      x, y = rand(7), rand(7)
      target = [ rand( 7 ), rand( 7 ) ]

      knight_bfs = KnightSearcher.new( Tree.new( [ x, y ], 5 ), target )

      knight_bfs.bfs

    end

    puts "FINAL TIME FOR BFS:"
    end_timer

  end

end


#knight_dfs = KnightSearcher.new( Tree.new( [0,0], 5 ), [3,1] )
#knight_dfs.dfs_benchmark

#knight_dfs.dfs
#puts ""

#knight_bfs = KnightSearcher.new( Tree.new( [0,0], 5 ), [4,7] )
#knight_bfs.bfs_benchmark

#knight_bfs.bfs




