requre 'thread'

class Resource
    def initialize
        @mutex = Mutex.new
    end

    def use
        @mutex.synchronize {

        }
    end
end
