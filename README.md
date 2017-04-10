# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Worked on by [Roy Chen](https://github.com/roychen25)

### Warmup 1: BFS and DFS Concepts

#### What data structure is used to implement DFS?
A stack.

#### What data structure is typically used to implement BFS?
A queue.

#### Which one can be done recursively? (the clue should be the data structure)
DFS.

#### Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
BFS.

#### What is the difference between a tree and a graph?
A tree is a subset of a graph, with nodes that have direction (parent / child relationships), and no cycles.

A graph can consist of vertices (nodes) with either undirected/directed edges with an associated weight, and can have cycles.

#### Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.
1. Push the root node onto a stack.
2. Pop top node off the stack.
3. Check if the node's value is what we're searching for. If so, return the value.
4. If not, push the node's children onto the stack. Skip this step if the node has no children.
5. Repeat steps 2 to 4 until we find the value we're searching for.

#### Searching the same tree using BFS.
1. Enqueue the root node in a queue.
2. Dequeue the first node from the queue.
3. Check if the node's value if what we're searching for. If so, return the value.
4. If not, enqueue the node's children in the queue. Skip this step if the node has no children.
5. Repeat steps 2 to 4 until we find the value we're searching for.

#### Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
1. Choose the first vertex to start searching from, and push it onto a stack.
2. Pop the top vertex off the stack.
3. Check if this vertex's value is what we're searching for. If so, return the value.
4. If not, mark the vertex's distance from the starting vertex, to indicate that've already checked this vertex. If we shouldn't be modifying the vertex, we could do so using a hash.
5. Push all the vertex's connected vertices into the stack, by iterating through the corresponding bucket in the adjacency list. Skip this step if the vertex has no edges.
6. Repeat steps 2 to 5 until we find the value we're looking for, or until the stack is empty (indicating the value isn't present in the graph).

#### Searching the same graph using BFS.
1. Choose the first vertex to start searching from, and enqueue it into a queue.
2. Dequeue the first item from the queue.
3. Check if this vertex's value is what we're searching for. If so, return the value.
4. If not, mark the vertex's distance from the starting vertex, to indicate that've already checked this vertex. If we shouldn't be modifying the vertex, we could do so using a hash.
5. Enqueue all the vertex's connected vertices into the queue, by iterating through the corresponding bucket in the adjacency list. Skip this step if the vertex has no edges.
6. Repeat steps 2 to 5 until we find the value we're looking for, or until the queue is empty (indicating the value isn't present in the graph).


### Warmup 2: Knight's Travails Pseudocode

#### Notes
1. We will use a tree to represent the possible moves for a Knight from a particular starting square on the chessboard
2. The root node of each tree will be the starting square on the chessboard
3. Each move will be represented by a Move struct, consisting of the square's coordinates, its parent node, its child nodes (next possible moves), and its distance from the parent node
4. There can be duplicate Move structs in each tree, since it's possible that the Knight could loop back on itself while trying to get to the target square
5. We will use a maximum depth to determine when to stop looking for possible moves

#### Pseudocode
```
# creating the tree of possible moves

Get coordinates of the starting square on the chessboard, and maximum depth

Save maximum depth in a variable

Create Move struct
  Store coordinates of starting checksquare in this Move struct
  Set this Move struct as the root node of our tree (no parent nodes)
  Set the root node's children to nil

Initialize variable to store current depth
Set the current depth to 0

Initialize an empty array to act as a queue
Enqueue the root node into the queue

Until current depth is equal to maximum depth
  Until the queue is empty
    Dequeue the first node from the queue, set it as the current node
    Generate the list of valid moves from the current node's coordinates
    For each valid move
      Create a Move struct as a node to store its coordinates
      Set this node's parent node to the current node
      Store this node as one of the current node's children
      Add this node to our queue
    Increment the current depth

Return the tree

# searching for the list of moves to the target square

Get the coordinates of the target square
Perform either BFS or DFS on the tree
Output the sequence of moves used to get to the target square, and the final depth required
```
