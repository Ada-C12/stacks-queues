require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
    
    # define opening and closing elements
    openers = ["{", "[", "("]
    closers = ["}", "]", ")"]
    
    # initialize stack
    stack = Stack.new
    length = string.length
    stack_size = 0
    count = 0

    return true if string.empty?
    return false if length.odd?
 
    until count == length || stack_size > string.length/2
        char = string[count]
    # if the value is in openers, add to stack
        if openers.include?(char)
            stack.push(char)
            stack_size += 1
    # if the value is in closers, pop from stack
        else
            if closers.include?(char)
                stack.pop
                stack_size -= 1
        # if it's in neither, return false
            else
                return false
            end
        end
        count += 1
    end

    return stack.empty?
end
    # string.each_char do |char|
    #     if openers.include?(char) 
    #         stack.push(char)
    #     elsif closers.include?(char)
    #         stack.pop
        
    #     end
    # end
    


# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
