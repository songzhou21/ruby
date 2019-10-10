H = {
	"a" => 100,
	"b" => 200
}

puts H

puts "iterate:"

H.each do |key,value|
	puts "#{key}: #{value}"
end

puts "count"
puts H.keys.count

puts H["a"]

puts "hash with initial value:"
dict_init = Hash.new(0)
puts dict_init["not_exist"]
