# 1. Use the "each" method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.  

# first way of doing it
a = [1,2,3,4,5,6,7,8,9,10]
	a.each {|value| puts value}

# second way of doing it
a = [1,2,3,4,5,6,7,8,9,10].each do |value|
	puts value
end


# 2. Same as above, but only print out values greater than 5.  

# first way of doing it
a = [1,2,3,4,5,6,7,8,9,10]
	a.each {|value| puts value if value > 5}

# second way of doing it
a = [1,2,3,4,5,6,7,8,9,10].each do |value|
	if value > 5
		puts value
	end
end


# 3. Now, using the same array from #2, use the "select" method to extract all odd numbers into a new array.  

# first way of doing 
a = [1,2,3,4,5,6,7,8,9,10]
	odd = a.select{|a| (a % 2) != 0}
	puts odd

# 4. Append "11" to the end of the array. Prepend "0" to the beginning.  

# first way to do it
a = [1,2,3,4,5,6,7,8,9,10]
a << 11
a.unshift(0)
	puts a

# 5. Get rid of "11". And append a "3".  

fremove the 11 and replace with 3
a = [1,2,3,4,5,6,7,8,9,10,11]
a.pop
a << 3
	puts a

# 6. Get rid of duplicates without specifically removing any one value.   

# remove dups
a = [1,2,3,4,5,6,7,8,9,10,3]
	puts a.uniq


# 7. Create a Hash using both Ruby 1.8 and 1.9 syntax.  

# hash using Ruby 1.8 syntax:
location = {:city => "London", :county => "SE"}
	print location

# hash using Ruby 1.9 syntax:
location = {city: 'London', county: 'SE'}
	location[:city]


Suppose you have a h = {a:1, b:2, c:3, d:4}  
# 8. Get the value of key "b".  

# get teh value of b:
hash = {a:1, b:2, c:3, d:4}
	hash[:b]

# 9. Add to this hash the key:value pair {e:5}  

# add e:5 to the hash:
hash = {a:1, b:2, c:3, d:4}
	hash[:e] = 5

# 10. Remove all key:value pairs whose value is less than 3.5  

# remove all key:value pairs whose value is < 3.5
hash = {a:1, b:2, c:3, d:4}
hash.delete_if {|k,v| v <3.5}
	print hash

# 11. Can hash values be arrays? Can you have an array of hashes? (give examples)

=begin
Can hash values be arrays?:

Yes, they can. 
For example:

my_hash = {value1: 3, value2: 5, value3:[1,2,3], value4: 82}

Can you have an array of hashes?
Yes, you can!. For example:

my_array = [1,2,3, {}, {a: 2}, 8,9,10]

=end

=begin
12. Look at several Ruby/Rails online API course and review them:

I looked at:

http://ruby-doc.org/
This seemed very comprehensive although not sure about the diffrences 
between Core API and Standard Library API which is on the front page. STill, I'd use it to
look up how to use the APIs available for sure.

couldn't find railsapi as the video mentioned - shame , it looked good!

=end
