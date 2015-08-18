


def exp_sum(n)
	if n == 0
		return 1
	elsif n < 0
		return 0
	end
	parray = []
	for i in 1..n
		parray << []
		for j in 1..i
			parray[i-1][j-1] = 0	
			if i == j
				parray[i-1][j-1] = 1	
			end				
			if i.to_f/2 >= j.to_f
				for k in j..i-j
					parray[i-1][j-1] += parray[i-j-1][k-1]
				end
			end
		end
	end	
	result = 0
	parray[n-1].each{|x| result += x }
	result
end

def exp_sum1(n)
    if n<0 then return 0 end
    p=[]
    p[0]=1
    s=1
    for i in 1..n do
        j,k,s=1,1,0
        while j>0 do
            j=i-(3*k*k+k)/2
            t=k%2==1 ? -1 : 1
            if j>=0 then s=s-t*p[j] end
            j=i-(3*k*k-k)/2
            if j>=0 then s=s-t*p[j] end
            k+=1
        end
        p[i]=s
    end
    return s
end

puts "#{exp_sum(350)}"
