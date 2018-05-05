require 'singleton'

# use `singleton` library
class PrintSpooler
	include Singleton

	def test
		p 'test'
	end
end

PrintSpooler.instance.test

# 把类也作为对象来处理
class PrintSpooler2
	def PrintSpooler2::test
		p 'test'
	end
end

PrintSpooler2.test

=begin
使用对象和特异方法
在对象生成之后再增加新的方法

这种使用特异方法的办法是很符合 Ruby 特征的。
Ruby 自身的（ main 最高层的 self）及 ARGF （虚拟文件，用来代表参数所指定的文件）等
也都是用这种方法实现的。
=end

Spooler = Object.new
def Spooler.spool
	p 'test'
end

Spooler.spool



