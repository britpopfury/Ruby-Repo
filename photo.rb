#!/bin/env ruby
# encoding: utf-8
require 'pry'
#  First we change idrecotry to where we want the pics to go
Dir.chdir '/Users/lorraine/Desktop/new_pics'
#  Now we find where all the source pictures currently reside
pic_names = Dir['/Users/lorraine/Desktop/Pics/**/*.jpg']

puts 'What would you like to call this batch?'
batch_name = gets.chomp
puts ""
print "Downloading #{pic_names.length} files:  " 

pic_number = 1
pic_names.each do |name|
	puts '.'
	#  This is our "progress bar".
	new_name = if pic_number < 10
		"#{batch_name}0#{pic_number}.jpg" 
	else
		"#{batch_name}#{pic_number}.jpg"
	end 

if File.exist?(new_name)
			puts "skipping duplicate file"
			next
	else
	File.rename name, new_name #  Finally, we increment the counter.
	pic_number = pic_number + 1 
	end
end

puts "" #  This is so we aren't on progress bar line. 
puts 'All Done!'