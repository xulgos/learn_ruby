def reverser
  yield.split(' ').map { |word| word.reverse }.join ' '
end

def adder number=1
  yield + number
end

def repeater loops=1
  loops.times { yield }
end
