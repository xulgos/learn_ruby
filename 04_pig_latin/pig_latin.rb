def translate sentence
  sentence.split(' ').map do |word|
    word =~ /(^[^aeiou]*u?)(.*)/
    "#{$2}#{$1}ay"
  end.join ' '
end
