def lucasnum(n)
  	term_n_1 = 2;  term_n_2 = 1; 
  	num_iter = n-1; currnt_iter = 0
  	term_next = 0
  	puts 'L_0 is 2'
  	puts 'L_1 is 1'
  	while true
  		term_next = term_n_1 + term_n_2
  		puts "next #{term_next}"
  		currnt_iter +=1
  		return term_next if num_iter == currnt_iter
  		term_n_2 = term_n_1
  		term_n_1 = term_next
  	end
end

p lucasnum(5)