require 'yaml/store'
db = YAML::Store.new("ycount")

STDOUT.print "input name:"
STDOUT.flush

name = gets.chomp
db.transaction do
    db[name] ||= 0
    db[name] += 1
    db.roots.each do |n|
        printf "name: %s count:%d\n", n, db[n]
    end
end
