require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  paren_hash = { ")" => "(", "}" => "{", "]" => "[" }

  stack = Stack.new

  string.each_char do |char|
    if paren_hash[char]
      last = stack.pop
      if paren_hash[char] != last
        return false
      end
    else
      stack.push(char)
    end
  end

  return stack.empty?
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
