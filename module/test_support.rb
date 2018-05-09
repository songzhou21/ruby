require_relative 'support'

class Decade
    include Week

    no_of_yrs = 10
    def no_of_months
        puts Week::FIRST_DAY
        puts "no_of_months"
    end
end

d1 = Decade.new
puts Week::FIRST_DAY

puts d1.no_of_months