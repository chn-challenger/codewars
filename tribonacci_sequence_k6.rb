def tribonacci(signature,n)
	if n >= 4
		(n-3).times{signature << signature[-1]+signature[-2]+signature[-3]}
  	else
  		(3-n).times{signature.pop}
  	end
  	signature
end

p tribonacci([1,1,1],10)
p tribonacci([1,1,1],3)
p tribonacci([1,1,1],2)
p tribonacci([1,1,1],1)
p tribonacci([1,1,1],0)
