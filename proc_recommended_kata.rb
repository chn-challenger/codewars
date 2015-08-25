def bind(list, &func)
	return [] if list == []	
	list.map(&func).flatten(1) == list.map(&func) ? {}+[] : list.map(&func).flatten(1)
end

def bind(list, &func)
  mapped_list = list.map(&func)
  
  unless mapped_list.all? { |i| i.is_a? Array }
    raise "ERROR!  The returned value is not a list!"
  end
  
  mapped_list.flatten(1)
end

def bind(list, &func)
  list.reduce([]) { |memo, e| memo + yield(e) }
end

def compose(f,g)
  	Proc.new do |*x|
  		f.call(g.call(*x))
  	end
end

def compose(f,g)
  ->(*args){ f.( g.(*args) ) }
end









