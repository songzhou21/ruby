Thread.new {
    loop {
        puts "thread 1"
        sleep 2
    }
}

loop {
    puts "main thread"
    sleep 3
}
