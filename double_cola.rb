def whoIsNext(names, r)
  x = names.length.to_f
  n = (Math.log(r.to_f/x + 1)/Math.log(2)).to_i
  m = ((r - x.to_i*(2**n - 1)).to_f/(2**n).to_f)
  m = m.to_f == m.to_i.to_f ? m.to_i - 1 : m.to_i
  	return names[m]
end

puts "#{whoIsNext(["Sheldon","Leonard","Penny","Joe","Rajesh","Howard"],7230702951)}"



