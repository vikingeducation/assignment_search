# assignment_search
Marco?  Polo!

By BranLiang

## What data structure is used to implement DFS?
Graph data structure/Tree
## What data structure is typically used to implement BFS?
Graph data structure/Tree, BFS works great for data sets with simple solutions and/or few members.
## Which one can be done recursively? (the clue should be the data structure)
DFS has recursive properties.
## Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
BFS
## What is the difference between a tree and a graph?
Graph is more complex with directions, weights and more. It does not have any set hierarchy or specific number/format to its relationship. It's much more free-form.


#Next, pseudocode the following processes with enough detail to be clear:
## Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.
START from the root node
CURRENT node is the root node
CURRENT node marked read
FOR all the children of the CURRENT node
IF the child is not read
  STORE its edge to the CURRENT node
  RECURESIVELY check the same for the child
  SET the child to be current
END THE LOOP

## Searching the same tree using BFS.
START from the root node
SET the path from its children to its parents
MARK all the children read
SET the first children to be the current
SET the current children path to the current node
MARK all the children read
LOOP until all the nodes read

## Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
Adjacency List

Start from the source node(beginning at the bucket)
Mark the source node read.
Record the first child path.
Mark the child read.
Set the first child to be the current node.
Look for the child node of the current node.
Set the fist child path to the current node.
Mark the child read.
Set the current node to be that new child.
Recursively Loop until all the node marked read.
Search the path according to the recorded path.

## Searching the same graph using BFS.
Adjacency List
Start from the source node(begining at the bucket)
Mark the source node read.
Record all the children path to the source_node.
Then set the first child to be the current child.
record all its children path to the current node.
mark the children read.
Then set the second child of the source to be the current node.
record all its children path to the current node.
Mark the children read.
Loop until all the nodes read.
Search the path according to the recorded path.

# Warm up 2

## How will you represent a particular move? Will you repeat nodes? How will you display the final output after searching? How will you prevent your tree from continuing on infinitely?
Each place on board is node. There is connection between two links when the knight can move between each other in one move. So all the place on board can be connected using that relationship. And since the knight can move to all the place on board without touching the same place. All the nodes represented here will also not be repeated. After searching, the path from one node to the other will be displayed. In order to prevent the tree from infinite loop. Already moved place will be marked read and can not touch again.

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)
