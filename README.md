# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

### Sean Luckett

## Warmup questions

1. What data structure is used to implement DFS? ***A stack***
2. What data structure is typically used to implement BFS? ***A FIFO queue***
3. Which one can be done recursively? ***DFS***
4. Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
***BFS***
5. What is the difference between a tree and a graph? ***Trees' data are more structured. Also, trees grow from the ground; Graphs are a mathematical concept.***

## Pseudo Code

***
1. Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.
***

```bash
Start with root node, putting it on the stack

while stack is not empty
    pop top node
    if node == target return it (done)
    else 
        find "best" child (let's say left for this)
        push all other children to stack first
        push best child to stack

return not found
```

***
2. Searching the same tree using BFS.
***

```bash
Start with root node, putting it in the queue

while queue is not empty
    pop first node
    if node == target return it (done)
    else push children to queue

return not found
```

***
3. Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
***

```bash
# using adj list (weighted) (implemented as array of linked lists)

Starting with first position in array with a linked list

Evaluate edge weights and push them to stack in descending order

While stack is not empty
    pop top node
    if visited, next
    if node == target, return it (or its edge weight)--done
    mark node as visited
    
    if list at node's location in array, get list
        Evaluate edge weights and push them to stack with in descending order

return not found
```

***
4. Searching the same graph using BFS.
***

```bash
# using adj list (weighted) (implemented as array of linked lists)
Starting with first position in array with a linked list

With each node in the list, push node to queue

While queue is not empty
    pop first node
    if visited, next
    if node == target, return it (done)
    mark node as visited
    
    if list at node's location in array, get list
        push nodes to queue

return not found
```

***
Knight's Travails pseudocode
***
```bash
# Using tree whose root node is starting position

Search tree from root node to solution if exists (BFS and DFS)
Each node checked gets a visited count
To prevent infinite search use combo of:
    queue/stack emptiness
    visited count not to exceed some number (probably 1 or 2)
if not in visited collection, put it in
return move collection or none if tree depth isn't sufficient
```