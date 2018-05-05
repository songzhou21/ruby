class Dice
	def initialize(n)
		@n = n	
	end
	
	def each
		@n.times {
			yield rand(6)+1
		}
	end
end

class Dice
	include Enumerable
end

dice = Dice.new(10)

dice.each do |x|
	p x
end

p dice.reject { |x| x <= 3 }