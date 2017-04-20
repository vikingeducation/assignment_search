# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Richard Bell

1) Stack
2) Queue
3) DFS
4) BFS
5) tree spreads from a root, graph may have interconnections and no clear root

Psuedocode

1)

Function DFS_search(node, search_value)
  if node.data == search_value return node
  for each child_node in this_node.children
    call DFS_search(child_node, search_value)
  return false

2)

Function BFS_search(node, search_value)
  add node to Queue
  while queue is not empty
    remove node from Queue
    if node_data == search_value return node
    for each node in this node.children
      add child_node to queue
  return false

3)

Function Search_Graph_DFS(graph, search_value)
  grab first node and add to Stack
  while stack is not empty
    pull node from Stack
    mark it as checked
    check if data matches search value and return if it does
    get linked list for that node from array implementation
    iterate linked list adding each corresponding node to stack
  return not found

4)

Function Search_Graph_BFS(graph, search_value)
  add first node to queue
  while queue not empty
    pull node from queue
    mark it as checked
    check if data matches search value and return if it does
    get linked list for that node from array implementation
    iterate linked list adding each corresponding node to stack
  return not found


Knights Move Pseudocode

Node is a struct with x, y, depth, array of children

Class Tree

  NEW/initialize (starting coords, max depth)

    create node for tree root at starting coords

    function add child_nodes
      increment depth counter
      do +/- 1 and 2 to x
        do +/- 2 and 1 to y
          check if coords still on board, if so:
            create node and add to parent as child


    if depth counter == max depth then stop otherwise
      go through each child node and call function add child_nodes for it

Class Search

  New/initialize (tree)
    @tree = the input tree

  Function search for destination
    shove the first node onto the queue
    while the queue is not empty
      remove the node from the queue
      is it the target coords, if so return
      if not, iterate through each node in the children and add them to the queue
    return false meaning we didn't find the destination
