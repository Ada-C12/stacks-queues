require_relative './stack.rb'

# Time Complexity: O(n) where n is the number of characters in the string
# Space Complexity: O(n) where n is the number of opening braces in the string
def balanced(string)
  stack = Stack.new
  pair_hash = {
    "}" => "{",
    "]" => "[",
    ")" => "("
  }
  
  string.each_char do |char|
    if pair_hash.values.include?(char)
      stack.push(char)
    else
      return false if stack.empty?
      removed = stack.pop
      return false if removed != pair_hash[char]
    end
  end
  
  return true if stack.empty?
  return false
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
