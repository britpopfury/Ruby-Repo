=begin 
Create a method that takes an array as a parameter. Within that method, try calling methods 
that do not mutate the caller. How does that affect the array outside of the method? What 
about when you call a method that mutates the caller within the method?
=end

# not changing the outside scope
#using characters
def write_properly(names)
	names.map(&:upcase!)
end

outer_names = ["bob", "ruth", "fred", "joe"]
write_properly(outer_names)
puts outer_names


#using numbers
def some_method(obj)
	obj.uniq!
end

outer_obj = [1,2,2,2,3,4,5,5,6]
some_method(outer_obj)

puts outer_obj


# changing the outside scope
# using characters
def write_properly(names)
	names.map(&:upcase!)
end

outer_names = ["bob", "ruth", "fred", "joe"]
write_properly(outer_names)
puts outer_names


#using numbers
def some_method(obj)
	obj.uniq!
end

outer_obj = [1,2,2,2,3,4,5,5,6]
some_method(outer_obj)

puts outer_obj



