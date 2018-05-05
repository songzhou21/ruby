begin
    #print "input filename:"
    #path = STDIN.gets

    #path.chomp!
    #open = open(path, "r")

    raise "something bad happens"
    raise TypeError, "Wrong type"

# exception, 'catch'
rescue Errno::ENOENT
    printf "No file:%s\n", path

    # call begin...rescue(include)
    retry
rescue TypeError => e
    puts "_TypeError:#{e}"
rescue Exception => e
    puts "_Exception:#{e}"
else
    # no exception
    puts "else"
ensure
    # code exec finisehd; return, break; exception; within 'begin'
    # 'finally`
end


class FooError < StandardError
end

class BarError < StandardError
    def initialize(msg,info)
        @info = info
        super(msg)
    end
end
