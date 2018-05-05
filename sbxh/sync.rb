require 'sync'

class TV
    def initialize
        @ch = 1
        @sync = Sync.new
    end

    def start_watch
        @sync.lock(:SH)
    end

    def end_watch
        @sync.unlock(:SH)
    end

    def set_ch(ch)
        @sync.synchronize(:EX) {
            @ch = ch
        }
    end
end
