Dir.entries(".").sort do |a, b|
    File.mtime(a) <=>
    File.mtime(b)
end

# Schwarzian Transform
# 先计算出比较用的值，避免比较计算重复进行
Dir.entries(".").
    map { |x|
        [x, File.mtime(x)]
    }.sort { |a, b|
        a[1] <=> b[1]
    }.map { |x|
        x[0]
    }

# 等同于 Schwarzian Transform
Dir.entries(".").sort_by do |a|
    File.mtime(a)
end
