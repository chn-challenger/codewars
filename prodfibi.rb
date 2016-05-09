def productFib(prod)
    fibi_array = [0,1]
    while ((fibi_array[fibi_array.length-1]**2).to_f*1.5).to_i <= prod*6
    	to_add = (fibi_array[fibi_array.length-2] + fibi_array[fibi_array.length-1])
    	if fibi_array[fibi_array.length-1]*to_add == prod	
	    	return [fibi_array[fibi_array.length-1],to_add,true] 
    	elsif fibi_array[fibi_array.length-1]*to_add > prod	
    		return [fibi_array[fibi_array.length-1],to_add,false] 
    	end
    	fibi_array << to_add
    end
     	return "Error"
end

ef productFib(prod)
  a, b = [0, 1]
  while prod > a * b
    a, b = [b, a + b]
  end
  [a, b, prod == a * b]
end


puts "#{productFib(4895)}"
puts "#{productFib(5895)}"
