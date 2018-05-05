class SimpleDelegator
	# (a) 方法的初始化
    preserved = [
        "__id__",
        "object_id",
        "__send__",
        "respond_to?"
    ]
    
    instance_methods.each do |m|
        next if preserved.include?(m)
		undef_method m
    end
    
	# (b) 对象的初始化
	def initialize(obj)	
		@_sd_obj = obj
	end
	
	#(c)method_missing
	def method_missing(m, *args)
		unless @_sd_obj.respond_to?(m)
			super(m, *args)
		end
		
		@_sd_obj.__send__(m, *args)
		
	end
	
	#(d)方法确认
	def respond_to?(m)
		return true if super
		return @_sd_obj.respond_to?(m)
	end

	
end