def one? list, &block
  list.one?(&block)
end

def one1? list, &block
  list.map(&block).count(true) == 1
end

def one2? list, &block
  list.map!(&block)
  return list
end

puts one2?([1,2,3,6]){|x| x*4}