def remove_odd_hashes(array, key_1, key_2)
  	array.delete_if{|x| (x[key_1] + x[key_2]) % 2 == 1  }
end

puts remove_odd_hashes(
  [ {a: 2, b: 5}, 
    {a: 3, b: 4}, 
    {a: 2, b: 0}, 
    {a: 2, b: 1}], 
  :a, :b)