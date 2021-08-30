class PolyNodeTree
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        
        @parent = nil
        
        @children = []
    end

    def parent=(node)
        if @parent == nil 
            @parent = node
        else
            @parent.children.delete(self)
            @parent = node
        end

        if node 
            if !(@parent.children.include?(self))
                node.children << self
            end
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end    

    def remove_child(child_node)
        if !(@children.include?(child_node))
            raise "The node is not a child."
        end
        child_node.parent = nil
    end

    def dfs(target_value)
        if @value == target_value
            return self
        elsif @children == []
            return nil
        end

        i = 0
        while i < @children.length
            search = @children[i].dfs(target_value)
            if search.class == PolyNodeTree
                return search
            end
            i += 1
        end
        return nil
    end

    def bfs(target_value)
        array = [self]
        while !(array.empty?)
            node = array.shift
            if node.value == target_value
                return node
            else
                array += node.children
            end
        end
        return nil
    end
        
end
