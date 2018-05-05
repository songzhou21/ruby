# Proxy（代理）模式是为某个对象提供代理对象的模式
require 'delegate'

class Obj
	def test
		p "test"
	end
end

obj = Obj.new

proxy = SimpleDelegator.new(obj)
proxy.test

# implement 'proxy' pattern
class Proxy
	def initialize(orig)
		@obj = orig
	end

	def method_missing(name, *args)
		@obj.send(name, *args)	
	end
end

p = Proxy.new(obj)
p.test

=begin
比如字处理软件，它利用 Proxy 对象来处理嵌入图像，
把嵌入图像的生成处理延迟到需要表示的瞬间才来进行。	
=end
class ImageProxy < Delegator
	def initialize(data)
		@data = data
		@image = nil
	end

	def __getobj__
		if @image == nil
			@image = LoadImage(@data)	
		end

		@image
	end
end