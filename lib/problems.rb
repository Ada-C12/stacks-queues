require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
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

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
