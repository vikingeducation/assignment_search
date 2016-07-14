#psuedocode knights
# start tree(root) at whatever position
# iterate through possible nexst moves and add those as children to root
# => move qualifies if position (x,y) + (+-2, +-1) or (+-1, +-2) > -1 && < 5
# =>  add next qualifying move to be child of that node if node hasn't been visitited
# =>  continue process until no more moves
# =>  if no moves available, go to starting position's next child node (DFS)
