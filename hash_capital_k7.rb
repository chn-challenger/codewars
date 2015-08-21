def capital(capitals_hash_array)
	equivalent_array = []
	capitals_hash_array.each do |hash|
		new_array = []
		hash.each do |x, y|
			new_array << x.to_s
			new_array << y.to_s
		end
		equivalent_array << new_array
	end
	result = []
	equivalent_array.each do |array|
		if array[0] == 'capital'
			result << "The capital of #{array[3]} is #{array[1]}"
		else
			result << "The capital of #{array[1]} is #{array[3]}"
		end
	end
	return result
end

country_capitals = [{'country' => 'Spain', 'capital' => 'Madrid'}]
p capital(country_capitals)[0]
mixed_capitals =  [{"state" => 'Maine', capital: 'Augusta'}, {"capital" => "Madrid", country: 'Spain'}]
p capital(mixed_capitals)[1]

#Other 100 times better solutions - TO LEARN!

# def capital(capitals_hash_array)
#   capitals_hash_array.map {|cc| "The capital of #{cc[:state] || cc['state'] || cc[:country] || cc['country']} is #{cc[:capital] || cc['capital']}"}
# end

# def capital(capitals_hash_array)
#   capitals_hash_array.map do |hsh|
#     state = hsh[:state] || hsh["state"] || hsh[:country] || hsh["country"]
#     capital = hsh[:capital] || hsh["capital"]
#     "The capital of #{state} is #{capital}"
#   end
# end

# def capital(capitals_hash_array)
#   capitals_hash_array.map do |data|
#     "The capital of #{data.search(:state, :country)} is #{data.search(:capital)}"
#   end
# end

# class Hash
#   def search(*keys)
#     keys.each do |key|
#       value = self[key] || self[key.to_s]
#       return value if value
#     end
#   end
# end

