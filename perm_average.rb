def permutation_average(n)
  digit_array = n.to_s.split('')
  length = digit_array.length
  number_of_perm = 1
  i = length
  while i > 0
  	number_of_perm *= i
  	i -= 1
  end
  number_of_perm
  digit_array.inject(0) do |res,ele|
  	res
  end
end

p permutation_average(234)
