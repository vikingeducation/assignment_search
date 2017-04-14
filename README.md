# assignment_search
Andrea A

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

# What data structure is used to implement DFS?
Stack

# What data structure is typically used to implement BFS?
Queue

# Which one can be done recursively? (the clue should be the data structure)
DFS is best designed to be done recursively


# Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
BFS prints all the nodes at each level before going to the next level



# What is the difference between a tree and a graph?
Trees have nodes an graphs have vertices.
There is no root node in a graph, so they are slightly less structured than trees.
A tree has a hierarchical structure but a graph doesn't.

### Pseudocode
** 1) Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS. **

```Store the node to be found
Initialize an empty stack

  starting at root, searching for x
   current_node = root
   loop - while stack is not empty
   Take the end of the stack - y
     if current_node.children is equal to x 
         return x  and break loop
         else current_node = current_node.children - push on to stack
     break the loop if current_node has no children
   end the loop
 ```

** 2) Searching the same tree using BFS. **

```Store the node to be found
Initialize an empty queue

  Put all nodes on the queue

 starting at root, searching for x
   current_node = root
   loop - while queue is not empty
    Take the top of the queue - y
   if current_node.children is equal to x 
         return x  and break loop
         else current_node = current_node.children - push on to queue
   ```


** 3. Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS. **

Searching the same tree using BFS.

Store the node to be found

 starting at root
   current_node = root and mark this as visited
    get the next node from the root and iterate through its nodes
      if the node hasn't been visited call the function again
      else go the the next level up
      break when there is no children


** 4. Searching the same graph using BFS. **

Store the node to be found

 starting at root
   current_node = root and mark this as visited
    put the root on the queue
    loop while the queue still elements
      take an item from the top of the queue
      check if the item is equal to the node to be found
      iterate through the dequeued node 
      if the node is not visited put it on the queue otherwise go to the next.
```
