class ArrayIterator
	def initialize(array)
		@array = array
		@current = 0
	end

	def first()
		@current = 0	
	end

	def next()
		@current += 1
	end

	def is_done()
		return @current >= @array.size()
	end

	def current_item()
		return @array[@current]
	end
end

it = ArrayIterator.new([1,2,3])
it.first()

until it.is_done()
	puts it.current_item()	
	it.next()
end

# `each` 方法不传递 block，会返回 enumerator
a = [1, 2, 3]
b = [9, 8, 7]

result = []
ia = a.each
ib = b.each

loop do
	result.push(ia.next)	
	result.push(ib.next)	
end

p result