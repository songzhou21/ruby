array = ["a", "b", "c"]

puts "each:"
array.each do |item|
    puts item
end

puts "\n"
puts "each_with_index:"
array.each_with_index do |item, index|
    puts "#{item}: #{index}"
end

puts "\n"
puts "collect:"
dup_array = array.collect do |item|
    item + item
end

puts dup_array

puts "\n"
puts "zip:"
zip_1 = [1, 2, 3]
zip_2 = [2, 4, 6]

puts zip_1.zip(zip_2) #[[1,2],[2,4],[3,6]]

puts "\n"
puts "zip with block:"
zip_1.zip(zip_2) do |x, y|
    printf "[%s, %s]\n", x, y
end

puts "\n"
puts "grep:"
grep_a = ["foo", "bar", "baz"]
grep_a.grep(/^b/) do |x|
    puts x
end

puts "\n"
puts "select:"
select_a = [1,2,3,4]
select_ret = select_a.select do |x|
   x % 2 == 0 
end

puts select_ret

puts "\nreject:"
reject_ret = select_a.reject do |x|
    x % 2 == 0
end
puts reject_ret

puts "\ndetect"
detect_ret = select_a.detect do |x|
    x % 2 == 0
end
puts detect_ret

puts "\nall?, any?:"
bool_a = [true, true]
bool_b = [false, true]

puts bool_a.all?
puts bool_b.all?
puts bool_a.any?
puts bool_b.any?

puts select_a.any? do |x|
    x % 2 == 0
end

puts "\nsort"
sort_array = ["1", "11", "2", "6"]
sort_ret = sort_array.sort do |a, b|
    a.to_i <=> b.to_i
end

puts sort_ret

=begin
先一次性把全部的元素都处理好，然后用处理结果来排序常常会更快。Ruby 的 sort_by 方法就是用这种方式来排序的。
=end
puts "\nsort_by:"
sort_by_ret = sort_array.sort_by do |x|
    x.to_i
end

puts sort_by_ret