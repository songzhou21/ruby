foobar = []

class << foobar
	def foo
		"Hello World!"
	end
end


puts foobar.singleton_methods