require 'thread'

q = Queue.new

producer = Thread.new {
    10.times { |i|
        q.push(i)
        sleep(1)
    }

    q.push(nil)
}

consumer = Thread.new {
    loop {
        i = q.pop
        break if i == nil
        puts i
    }
}

consumer.join
