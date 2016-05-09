def fromNb2Str(n, sys)
    prod = 1
    sys.each {|x| prod = prod*x}
    return "Not applicable" if prod <= n
    for i in 1..sys.length-1
        for j in i+1..sys.length
            unless sys[i-1].gcd(sys[j-1]) == 1 
                return "Not Applicable"
            end
        end
    end
    string = ""
    sys.each {|x| string = string + "-"+ (n % x).to_s + "-" }
    return string
end

#def fromNb2Str(n, sys)
  # your code
#end

puts fromNb2Str(20, [2,3,5,7])