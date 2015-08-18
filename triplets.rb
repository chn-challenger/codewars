








def recover_secretv1 triplets
  	letters = {}
	triplets.each{|x| x.each{|y| letters[y] = 0 }}
	prev_string = ''
	curnt_string = ''
	while true
		triplets.each do |t|
			(0..2).each do |i| 
				if i > 0
					letters[t[i]] += (letters[t[i-1]]+1)
				end	
			end 
		end
		new_hash = letters
		new_hash = new_hash.sort_by { |x, y| y }
		prev_string = curnt_string
		curnt_string = ''
		new_hash.each{|x,y| curnt_string += x}
	  	puts "#{new_hash}"
	  	puts prev_string
	  	puts curnt_string
	  	puts '........................................'
	  	if prev_string == curnt_string
	  		return curnt_string
	  	end
	end
end

def first_letter triplets
	letter1st = '';	first_letters = [];	rest = []
	triplets.each{|t| first_letters << t[0]; (1...t.length).each{|i| rest << t[i]}}
	first_letters.uniq!; rest.uniq!
	#puts "#{rest}"
	#puts "#{first_letters}"
	first_letters.each{|x| letter1st = x if rest.include?(x) != true}
	#puts "#{letter1st}"
	to_remove = []; to_remove << letter1st
	#puts "#{to_remove}"
	(0...triplets.length).each{|i| triplets[i] = triplets[i] - to_remove}
	puts "#{triplets}"
	return letter1st
end

def last_letter triplets
	letterend = '';	end_letters = []; rest = []
	triplets.each {|t| end_letters << t[-1]; (0...t.length-1).each{|i| rest << t[i]} if t.length>1}
	end_letters.uniq!; rest.uniq!
	puts "#{rest}"
	puts "#{end_letters}"
	end_letters.each{|x| letterend = x if rest.include?(x) != true}
	#puts "#{letterend}"
	to_remove = []; to_remove << letterend
	#puts "#{to_remove}"
	(0...triplets.length).each{|i| triplets[i] = triplets[i] - to_remove}
	puts "#{triplets}"
	return letterend
end

def recover_secret5 triplets
	secret_word_p1 = ''
	secret_word_p2 = ''
	secret_word = ''
while true

	letter1st = '';	first_letters = [];	rest = []
	triplets.each{|t| first_letters << t[0]; (1...t.length).each{|i| rest << t[i]}}
	first_letters.uniq!; rest.uniq!
	#puts "#{rest}"
	#puts "#{first_letters}"
	first_letters.each{|x| letter1st = x if rest.include?(x) != true}
	#puts "#{letter1st}"
	to_remove = []; to_remove << letter1st
	#puts "#{to_remove}"
	(0...triplets.length).each{|i| triplets[i] = triplets[i] - to_remove}
	triplets = triplets - [[]]
	puts "#{triplets}"
	puts "#{letter1st}"
	secret_word_p1 = secret_word_p1 + letter1st
	if triplets == []
		return secret_word_p1 + secret_word_p2
	end

	letterend = '';	end_letters = []; rest = []
	triplets.each {|t| end_letters << t[-1]; (0...t.length-1).each{|i| rest << t[i]} if t.length>1}
	end_letters.uniq!; rest.uniq!
	puts "#{rest}"
	puts "#{end_letters}"
	end_letters.each{|x| letterend = x if rest.include?(x) != true}
	#puts "#{letterend}"
	to_remove = []; to_remove << letterend
	#puts "#{to_remove}"
	(0...triplets.length).each{|i| triplets[i] = triplets[i] - to_remove}
	triplets = triplets - [[]]
	puts "#{triplets}"
	puts "#{letterend}"
	secret_word_p2 = letterend + secret_word_p2
	if triplets == []
		return secret_word_p1 + secret_word_p2
	end

	
end
	#secret_word = secret_word_p1 + secret_word_p2
	#puts "#{secret_word}"
	#return nil

end

def recover_secret_my triplets
	secret_word_p1 = ''
	secret_word_p2 = ''
	secret_word = ''
	while true
		letter1st = '';	first_letters = [];	rest = []
		triplets.each{|t| first_letters << t[0]; (1...t.length).each{|i| rest << t[i]}}
		first_letters.uniq!; rest.uniq!
		first_letters.each{|x| letter1st = x if rest.include?(x) != true}
		to_remove = []; to_remove << letter1st
		(0...triplets.length).each{|i| triplets[i] = triplets[i] - to_remove}
		triplets = triplets - [[]]
		secret_word_p1 = secret_word_p1 + letter1st
		return secret_word_p1 + secret_word_p2 if triplets == []

		letterend = '';	end_letters = []; rest = []
		triplets.each {|t| end_letters << t[-1]; (0...t.length-1).each{|i| rest << t[i]} if t.length>1}
		end_letters.uniq!; rest.uniq!
		end_letters.each{|x| letterend = x if rest.include?(x) != true}
		to_remove = []; to_remove << letterend
		(0...triplets.length).each{|i| triplets[i] = triplets[i] - to_remove}
		triplets = triplets - [[]]
		secret_word_p2 = letterend + secret_word_p2
		return secret_word_p1 + secret_word_p2 if triplets == []
	end
end


=begin

def recover_secret triplets
  letters = triplets.flatten.uniq
  triplets.each do |a, b, c|
    order letters, a, b
    order letters, a, c
    order letters, b, c
  end
  letters.join.reverse
end

def order(letters, a, b)
  if letters.index(b) > letters.index(a)
    letters.delete b
    letters.insert(letters.index(a), b)
  end
end

def recover_secret triplets
  pairs = triplets.map{ |a,b,c| [[a,b],[b,c],[a,c]] }.flatten(1)
  secret = ""
  
  while pairs.length > 2 do
    key = pairs.first.last
    prev,key = pairs.find{ |k,v| k == key } while pairs.count{ |k,v| k == key} > 0
    secret = key + secret
    pairs.reject!{ |k,v| v == key }
  end
  
  return pairs.first.join + secret
end

def recover_secret triplets
  triplets.flatten.uniq.reduce('') { |s|
    f = triplets.flatten.uniq.find { |c|
      triplets.all? { |t| !t.include?(c) || t[0] == c }
    }
    triplets.each { |t| t.delete(f) }
    s += f
  }
end

def recover_secret triplets
  # Assumptions.
  # Letters are in correct order of what they appear in the secret string
  # It is possible to deduce the secret string from the given triples
  # Thus all letters are given at least once, and more likely all are given multiple times
  # All letters are unique, and all letters in the triplets exist in the string
  # Extract an order from triplets, essentially
  
  
  # Happens_before modeling.
  # 1.First flatten the triplets, so we get a data structure containing each letter only once.
  # 1.1 Create a hash of it, with the key being the letter, value 0.
  # 3. iterate over triples. increment value in hash for first letter by 2, and for second letter by 1. 
  # We now know the order.
  # String construction:
  # 1. Sort hash-keys by their values in descending order, assemble character-keys as string
  letter_score = Hash[triplets.flatten.uniq.collect { |k| [k, []]}]
  triplets.each do |triplet|
    letter_score[triplet[0]] << triplet[1] 
    letter_score[triplet[0]] << triplet[2]
    letter_score[triplet[1]] << triplet[2]
  end
  letter_score.values.each{|list| list.uniq!}
  secret_string = []
  until letter_score.values.empty?
    next_letter = letter_score.min_by{|k,v| v.count}[0]
    # Get first letter from current secret_string
    secret_string << next_letter
    # Remove letter from lists
    letter_score.values.each{|list| list.delete(next_letter)}
    # Remove key from hash
    letter_score.delete(next_letter)
  end
  secret_string.reverse.join
  
  
end
	

=end

def recover_secret triplets
  triplets.flatten#.uniq
  #.reduce('') { |s|
   # f = triplets.flatten.uniq.find { |c|
    #  triplets.all? { |t| !t.include?(c) || t[0] == c }
    #}
    #triplets.each { |t| t.delete(f) }
    #s += f
  #}
end

triplets_1 = [
  ['t','u','p'],
  ['w','h','i'],
  ['t','s','u'],
  ['a','t','s'],
  ['h','a','p'],
  ['t','i','s'],
  ['w','h','s']
]

puts "#{recover_secret(triplets_1)}"




#puts "#{recover_secretV1(triplets_2)}"


#hash1 = {'hello' =>11,'awef' => 2,'wfawef' => 4}


#hash1 = recover_secret(triplets_1)
#hash1 = hash1.sort_by { |name, age| age }
#puts "#{hash1}"



def recover_secretV5 triplets
  	letters = {}; prev_string = ''; curnt_string = ''
	triplets.each{|x| x.each{|y| letters[y] = 0 }}
	while true
		triplets.each {|t| (0..2).each{|i| letters[t[i]] += (letters[t[i-1]]+1) if i > 0}}
		new_hash = letters
		new_hash = new_hash.sort_by { |x, y| y }
		prev_string = curnt_string
		curnt_string = ''
		new_hash.each{|x,y| curnt_string += x}
	  	return curnt_string	if prev_string == curnt_string
	end
end