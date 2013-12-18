puts "What's your name?"
name = gets.upcase.chomp
vowels = ['A','E','I','O','U']
letters = ['B','C','D','F','G','H','J','K','L','M','N','P','Q',
'R','S','T','V','W','X','Y','Z',"'"]
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
  elsif letters.include?(char) == false
    name = "No Name"
    puts "invalid"
  else
    article = 'a'
    puts 'Give me ' + article +'.. '+char
  end
end

puts name + "'s " + "just GRAND!"
