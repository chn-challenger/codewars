def build_string(*args)
  "I like #{args.join(", ")}!"
end

def add_length(str)
  	str.split(' ').map!{|word| word = word + ' ' + word.length.to_s}
end

def name_shuffler(str)
   str.split(' ').reverse.join(' ')
end

def format_money(amount)
    '$' + '%.2f'%amount
end

def repeat_it(string,n)
	return string.is_a?(String) ? string*n : 'Not a string'
end

def shortcut(s)
  	(s.split('') - ['a','e','i','o','u']).join
end

def shortcut1(s)
  s.delete('aieou')
end

def shortcut2(s)
  s.gsub(/[aeiou]/, '')
end

def DNAtoRNA(dna)
   	dna.gsub('T','U')
end

def last1 *lst
	if lst[0].is_a?(String)
		return lst[0][-1]
	elsif lst[0].is_a?(Array)

	else
		return lst.flatten(1)[-1]
	end
end

def last *args
	arguments = args
	if arguments.length > 1
		return arguments[-1]
	elsif arguments[0].is_a?(String)
		return arguments[0][-1]
	elsif arguments[0].is_a?(Array)
		return arguments[0][-1]
	else
		return arguments[0]
	end	
end

def are_you_playing_banjo(name)
	if name[0].downcase == 'r'
		return "#{name} plays banjo"
	else
		return "#{name} does not play banjo"
	end  
end

# Smash Words
def smash(words)
	words.join(' ')
end

def bool_to_word bool
    return bool ? 'Yes' : 'No'
end

def say_hello(name, city, state)
    "Hello, #{name.join(' ')}! Welcome to #{city}, #{state}!"
end

def plural(n)
    return n == 1 ? false : true
end

def solution(a, b)
    return a.length > b.length ? b+a+b : a+b+a  
end






