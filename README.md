# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Created by Ser [Trevor Elwell](http://trevorelwell.me)

##Instructions: 
1) *Make a new MoveTree:* 
example = `a = Move.Tree.new([5,5],5)`
This will create a MoveTree starting at the center square
with a depth of 5.

2) *Make a new KnightSearcher:*
example = `s = KnightSearcher.new(a.head)`
Creates a new knight searcher and pass it the head from the 
MoveTree already created

3) *Search for a square:*
You can use the :bfs_for() or :dfs_for() methods
to search via breadth-first or depth-first traversals respectively.
`s.bfs_for([3,3])` or `s.dfs_for([3,3])`

4) *Look at the benchmarking function:*
You can see the different average times it takes to run 
breadth-first vs. depth first. Takes an iterations paramter.
example = `s.benchmark(5000)` will run bfs and dfs 5000 times and 
put the average time and average moves to the console.