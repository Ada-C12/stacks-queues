
require_relative './stack.rb'
require 'pry'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  
  stack = Stack.new
  index = 0
  sets = {
    ")" => "(",
    "}" => "{",
    "]" => "["
  }

  while index <= string.length - 1
    
    char = string[index]

    if sets.values.include?(char)
      stack.push(char)
    elsif sets.keys.include?(char)
      return false if stack.empty?
      last_in = stack.pop
      return false if last_in != sets[char]
    end
    index += 1

  end

  return stack.empty?

end






# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end