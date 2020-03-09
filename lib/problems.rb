require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
def balanced(str)
  # two pointers 
  # first pointer keeps track of what you're looking at 
  # if { then } && vice versa
  # keep adding the second pointer value in the string to the stack UNTIL a match occurs
  # a MATCH is defined as a closing bracket/parens 

  i = 0
  j = i + 1 
  stack = Stack.new
  if j == str.length
    # base case
  end

  if !(balanced_helper(str[i], str[j]))
    # add to the stack 
    stack.push(str[j])
  else
    stack.pop
  end

end

def balanced_helper(first, second)
  if (first == "{" && second == "}") || (first == "[" && second == "]") || (first == "(" && second == ")")
    return true
  else
    return false 
  end
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
