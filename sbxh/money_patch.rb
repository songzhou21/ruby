class C1 < Object
	def method1
	end

	def method3
		puts "method3 from c1"
	end
end

class C2 < C1
	def method2
	end	

	def method3
		puts "method3 from c2"
	end

	remove_method :method3
end

c = C2.new

c.method1
c.method2

class C2
	undef method1
	undef method2
end


# c.method1
# c.method2

c.method3

class C3 < Object
	def foo
		puts "foo"
	end

	alias bar foo
	undef foo
end

c3 = C3.new
# c3.foo
c3.bar
