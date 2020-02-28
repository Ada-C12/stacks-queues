require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  pairs = {"{" => "}", "[" => "]", "(" => ")"}
  stack = Stack.new
  string.each_char do |char|
    if pairs[char]
      stack.push(char)
    elsif stack.empty?
      return false
    else
      last = stack.pop
      return false if pairs[last] != char
    end
  end
  return stack.empty?
end

# Time Complexity: O(n)
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  regex = /\d/
  stack = Stack.new
  postfix_expression.each_char do |c|
    if c.match(regex)
      stack.push(c.to_i)
    elsif stack.empty?
      raise ArgumentError
    else
      num2 = stack.pop
      num1 = stack.pop
      new_num = num1.method(c).(num2)
      stack.push(new_num)
    end
  end
  return stack.pop
end
