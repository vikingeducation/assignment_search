
SquareGraph = Struct.new(:id, :x, :y, :distance, :predecessor)

class EdgeList
  attr_reader :board_size, :squares, :edge_list

  def initialize(board_size = 5)
    @board_size = board_size
    @squares = get_squares(board_size)
    @edge_list = get_edge_list(@squares)
  end

  def find_square(coords)
    @squares.find{|square| [square.x, square.y] == coords }
  end

  private

  def get_squares(board_size)
    nodes = []
    id = 0

    board_size.times do |x|
      board_size.times do |y|
        nodes << SquareGraph.new(id, x, y)
        id += 1
      end
    end
    nodes
  end

  def get_edge_list(squares)
    edges = []
    squares.each do |square|
      children = get_children(square)
      children.each do |child|
        edges << [square, find_square(child)]
      end
    end
    edges
  end

  def get_children(square)
    moves = [
      [square.x + 1, square.y + 2],
      [square.x + 1, square.y - 2],
      [square.x + 2, square.y + 1],
      [square.x + 2, square.y - 1],
      [square.x - 1, square.y + 2],
      [square.x - 1, square.y - 2],
      [square.x - 2, square.y + 1],
      [square.x - 2, square.y - 1],
    ]

    moves.select{ |move| on_board?(move) }
  end

  def on_board?(move)
    max_index = @board_size - 1
    (0..max_index).include?(move[0]) && (0..max_index).include?(move[1])
  end
end

# a = EdgeList.new(3)
# # a.print_adj_list
# puts "#{a.squares.size} nodes and #{a.edge_list.size} edges"
# puts "#{a.edge_list}"