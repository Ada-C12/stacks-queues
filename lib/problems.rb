require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  return false if string.length % 2 != 0

  open_par = "([{"
  close_par = "}])"

  stack = Stack.new
  balanced = true

  string.each_char do |char|
    if open_par.include? char 
      stack.push(char)
    end

    if close_par.include? char
      last = stack.pop
      if char == ")" && last == "("
        balanced = true
      elsif char == "]" && last == "["
        balanced = true
      elsif char == "}" && last == "{"
        balanced = true
      else
        balanced = false
      end
    end
  end

  return balanced
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
