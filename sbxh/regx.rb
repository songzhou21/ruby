puts /P.*l/ =~ "Perl" 

puts /P.*l/.match("Perl")

m = /a(.)(.)/.match("abc")

# match all
puts m[0]
# match first ()
puts m[1]

#split
p "a,b:c".split(/[,:]/)

str = "<ul><li>a<li>b</ul>"
p str.split(/<.*?>/)
p str.split(/(<.*?>)/)

"foobarbazfoobarbaz".scan(/ba./) { |s| p s }

#sub
a = "abcabc"
p a.sub(/b/, 'B')
p a

p a.sub!(/b/, 'B')
p a

p a.sub!(/d/, 'D')
p a.gsub(/b/, 'B')

# sub with replace string
# \&, \0 整个匹配部分的字符串
# \1...\9 是第 n 个括号内匹配的字符串
a = "abcabc"
p a.sub(/[bc]/, '(\&)')

p "foobarbazfoobarbaz".gsub(/ba./) { |s| 
    s.upcase
}
