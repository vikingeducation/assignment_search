def move_checker(number, coords1, coords2)
  case number
  when 1
    if on_board?(coords1 + 2) && on_board?(coords2 + 1)
      [(coords1 + 2), (coords2 + 1)]
    else 
      binding.pry
      return false
    end  
  when 2
    if on_board?(coords1 + 2) && on_board?(coords2 - 1)
      return [(coords1 + 2), (coords2 - 1)]
    else
      return false
    end 
  when 3
    if on_board?(coords1 - 2) && on_board?(coords2 + 1)
      return [(coords1 - 2), (coords2 + 1)]
    else
      return false
    end 
  when 4
    if on_board?(coords1 - 2) && on_board?(coords2 - 1)
      return [(coords1 - 2), (coords2 - 1)]
    else
      return false
    end 
  when 5
    if on_board?(coords1 + 1) && on_board?(coords2 + 2)
      return [(coords1 + 1), (coords2 + 2)]
    else
      return false
    end 
  when 6
    if on_board?(coords1 + 1) && on_board?(coords2 - 2)
      return [(coords1 + 1), (coords2 - 2)]
    else
      return false
    end 
  when 7
    if on_board?(coords1 - 1) && on_board?(coords2 + 2)
      return [(coords1 - 1), (coords2 + 2)]
    else 
      return false
    end 
  when 8
    if on_board?(coords1 - 1) && on_board?(coords2 - 2)
      return [(coords1 - 1), (coords2 - 2)]
    else
      return false
    end 
  end
end


def on_board?(num)
  if num < 9 && num >= 0
    true
  else
    false
  end
end