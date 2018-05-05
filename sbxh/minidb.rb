require 'minidb'

db = MiniDB.new("minidb.data")
db["abc"] = "123"
p db["abc"]

db["def"] = "456"
p db["def"]

db.each do |k, v|
    p [k, v]
end

db.close
