#很多以块为参数的方法在参数不是块的时候，就会返回枚举器。
e = [1, 2, 3, 4].each

loop do
    p e.next
end
