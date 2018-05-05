require "socket"

gs = TCPserver.open(0)

loop do
    Thread.start(gs.accept) do |s|
        s.close
    end
end
