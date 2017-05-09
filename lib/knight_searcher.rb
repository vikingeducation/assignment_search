require_relative '../lib/move_tree'

class KnightSearcher
  def initialize(move_tree)
    @moves = move_tree
    @starting_coords = [
      @moves.starting_move.x,
      @moves.starting_move.y
    ]
  end

  def bfs_for(target_coordinates)
    moves_queue = [@moves.starting_move]

    while move = moves_queue.shift
      break if [move.x, move.y] == target_coordinates
      move.children.each { |c| moves_queue << c } if move.children
    end

    results(move)
  end

  def dfs_for(target_coordinates)
    moves_stack = [@moves.starting_move]

    while move = moves_stack.pop
      break if [move.x, move.y] == target_coordinates
      move.children.each { |c| moves_stack << c } if move.children
    end

    results(move)
  end

  private

  def results(move)
    path = [[move.x, move.y]]
    while parent = move.parent
      path << [parent.x, parent.y]
      break if [parent.x, parent.y] == @starting_coordinates
      move = parent
    end

    results_message(path)
  end

  def results_message(moves_path)
    results = "#{moves_path.size - 1} Moves:\n"
    moves_path.reverse.each do |coords|
      results += "#{coords}\n"
    end

    results
  end
end
