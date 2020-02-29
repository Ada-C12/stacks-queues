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

# Time Complexity: O(n) where n is the number of characters in the expression
# Space Complexity: O(n) where n is the number of operands stored at any given time (depends how many you chain together)
def evaluate_postfix(postfix_expression)
  stack = Stack.new
  operators = {
    "*" => :*,
    "/" =>  :/,
    "+" =>  :+,
    "-" => :-,
    "%" => :%,
  }
  
  postfix_expression.each_char do |char|
    if operators.keys.include?(char)
      raise ArgumentError.new("Error! You must have 2 numbers stored to perform an operation") if stack.empty?
      second_number = (stack.pop).to_i
      raise ArgumentError.new("Error! You must have 2 numbers stored to perform an operation") if stack.empty?
      first_number = (stack.pop).to_i
      result = first_number.send(operators[char], second_number)
      stack.push(result)
    else
      stack.push(char)
    end
  end
  
  return stack.pop
end
