require_relative './stack.rb'

# Time Complexity: O(n) - touches every element of the string once.
# Space Complexity: O(n) - in worst case, we add the same number of characters in the string to the stack.
def balanced(string)
  return true if string.empty?
  
  match = {
  "(" => ")",
  "{" => "}",
  "[" => "]"
}

s = Stack.new
index = 0

while index < string.length do 
  if string[index] == match[s.last]
    s.pop
    index += 1
  else
    s.push(string[index])
    index += 1
  end
end

return s.empty?
end

# Time Complexity: O(n)
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  operation = {
  "+" => true,
  "-" => true,
  "*" => true,
  "/" => true }
  
  s = Stack.new
  index = 0
  result = 0
  
  while index < postfix_expression.length do
    if operation[postfix_expression[index]]
      second = s.pop
      first = s.pop
      
      result = first.to_i.public_send(postfix_expression[index], second.to_i)
      s.push(result)
      index += 1
    else
      s.push(postfix_expression[index])
      index += 1
    end
  end
  
  return result
end
