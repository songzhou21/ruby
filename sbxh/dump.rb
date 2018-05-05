obj = "obj"

f = open("dump_data", "w")
Marshal.dump(obj, f)

# read
data = Marshal.dump(obj)
obj2 = Marshal.load(data)

# read from file
#f = open("dump_data", "r")
#obj3 = Marshal.load(f)
#f.close

# deep copy
#obj2 = Marshal.load(Marshal.dump(obj))
