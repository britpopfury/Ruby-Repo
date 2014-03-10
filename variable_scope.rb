# re-assign variable to something else
require 'pry'
lo = "Lo is a newbie programmer"
si = "Si is much more talented"
puts lo
1.times do 
	lo = "lo is actually seriously bad"
end
puts lo
puts si

# call a method that doesn't mutate the caller
print "Please enter your first name"
first = gets.chomp
puts first.capitalize #modified variable
puts first #origin left intact

# call a method that mutates the caller
print "Please enter your first name"
first = gets.chomp
puts first.capitalize! #modified variable
puts first #origin permanently changed

#create local variable and try to call it in the out scope
x = 9
3.times do |x|
	puts "this x is from inside this block: #{x}"
end
puts "this x was from outside the block: #{x}"
