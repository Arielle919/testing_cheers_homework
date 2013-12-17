# Build on the results of our in-class exploration to output, for example:
# Give me an... A
# Give me a... B
# Give me a... B
# Give me a... Y
# ABBY’s just GRAND!
# When given the input of “Abby”. Note: the “a” vs. “an”


puts "What's your name?"
name = gets.upcase.chomp
vowels = ['A','E','I','O','U']

name.each_char do |char|
  if vowels.include?(char)
    article = 'an'
    puts 'Give me ' + article +'.. '+char
  elsif char.nil?
    puts " "
  else
    article = 'a'
    puts 'Give me ' + article +'.. '+char
  end
end
puts name + "'s " + "just GRAND!"
