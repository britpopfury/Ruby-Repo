# A program that calcuates how old you are
=begin
ask for year of birth
ask for month
ask for day
convert into time thingy
loop around while your birthday is less than this year's anniversay
=end

puts 'Please enter your birth year: '
year = gets.chomp.to_i
puts 'Please enter your birth month:'
month = gets.chomp.to_i
puts 'What day were you born on? '
day = gets.chomp.to_i

birth = Time.local(year, month, day)
time_now = Time.now

age = 1
while Time.local(year + age, month, day) <= time_now
	puts 'SPANK!'
	age = age + 1
	puts "all done!"
end