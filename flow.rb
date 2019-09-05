puts "---if---"

if 10 < 20
    puts "yes"
end

if 2 < 1
  puts "if" 
else
  puts "else" 
end

if 2 < 1
  puts "if" 
elsif 1 < 2
  puts "elsif" 
else
  puts "else"
end

puts "yes" if 10 < 20

#other
if 10 < 20; puts "yes" end
if 10 < 20 then puts "yes" end

i = 1
if i== 1; puts 1
elsif i == 2; puts 2
end

puts "---while---"
i = 0
while i < 5 do 
    puts i
    i += 1 
end

i = 0
while i < 5 
    puts i
    i += 1 
end

puts "---until---"
i = 0
until i == 5
    puts i
    i += 1
end

puts "---for---"
for i in 1..8
    puts i
end

puts "---times---"
5.times {|i|
    puts i
}

3.times do |i|
    puts i
end
