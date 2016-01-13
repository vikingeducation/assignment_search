# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Jeff and John

1. DFS data structure - A stack

2. BFS - Queue

3. DFS - both DFS and recursion are analagous to a Stack

4. BFS

5. A tree is a connected acyclic graph.  So you know that there are no circuits in a tree, and one particular node is designated as the head.



1. search tree of nodes w DFS.

get root node
iterate through child nodes
push child nodes onto stack
while stack !empty
    some_node = stack.pop
    get children of some_node
    push children onto stack.
    break if sol'n found

no sol'n

2. search tree w BFS

get root node
iterate through child nodes
enqueue child nodes onto queue
while queue !empty
    some_node = queue.dequeue
    get children of some_node
    enquque children onto stack.
    break if sol'n found

no sol'n

3. search graph of nodes w DFS.

repeat for each graph component
    pick arbitary or designated node as root
    iterate through nieghbor nodes
    push neighbor nodes onto stack
    while stack !empty
        some_node = stack.pop
        get neighbors of some_node
        push neighbors onto stack.
        break if sol'n found
no sol'n

2. search tree w BFS

repeat for each graph component
    pick arbitary or designated node as root
    iterate through nieghbor nodes
    push neighbor nodes onto queue
    while queue !empty
        some_node = queue.dequeue
        get neighbors of some_node
        enqueue neighbors onto queue.
        break if sol'n found
no sol'n

Knight's Travails
Pseudocode

both BFS and DFS 
label squares a1 thru h8 
create move struct w members - row, col, ancestors
need function to find all N moves away from given square

BFS
pick arbitrary initial square and add to stack
while stack !empty
    get neighbors (available moves) from known square
    check for square among ancestors
    create new move objects for each remaining move
        add new move objects to current move children
        populate depth
        assign current move as new move parent
    push move objects onto stack
    break if depth == 63
print save_move.ancestors

otherwise no sol'n

DFS
pick arbitrary initial square and add to queue
while queue !empty
    get neighbors (available moves) from known square
    check for square among ancestors
    create new move objects for each remaining move
        add new move objects to current move children
        populate depth
        assign current move as new move parent (straighten out ancestors correctly)
    push move objects onto stack
    break if depth == 63
print save_move.ancestors

otherwise no sol'n


begin @ f4
g6
h7
f8

Move@f8  ancestors = ["f4", "g6", "h7"]

def depth 
    ancestors.length
end























