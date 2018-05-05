# =============
# implict block
# =============
=begin
使用 yield 时，块的信息只是保存在内部堆栈里，并没有用到闭包，所以这种方法的执行速度比参数方法稍微快一些
=end
def hello
	yield if block_given?
end

hello do
	puts "hello"
end

=begin
Ruby allows to pass any object to a method and
have the method attempt to use this object as its block.
If we put an ampersand in front of the last parameter to a method, 
Ruby will try to treat this parameter as the method’s block.

if the parameter is already a Proc object,
Ruby will simply associate it with the method as its block.
=end

blah = -> {
	puts "lambda"
}

hello(&blah)

=begin
If the parameter is not a Proc, Ruby will try to convert it into one 
(by calling to_proc on it) before associating it with the method as its block.
=end
class FooBar
	def to_proc
		-> {
			puts 'converted lambda'
		}
	end
end

hello(&FooBar.new)

# =============
# Explict block
# =============
def hello(&block)
	block.call if block_given?
end

hello do
	puts "hello"
end

def world
	puts "world"	
end

method_reference = method(:world)
hello(&method_reference)

# symbol to proc trick
p ["a", "b"].map(&:upcase)
p ["a", "b"].map {|string| string.upcase}















