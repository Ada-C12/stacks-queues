require_relative './stack.rb'

# Time Complexity: O(n), had to read every char
# Space Complexity: O(n), may need inventory[] of size n, such as cases of "((((("
def balanced(string)
  # going from index 0, take inventory of each character until end of string is reached
  # with each char, evaluate the logic of their existence based on inventory taken so far
  # if char is a opener, add to inventory
  # if char is a closer, remove pairing opener from inventory (which needs to be at index -1), else return false
  return true if string == ''

  inventory = Stack.new()
  openers = ['{', '[', '(']
  closers = {'}' => '{', ']' => '[', ')' => '('}

  index = 0
  until index == string.length
    currChar = string[index]

    if openers.include? currChar
      inventory.push(currChar)

    elsif closers.keys.include? currChar
      return false if inventory.empty?
      if inventory.getLast() == closers[currChar]
        inventory.pop()
      else 
        return false
      end

    else  
      # Unexpected character in string, error!
      return false
    end

    index += 1
  end

  # at the end, everything should be matched and inventory shoudl be empty
  return inventory.empty?
end

# Time Complexity: ?
# Space Complexity: ?
# def evaluate_postfix(postfix_expression)
#   # ASSUMING that all operands are single digit integers 
#   stack = []

#   index = 0
#   until index == postfix_expression.length
#     currChar = postfix_expression[index]

#   end
# end
