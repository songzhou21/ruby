ip = Hash.new(0)

ARGF.each do |line|
    if /^\d+\.\d+\.\d+\.\d+/ =~ line
        ip[$&] += 1
    end
end

printf "%15s %s\n", "IP addr", "num"

ip.each do |ip, n|
    printf "%15s %s\n", ip, n
end
