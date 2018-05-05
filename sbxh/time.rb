require 'date'

t1 = Time.local(2018, 05, 02, 17)
p t1

t2 = Time.gm(2018, 05, 02, 17)
p t2

t1.gmtime
p t1

t1.localtime
p t1

p File.mtime("time.rb")

p Time.local(1993, 2, 24, 12, 00).to_i

puts "今天 ruby 诞生多少天了？"

ruby = DateTime.new(1993, 2, 24)
today = DateTime.now

puts "今天 ruby 诞生#{(today - ruby).to_i}天"



