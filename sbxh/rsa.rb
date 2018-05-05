def rsa(pq, k, msg)
    msg.collect do |x|
        x**k%pq
    end
end

orig = [7, 13, 17, 24]
encode = rsa(33, 3, orig)
decode = rsa(33, 7, encode)

puts encode
puts decode 
