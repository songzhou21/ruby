require 'revactor'

def pingpong(name)
    loop do
        Actor.receive do |filter|
            filter.when(Case[Actor, Integer]) do |partner, count|
                if count == 0
                    puts "#{name}:done"
                    exit
                else
                    if count % 500 < 2
                        puts "#{name}: pingpong #{count}"
                    end
                    partner << [Actor.current, count-1]
                end
            end
        end
    end
end

ping = Actor.spawn {pingpong("ping")}
pong = Actor.spawn {pingpong("pong")}

pong << [ping, ARGV[0].to_i]
Actor.reschedule
