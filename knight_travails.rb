# Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

# a method that that takes a node 
# node has array
# itererate through the array
# at Node[0] check if answer
# if not answer
# call recursivly the method again on current node
# if Node[0] is nil
#   check if previous has child more than one child 
#   recursivly call method on next node else continue up




# Searching the same tree using BFS.

  find root node add to queue
  start pulling from queue
    loop pull node off queue and return if it matches
         add current nodes children to queue
        end loop
        return no find






# Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

Adjacency list

add all items from array to stack
start pulling from stack
until match or child is nil
  compare current node with search term
  if match return true and break
  if no_match change current to child node 
end
 return false
end
    


# Searching the same graph using BFS.

add all items from array to queue
loop do 
pull from queue and set current node
  add  current node's child to queue if child
  return true if match 
  end
return false



