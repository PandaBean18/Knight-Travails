require_relative "PolyNodeTree.rb"
class KnightPathFinder
    attr_reader :root_node
    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyNodeTree.new(start_pos)
        @considered_positions = []
        build_move_tree
    end

    def self.valid_moves(pos)
        x = pos[0]
        y = pos[1]
        arr = [[x+1, y+2], [x+1, y-2], [x+2, y+1], [x+2, y-1], [x-1, y+2], [x-1, y-2], [x-2, y+1], [x-2, y-1]]
        moves = []
        i = 0
        while i < arr.length
            if arr[i].all? {|x| x >= 0 && x <= 7}
                moves << arr[i]
            end
            i += 1
        end 
        return moves
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        movable_positions = []
        possible_moves.each do |x|
            if !(@considered_positions.include?(x))
                @considered_positions << x
                movable_positions << x
            end
        end
        return movable_positions
    end
        
    def build_move_tree
        queue = [@root_node]
        while !queue.empty?
            children = new_move_positions(queue[0].value)
            children.each do |x|
                var = PolyNodeTree.new(x)
                queue[0].add_child(var)
                queue << var
            end
            queue.shift
        end 
    end

    def find_path(end_pos)
        target_node = @root_node.dfs(end_pos)
        trace_path_back(target_node)
    end

    def trace_path_back(node)
        path = [node.value]
        arr = [node]
        until arr[0].parent == nil
            path.unshift(arr[0].parent.value)
            arr.unshift(arr[0].parent)
        end
        p path
    end
end
	
