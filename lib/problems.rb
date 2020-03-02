require_relative './stack.rb'

# Time Complexity: O(n), had to read every char
# Space Complexity: O(n), may need inventory[] of size n, such as cases of "((((("
def balanced(string)
  # going from index 0, take inventory of each character until end of string is reached
  # with each char, evaluate the logic of their existence based on inventory taken so far
  # if char is a opener, add to inventory
  # if char is a closer, remove pairing opener from inventory (which needs to be at index -1), else return false
  return true if string == ''

  inventory = []
  openers = ['{', '[', '(']
  closers = {'}' => '{', ']' => '[', ')' => '('}

  index = 0
  until index == string.length
    currChar = string[index]

    if openers.include? currChar
      inventory << currChar

    elsif closers.keys.include? currChar
      if inventory[-1] == closers[currChar]
        inventory.pop()
      else 
        return false
      end

    else  
      # Unexpected characterin string, error!
      return false
    end
  end

  # at the end, everything should be matched and inventory shoudl be empty
  return inventory == []
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
