# Knight-Travails
returns an array of the shortest distance (array of positions) in which a knight can reach a given point from an initial position 

Basically finds shortest path a knight on a chess board would need to travel to get to a position.

The main file in pathfinder.rb, while initializing the class, it takes in an initial position as a parameter(position where the knight currently is). After initialzing the
class and storing it as a variable, call the #find_path(target_pos) function of the class. A two dimensional array will be returned of all the positions it will have to
traverse in order to reach to target_pos.

example :-
```rb
kpf = KnightPathFinder.new([0, 0])
kpf.find_path([7, 6])
kpf.find_path([6, 2])
```

note:
```
1. All positions are supposed to be array instances, like [0, 0], [3, 1] etc.
2. positions need to be in the inclusive range of 0-7 (chess grid is 8x8 and here the initial position starts with zero, like all arrays).
3. You will need to initialize the class inside the pathfinder.rb file (check example).
4. Run the file by changing the CWD to the folder that has these to files, then run in terminal 'ruby pathfinder.rb'.
5. It uses a poly node tree class that I wrote.
```
