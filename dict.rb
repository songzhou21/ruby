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