def make_backronym(string)
	string_array = string.upcase.split('')
	string_array.map!{|x| $dict[x]}.join(' ')
end

def sum(*args)
	args.inject(0){ |result, x| result + x }
end

def solution(value)
	value = value.to_s
	'Value is '+ '0'*(5-value.length)+value
end

