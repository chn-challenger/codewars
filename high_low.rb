def high_and_low(numbers)
  num_array = numbers.split(" ")
  num_array.collect!{|x| x.to_i }.sort!
  return "#{num_array[num_array.length-1]} #{num_array[0]}"
end

def high_and_low1(numbers)
  numbers.split.map(&:to_i).minmax.reverse.join(' ')
end

def high_and_low2(numbers)
  a = numbers.split.map(&:to_i).sort
  "#{a.last} #{a.first}"
end

puts "#{high_and_low("12 -24 52 32")}"