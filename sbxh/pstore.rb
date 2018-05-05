require 'pstore'

db = PStore.new("ncount")

STDOUT.print "input name:"
STDOUT.flush

name = gets.chomp
db.transaction do
    # initial name is not exist
    db[name] ||= 0

    db[name] += 1
    db.roots.each do |n|
        printf "name: %s count: %d\n", n, db[n]
    end
end
