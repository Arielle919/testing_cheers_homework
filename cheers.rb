puts "What's your name?"
name = gets.upcase.chomp
vowels = ['A','E','I','O','U']
spaces = ' '
hyphen = "'"

name.each_char do |char|
  if vowels.include?(char)
    article = 'an'
    puts 'Give me ' + article +'.. '+char
  elsif spaces.include?(char)
    puts ''
  elsif hyphen.include?(char)
    puts "____________'"
  else
    article = 'a'
    puts 'Give me ' + article +'.. '+char
  end
end

puts name + "'s " + "just GRAND!"
