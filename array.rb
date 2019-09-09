# create
days_of_week = ["Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun"]

puts days_of_week

# methods
puts "array empty:"
puts days_of_week.empty?

puts "array size:"
puts days_of_week.size

puts "last element:"
puts days_of_week[-1]

puts "index of element"
puts days_of_week.index("Wed")

puts "subset:"
puts days_of_week[1, 3]
puts "\n"
puts days_of_week[1..3]
puts "\n"
puts days_of_week[1...3]
puts "\n"
puts days_of_week.slice(1..3)
puts "\n"
puts days_of_week[1..-1]

concat_array = [1, 2]
puts "concat1:"
puts [1, 2] + [3, 4]
puts "concat2:"
puts concat_array << 3

unit_array1 = [1, 2]
unit_array2 = [2, 3]
puts "union:"
puts unit_array1 | unit_array2
puts "intersection:"
puts unit_array1 & unit_array2
puts "difference"
puts unit_array1 - unit_array2

puts "push"
puts unit_array1.push 3
puts "pop"
puts unit_array1.pop

puts "modify:"
puts unit_array1
puts "---insert---"
puts unit_array1.insert(1, 3)
puts "---insert range---"
unit_array1[1..2] = 2, 3
puts unit_array1
puts "---del at index---"
:unit_array1.delete_at(0)
puts unit_array1
puts "---del element---"
unit_array1.delete(2)
puts unit_array1
puts "---sort---"
sort_array = [5, 4, 3, 2, 1]
puts sort_array
puts "---"
puts sort_array.sort
puts "---uniq---"
sort_array.sort!
puts sort_array
