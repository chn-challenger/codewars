def format_duration1(seconds)
	#return 'now' if seconds == 0
	result = ''
  	duration = {'year' => 365*24*60*60, 'day' => 24*60*60, 'hour' => 60*60, 'minute' => 60, 'secon' => 1}
  	
  	years = seconds / duration['year']
  	if years > 0
  		result += years > 1 ? "#{years} years, " : "#{years} year, "
  	end
  	seconds -= duration['year']*years 
  	
  	days = seconds / duration['day']
  	if days > 0
  		result += days > 1 ? "#{days} days, " : "#{days} day, "
  	end
  	seconds -= duration['day']*days

  	hours = seconds / duration['hour']
  	if hours > 0
  		result += hours > 1 ? "#{hours} hours, " : "#{hours} hour, "
  	end
  	seconds -= duration['hour']*hours

  	minutes = seconds / duration['minute']
  	if minutes > 0
  		result += minutes > 1 ? "#{minutes} minutes" : "#{minutes} minute"
  	end
  	seconds -= duration['minute']*minutes 

  	secons = seconds / duration['secon']
  	if secons > 0 && minutes > 0
  		result += secons > 1 ? " and #{secons} seconds" : " and #{secons} second"
  	elsif secons == 0
  	else
  		result += secons > 1 ? "#{secons} seconds" : "#{secons} second"
  	end
  	seconds -= duration['secon']*secons 
  	
	result.slice!(-2..-1) if result[-2..-1] == ', '
	return result
end

def format_duration_working(seconds)
	return 'now' if seconds == 0
	result = ''
  	duration = {'year' => 365*24*60*60, 'day' => 24*60*60, 'hour' => 60*60, 'minute' => 60, 'secon' => 1}
  	
  	years = seconds / duration['year']
  	if years > 0
  		result += years > 1 ? "#{years} years, " : "#{years} year, "
  	end
  	seconds -= duration['year']*years 
  	
  	days = seconds / duration['day']
  	if days > 0
  		result += days > 1 ? "#{days} days, " : "#{days} day, "
  	end
  	seconds -= duration['day']*days

  	hours = seconds / duration['hour']
  	if hours > 0
  		result += hours > 1 ? "#{hours} hours, " : "#{hours} hour, "
  	end
  	seconds -= duration['hour']*hours

  	minutes = seconds / duration['minute']
  	if minutes > 0
  		result += minutes > 1 ? "#{minutes} minutes, " : "#{minutes} minute, "
  	end
  	seconds -= duration['minute']*minutes 

  	secons = seconds / duration['secon']
  	if secons > 0
  		result += secons > 1 ? "#{secons} seconds" : "#{secons} second"
  	end
  	seconds -= duration['secon']*secons 
  	
	result.slice!(-2..-1) if result[-2..-1] == ', '
	result = result.reverse.sub(', '.reverse, ' and '.reverse).reverse
	return result
end


#Final submitted solution


def format_duration(time)
	return 'now' if time == 0
	result = ''
  	duration = {'year' => 365*24*60*60, 'day' => 24*60*60, 'hour' => 60*60, 'minute' => 60, 'second' => 1}
  	duration.each do |x,y|
  		count = time / y
  		if count > 0
  			result += count > 1 ? "#{count} #{x}s, " : "#{count} #{x}, "
  		end
  		time -= y*count
  	end  	
	result.slice!(-2..-1) if result[-2..-1] == ', '
	result = result.reverse.sub(', '.reverse, ' and '.reverse).reverse
	return result
end


#p format_duration(96258374)
#p format_duration(0)
#p format_duration(3600*2)

  	#duration = {'year' => 365*24*60*60, 'day' => 24*60*60, 'hour' => 60*60, 'minute' => 60, 'second' => 1}
  	
  	#duration.each do |x,y|
  	#	puts "#{x}-#{y}"

  	#end

