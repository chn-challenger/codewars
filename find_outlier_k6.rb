def find_outlier(integers)
  first_three = integers.slice(0..2)
  evens = first_three.select{|x| x%2==0}
  if evens.length > 1
    integers.each do |i|
      return i if i%2 == 1
    end
  else
    integers.each do |i|
      return i if i%2 == 0
    end
  end
end

def find_outlier(integers)
  integers.partition(&:odd?).find(&:one?).first
end
