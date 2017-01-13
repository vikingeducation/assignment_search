# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Anthony

## Warmup 1: BFS and DFS Concepts

**1) What data structure is used to implement DFS?**

Stack

**2) What data structure is typically used to implement BFS?**

Queue

**3) Which one can be done recursively? (the clue should be the data structure)**

DFS

**4) Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?**

BFS

**5) What is the difference between a tree and a graph?**

A graph is a collection of nodes with edges between some of them. Edges may be directed (one-way) or undirected (two -way). It can also consist of isolated subgraphs and can have cycles.

A tree is a special type of graph, consisting of a root node which has no parent and has 0 or more child nodes. Each child node has 0 or more child nodes and so on.

#### Pseudocoding search processes: 

**1) Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.**

```ruby
dfs(search_value)
  create a new stack
  push root_node into it
  while stack is not empty
    r = pop some node
    compare r to search_value
    if it matches, break loop to return node
    else push its children into the stack
```

**2) Searching the same tree using BFS.**

```ruby
bfs(search_value)
  create a new queue
  enqueue root_node
  while queue is not empty
    r = dequeue some node
    compare r to search value
    if it matches, break loop to return node
    else enqueue the children of r to the queue
```

**3) Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.**

```ruby
dfs(node)
  start at root 
  mark root as visited
  root.adjacent.each do |node|
    if node not visited, dfs(node)
```

**4) Searching the same graph using BFS.**

```ruby
bfs(node)
  start at root
  mark root as visited
  enqueue root
  while queue is not empty
    dequeue 
    check out dequeued node
    dequeued node.each do |node|
      if node not visited, enqueue it
```

## Warmup 2: Knight's Travails Pseudocode

If current position of knight is represented as (x, y) position, there are 8 possible moves (assuming move is in range of board):

(x+1, y+2)
(x+2, y+1)
(x+1, y-2)
(x+2, y-1)
(x-1, y+2)
(x-2, y+1)
(x-1, y-2)
(x-2, y-1)




