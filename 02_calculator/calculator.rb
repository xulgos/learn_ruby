def add x, y
  x + y
end

def subtract x, y
  x - y
end

def sum enum
  result = 0
  enum.each { |n| result += n }
  result
end

def multiply *args
  result = args.empty? ? 0 : args.pop
  args.each { |n| result *= n }
  result
end

def power x, y
  x ** y
end

def factorial n
  result = n
  (n-1).times { |curr| result *= (curr+1) }
  result
end
