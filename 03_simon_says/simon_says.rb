def echo anything
  anything
end

def shout anything
  anything.downcase.swapcase
end

def repeat anything, n=2
  n.times.map { anything }.join(' ')
end

def start_of_word anything, into
  anything[0...into]
end

def first_word sentence
  sentence.split(' ').first
end

def titleize anything
  anything.gsub(/^\S+|\S{5,}(?=\s)|\S+$/) { |match| match.capitalize }
end
