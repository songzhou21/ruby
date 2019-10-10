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
hash = Hash.new(0)
puts hash["not_exist"]

hash[:key] = 1
hash["key"] = 2
puts hash
hash.delete(:key)
puts hash
hash.delete("key")
puts hash


