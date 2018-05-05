#! /usr/bin/ruby
require "observer"
require "tk"

class WatchModel
	include Observable

	def initialize
		@running = false	
		@time = 0
		@last = 0.0

		Thread.start do			
			loop do
				sleep 0.01
				if @running
					now = Time.now.to_f
					@time += now - @last
					@last = now

					changed
					notify_observers(@time)
				end
			end
		end
	end

	def start_stop
		@last = Time.now.to_f
		@running = !@running
	end

	def time
		@time
	end
end

class WatchView
	def initialize(model)
		model.add_observer(self)
	end

	def update(time)
		printf "\e[8D%02d:%02d"	, time.to_i, (time - time.to_i)*100
		STDOUT.flush
	end
end

class WatchController
	def initialize
		@model = WatchModel.new
		@view = WatchView.new(@model)

		system "stty cbreak -echo"

		begin
			@view.update(@model.time)
			loop do
				break if STDIN.getc == ?q
				@model.start_stop
			end
		ensure
			system "stty cooked echo"
		end
	end	
end

# the view+controller
class WatchWindow
	def initialize
		model = WatchModel.new
		model.add_observer(self)

		@label = TkLabel.new(nil).pack('fill' => 'x')
		self.update(0)

		btn = TkButton.new
		btn.text('start/stop')
		btn.command(proc{model.start_stop})
	    btn.pack('fill'=>'x')

	    btn = TkButton.new
	    btn.text('quit')
	    btn.command(proc{exit})
	    btn.pack('fill'=>'x')

	    Tk.mainloop
	end

	def update(time)
		@label.text format("%02d:%02d",
							time.to_i,
							(time-time.to_i) * 100)
	end
end

# WatchController.new
WatchWindow.new





