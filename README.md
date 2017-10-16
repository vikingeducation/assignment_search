#  Data Structures, searching algorithms & Knight in Chess movements

practice with representing data using Trees and Graphs.

* knight_tree.rb - 'MoveTree class (as in, "a tree of moves"). It should construct a tree of potential moves from a given position by using a series of Move objects. It should take two inputs -- a coordinate pair to represent the starting position and a maxDepth value which prevents the tree from continuing infinitely large.'
* knight_searcher.rb - Breadth-First Search - bfsFor method which takes a targetCoords input and kicks off a breadth-first search of the nodes in the tree - and Depth-First Search - which depth-first search for the target coordinates
* benchmark.rb - benchmark which runs a series of similar searches using each method thousands of times and compares them.

## Getting Started

If you want to quick run some the examples to see the code in action, run
```
$ ruby example.rb
```
from the project directory.

## Authors

* **Dariusz Biskupski** - *Initial work* - https://dariuszbiskupski.com


## Acknowledgments

It is part of the assignment created for [Viking Code School](https://www.vikingcodeschool.com/)



## Appendix - BFS and DFS Concepts

1. What data structure is used to implement DFS?
--stack - which stacks following nodes on the previous one so he can gets deeper in search for particular node

2. What data structure is typically used to implement BFS?
--queue - which holds the nodes in an order that allows to deal with one depth at a time and having its children saved for later

3. Which one can be done recursively? (the clue should be the data structure)
-- Depth First Search as it repetitively goes deeper and deeper until certain point is reached, when it folds back to a specific point (ie. were there are children on the node that haven't been penetrated yet - but then again can recursively go deeper). Also Recursion uses stack as data structure.

4. Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
--Definitely Breadth Search First - as command line can print one line a time which is adequate to one depth at a time

5. What is the difference between a tree and a graph?
--A tree has a hierarchical structure, we have a one clear source, a source has a number of children who cannot be parents of their parent; there are children who are not parents which is adequate to the end of particular branches/edges

Pseudocode the following processes with enough detail to be clear:

1. Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.
a. record the target child to be found
b. Loop starts
  ba. pick a child (of root or previous child) and check if it's the searched solution
    baa. if solution is found, exit the loop, return the solution
    bab. if no solution if found, add the node into the stack
    bac. if no solution is found and we reached the dead end unstack the parent and    examine if it has a child unexamined
      baca. if solution is found, break the loop and return the solution
      bacb. if no solution is found, repeat the process


2. Searching the same tree using BFS.
a. record the target child to be found
b. Loop starts
  ba. add the source/root node into the queue
  bb. dequeue the first node
  bc. Check if it matches criteria
    bca. if the source has a solution the search is ended, solution returned
    bcb. if the source doesn't hold the solution
      bcc. add its children to the back of the queue

3. Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
a. record the target child to be found
b. Loop starts on Adjecency List
  ba. pick a child (of root or previous child) and check if it's the searched solution
    baa. if solution is found, exit the loop, return the solution
    bab. if no solution if found, add the vertex into the stack, take its childred, repeat the process
    bac. if no solution is found and we reached the dead end unstack the parent and    examine if it has a child unexamined
      baca. if solution is found, break the loop and return the solution
      bacb. if no solution is found, repeat the process

4. Searching the same graph using BFS.
a. record the target vertex to be found
b. Loop starts on Adjecency List
  ba. add the source vertex - unvisited into the queue
  bb. dequeue the first vertex
  bb. check its neighbours
    bca. if the vertex wasn't visited we have a tree edge
      bcb. if the vertex has the solution, the search is ended, solution returned
      bcc. if the vertex doesn't have a solution, we add its neighbours to the back of the queue following its weight
    bcb. ignore the one we visited





Warmup 2: Knight's Travails Pseudocode


How will you represent a particular move? Will you repeat nodes? How will you display the final output after searching? How will you prevent your tree from continuing on infinitely?

*********Your mission here is to use your search skills to find the exact sequence of moves required to get from any given square to another square on the board.**********
```
--0-1-2-3-4-5-6-7
0|X|_|_|_|X|_|_|_|
1|_|_|F|_|_|_|_|_|
2|X|_|_|T|X|_|_|_|
3|_|X|_|X|_|_|_|_|
4|_|_|_|_|_|_|_|_|
5|_|_|_|_|_|_|_|_|
6|_|_|_|_|_|_|_|_|
7|_|_|_|_|_|_|_|_|
```
from x, y
from 2, 1
to   3, 2

### Pseudocode

Cheeseboard is 8x8

some_move = Move.new(:x, :y, :depth, :children, :parent)
our_move(:x, :y)


Create Board of Cheese
1. Crete a tree of all moves leading from the current position
a. Create Adjacent matrix of moves




2. Follow the Breadth First Search sequences
a. record the target child to be found
b. Loop starts
  Take the node
  ba. Check if the node coordinates are on the board
  bb. Check if the node was visited comparing coords with the one in adjecent matrix (x, y and nil or 1)
    bba. if it wasn't, mark the adjacent matrix i special coord nil into 1
      bbaa. add the root or node into the queue
    bbb. if it was, discard it and go to the next item in the queue
  bc. dequeue the first node
  bd. Check if it is the solution
    bda. if the vertex has a solution the search is ended
      bdaa. solution is returned in form of new linked_list with sequence of movements
              which goes from current child to the parent - loop
    bdb. if the vertex is not a solution
      bdba. add its children to the back of the queue and repeat the process


Constraints: within dimensions of the board ?
Constraints: was it visited?

The sequence of moves.. or a linked_list
[[[1,2],[3,4]],[[3,4],[8,9]]]


Print the best sequence of turns for the Kinght ie.
"The Kinght has to do following movements to reach its destination:
TURN 1 : from 1,2 to 3,4
TURN 2 : from 1,2 to 3,4
TURN 3 : from 1,2 to 3,4
TURN 4 : from 1,2 to 3,4
"
