# A program that calcuates when you were (or will turn) 1 Billion seconds old

puts 'Please enter your birth year: '
year = gets.chomp.to_i
puts 'Please enter your birth month:'
month = gets.chomp.to_i
puts 'What day were you born on? '
day = gets.chomp.to_i
puts 'What hour your were born? '
hour = gets.chomp.to_i
puts 'What minute were you born on? '
minute = gets.chomp.to_i

puts "You were 1 Billion seconds old on: "
print (Time.gm(year, month, day, hour, minute) + 10**9)
