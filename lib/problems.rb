require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  
  
  # paren pairs are at the same indexes
  open_parens = [ '(', '[', '{' ]
  close_parens = [')', ']', '}' ]
  
  # check if string length isn't even
  if string.length % 2 != 0
    return false
    # check if string is empty
  elsif string.length == 0
    return true
  else
    # check if string starts with a close paren or ends with an open paren (unbalanced)
    if (close_parens.include? string[0]) || (open_parens.include? string[-1])
      return false
    else
      stack = Stack.new
    end
  end  
  
  string.each_char do |x|
    if open_parens.include? x
      stack.push(x)
      # if x is a close paren, remove last open paren in stack and check to ensure it's a match for the close paren x.
    elsif close_parens.include? x
      last_in_stack = stack.pop()
      if last_in_stack != open_parens[close_parens.index(x)]
        return false
      end
    end
  end
  if stack.empty?
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
