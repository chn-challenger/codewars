def josephus(items,k)
  result = []
  c = 0
  m = k
  while items.length >= 1
  		m = c + k
		m = m%items.length == 0 ? items.length : m%items.length
  		result << items[m-1]
  		items.delete_at(m-1) 
  		c = m - 1
  end
  return result
end

def josephus_new(n,k)
  result = []
  c = 0
  m = k
  items = []
  1.upto(n) {|z| items << z}
  while items.length >= 1
      m = c + k
    m = m%items.length == 0 ? items.length : m%items.length
      result << items[m-1]
      items.delete_at(m-1) 
      c = m - 1
  end
  return result
end

def josephus_survivor(n,k)
  c = 0
  m = k
  items = []
  1.upto(n) {|z| items << z}
  while items.length >= 2
      m = c + k
      m = m%items.length == 0 ? items.length : m%items.length
      items.delete_at(m-1) 
      c = m - 1
  end
  return items[0]
end



puts "#{josephus_new(14,2)}"
puts "#{josephus_survivor(100,1)}"
#Test.assert_equals(josephus([1,2,3,4,5,6,7,8,9,10],1),[1,2,3,4,5,6,7,8,9,10])
#Test.assert_equals(josephus([1,2,3,4,5,6,7,8,9,10],2),[2, 4, 6, 8, 10, 3, 7, 1, 9, 5])
#Test.assert_equals(josephus(["C","o","d","e","W","a","r","s"],4),['e', 's', 'W', 'o', 'C', 'd', 'r', 'a'])
#Test.assert_equals(josephus([1,2,3,4,5,6,7],3),[3, 6, 2, 7, 5, 1, 4])
=begin
if josephus([1,2,3,4,5,6,7,8,9,10],1) == [1,2,3,4,5,6,7,8,9,10]
	puts "Success"
else
	puts "Failed"
end
if josephus([1,2,3,4,5,6,7,8,9,10],2) == [2, 4, 6, 8, 10, 3, 7, 1, 9, 5]
	puts "Success"
else
	puts "Failed"
end
if josephus(["C","o","d","e","W","a","r","s"],4) == ['e', 's', 'W', 'o', 'C', 'd', 'r', 'a']
	puts "Success"
else
	puts "Failed"
end
if josephus([1,2,3,4,5,6,7],3) == [3, 6, 2, 7, 5, 1, 4]
	puts "Success"
else
	puts "Failed"
end
=end
