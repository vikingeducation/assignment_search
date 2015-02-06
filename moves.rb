module Moves
  def moves
    [[-2,-1],[-2,1],[-1,-2],[-1,2],[1,-2],[1,2],[2,-1],[2,1]]
  end

  def on_the_board?(coordinates)
    coordinates.all? { |coord| (0..7).include? coord }
  end
end