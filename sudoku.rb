=begin
class Sudoku
  	def initialize(sudoku_array)
  		@sudoku_array = sudoku_array
  	end

	def is_valid()
		#check it is an array
		array = @sudoku_array
		unless array.kind_of?(Array) == true
  			return false
		end
		#set n value
		n = array.length
		#square number check
		unless ((n**0.5).to_i)**2 == n
			return false
		end
		#check each element is an array
		for i in 0...n
			unless array[i].kind_of?(Array) == true
	  			return false
			end			
		end
		#correct number of elements in each row.
		for i in 0...n
			unless array[i].length == n 
				return false
			end
		end
		#benchmark 1..n as an array to compare against
		correct_range = (1..n).to_a
		#each row has 1..n
		for i in 0...n
			current_row = []
			for j in 0...n
				current_row << array[i][j]	
			end
			current_row.sort!
			unless current_row == correct_range
				return false
			end
		end
		#each column has 1..n
		for i in 0...n
			current_colm = []
			for j in 0...n
				current_colm << array[j][i]
			end
			current_colm.sort!
			unless current_colm == correct_range
				return false
			end
		end	
		#each sqaure has 1..n
		#first make the sudoku into one long array instead of arrays in array
		one_long_array = ['zeroth']
		for i in 0...n
			for j in 0...n
				one_long_array << array[i][j]
			end
		end
		#construct each square as a sorted array and compare to the correct range array
		sqrt_n = (n**0.5).to_i
		for l in 1..sqrt_n
			for i in 1..sqrt_n
				current_sqr = []
				start_index = (sqrt_n*i - (sqrt_n-1))+(sqrt_n**3)*(l-1)
				for j in 1..sqrt_n
					for k in 1..sqrt_n
						current_sqr << one_long_array[start_index + (j-1)*n + (k-1)]
					end
				end
				current_sqr.sort!
				unless current_sqr == correct_range
					return false
				end
			end
		end
		#finally if all checks are good
		return true
	end
end
=end

class Sudoku1 < Array
	def is_valid()
		n = self.length
		#check if n is square number
		m = (n**0.5).to_i 
		return false if m != n**0.5 
		#check if each element is an array of length n and numbers in each element are unique
		self.each{|x| return false if x.kind_of?(Array) == false || x.length != n || x.uniq.length != n }
		#check if each number is integer and greater than or equal to 1
		self.each{|x| x.each{|y| return false if y.kind_of?(Integer) == false; return false if y < 1}}
		#this is the value to check against as each row / column / square must sum to it
		sum_value = (n*(n+1)/2).to_i
		#row check
		self.each{|x| sum = 0; x.each{|y| sum += y}; return false if sum != sum_value}
		#column check
		(0..n-1).each{|i| colm = []; self.each{|x| colm << x[i]}; return false if colm.uniq.length != n}
		#square check
		(0..m-1).each do|i| index1 = i*m
			(0..m-1).each do|j| index2 = j*m; square=[] 
				(index1..index1+m-1).each{|k| (index2..index2+m-1).each{|l| square<<self[k][l]}}
				return false if square.uniq.length != n
			end
		end 
		return true
	end	
end

class Sudoku < Array
	def is_valid()
		n = self.length
		m = (n**0.5).to_i 
		return false if m != n**0.5 
		self.each{|x| return false if x.kind_of?(Array) == false || x.length != n || x.uniq.length != n }
		self.each{|x| x.each{|y| return false if y.kind_of?(Integer) == false; return false if y < 1}}
		sum_value = (n*(n+1)/2).to_i
		self.each{|x| sum = 0; x.each{|y| sum += y}; return false if sum != sum_value}
		(0..n-1).each{|i| colm = []; self.each{|x| colm << x[i]}; return false if colm.uniq.length != n}
		(0..m-1).each do|i| index1 = i*m
			(0..m-1).each do|j| index2 = j*m; square=[] 
				(index1..index1+m-1).each{|k| (index2..index2+m-1).each{|l| square<<self[k][l]}}
				return false if square.uniq.length != n
			end
		end 
		return true
	end	
end



D1 = Sudoku.new([
  [7,8,4, 1,5,9, 3,2,6],
  [5,3,9, 6,7,2, 8,4,1],
  [6,1,2, 4,3,8, 7,5,9],

  [9,2,8, 7,1,5, 4,6,3],
  [3,5,7, 8,4,6, 1,9,2],
  [4,6,1, 9,2,3, 5,8,7],
  
  [8,7,6, 3,9,4, 2,1,5],
  [2,4,3, 5,6,1, 9,7,8],
  [1,9,5, 2,8,7, 6,3,4],
])

D2 = Sudoku.new([[1,2,3,4],
				 [3,4,2,1],
				 [4,3,1,2],
			     [2,1,4,3]])

puts D1.is_valid()
#puts D2.is_valid()

a = "string"

#puts "#{a>1}"



#array1 = [1,2,3,4,4,4,5]
#array2 = []
#array1.each{|x| array2 << x }

#		self.each{|x| return false if x.kind_of?(Array) != true || x.length != n || x.each{|y| y < 1 || y.kind_of?(Integer)}}


#array2.uniq!
#puts "#{array2}"
#puts "#{array1}"







S1 = Sudoku.new([[1,2,3,4],
				 [3,4,2,1],
				 [4,3,1,2],
			     [2,1,4,3]])



S2 = Sudoku.new([
  [7,8,4, 1,5,9, 3,2,6],
  [5,3,9, 6,7,2, 8,4,1],
  [6,1,2, 4,3,8, 7,5,9],

  [9,2,8, 7,1,5, 4,6,3],
  [3,5,7, 8,4,6, 1,9,2],
  [4,6,1, 9,2,3, 5,8,7],
  
  [8,7,6, 3,9,4, 2,1,5],
  [2,4,3, 5,6,1, 9,7,8],
  [1,9,5, 2,8,7, 6,3,4],
])

BS1 = Sudoku.new([
  [0,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9],
  
  [1,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9],
  
  [1,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9]
])

BS2 = Sudoku.new([
  [1,2,3,4,5],
  [1,2,3,4],
  [1,2,3,4],  
  [1]
])




#[7,8,4, 1,5,9, 3,2,6]


#puts "#{["something", "else"].kind_of?(Array)}"



def validate_sudoku(array,n)
	#square number check
	unless ((n**0.5).to_i)**2 == n
		return false
	end
	#correct number of rows
	unless array.length == n
		return false
	end
	#correct number of elements in each row.
	for i in 0...n
		unless array[i].length == n 
			return false
		end
	end
	#benchmark 1..n as an array to compare against
	correct_range = (1..n).to_a
	#each row has 1..n
	for i in 0...n
		current_row = []
		for j in 0...n
			current_row << array[i][j]	
		end
		current_row.sort!
		unless current_row == correct_range
			return false
		end
	end
	#each column has 1..n
	for i in 0...n
		current_colm = []
		for j in 0...n
			current_colm << array[j][i]
		end
		current_colm.sort!
		unless current_colm == correct_range
			return false
		end
	end	
	#each sqaure has 1..n
	#first make the sudoku into one long array instead of arrays in array
	one_long_array = ['zeroth']
	for i in 0...n
		for j in 0...n
			one_long_array << array[i][j]
		end
	end
	puts "#{one_long_array}"
	#construct each square as a sorted array and compare to the correct range array
	sqrt_n = (n**0.5).to_i
	for l in 1..sqrt_n
		for i in 1..sqrt_n
			current_sqr = []
			start_index = (sqrt_n*i - (sqrt_n-1))+(sqrt_n**3)*(l-1)
			for j in 1..sqrt_n
				for k in 1..sqrt_n
					current_sqr << one_long_array[start_index + (j-1)*n + (k-1)]
				end
			end
			puts "#{current_sqr}"
			current_sqr.sort!
			unless current_sqr == correct_range
				return false
			end
		end
	end
	#finally if all checks are good
	return true
end

sudo1 = [[1,2,3,4],
		 [3,4,2,1],
		 [4,3,1,2],
	     [2,1,4,3]]
sudo2 = [
  [7,8,4, 1,5,9, 3,2,6],
  [5,3,9, 6,7,2, 8,4,1],
  [6,1,2, 4,3,8, 7,5,9],

  [9,2,8, 7,1,5, 4,6,3],
  [3,5,7, 8,4,6, 1,9,2],
  [4,6,1, 9,2,3, 5,8,7],
  
  [8,7,6, 3,9,4, 2,1,5],
  [2,4,3, 5,6,1, 9,7,8],
  [1,9,5, 2,8,7, 6,3,4]
]


#puts "#{validate_sudoku(sudo2,9)}"

#puts "#{sudo1[1][1]}"[2,1,4,3]
#puts sudo1[0][0]
#puts sudo1[1][0]

#for i in 0...4
#	for j in 0...4
#		puts sudo1[j][i]
#	end
#end





#sudo1 = [[1,2,3,4,1],
#		  [3,4,2,1,1],
#		  [4,3,1,2,1],
#		  [2,1,4,3,1]]


#a1 = (1..9).to_a
#puts "#{a1}"
#a2 = [3,4,5,2,1]
#a2.sort!
#puts "#{a2}"


=begin
	
		for i in 0..2
			index1 = i*3
			for j in 0..2
				index2 = j*3
				square = []
				for k in index1..index1+2
					for l in index2..index2+2
						square << self[k][l]
					end
				end	
				puts "#{square}"
			end	
		end
	
=end