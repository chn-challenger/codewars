require 'prime'

def mygcd1(x,y,gcd=1)
	possible_factors = Prime.take_while {|p| p <= x && p <= y}
	found = false
    possible_factors.each do |p|
    	if x%p == 0 && y%p ==0
    		x = x/p; y = y/p; gcd = gcd*p
    		found = true
    		break
    	end
    end

    if found == true
    	return mygcd(x,y,gcd)
    else
    	return gcd
	end
end

def mygcd2(*num)
    n = num.max; m = num.min
    # if x >= y
    #     n = x; m = y
    # else
    #     n = y; m = x
    # end
    while true
        r = n%m; n = m; m = r
        #puts "#{r} #{n} #{m}"
        if r == 0
            return n
        end
    end
end


def mygcd(*num)
    n = num.max; m = num.min
    while true
        r = n%m; n = m; m = r
        return n if r == 0
    end
end

def Dragon1(n, string = 'Fa')
    while true    
        if n == 0
            return string.gsub!('a',''); string.gsub!('b','')
        else
            n -= 1
            string.gsub!('a','')
        end
    end
end

# def dragon_step(string)
#     #string.gsub!('a','aRbFR').gsub!('b','LFaLb')
#     string = string.split('').join(' ')
#     subs = {'a' => 'aRbFR','b' => 'LFaLb'}
#     string.gsub!(/\w+/) { |m| subs.fetch(m,m)}.gsub!(' ','')
#     return string

# end


# def Dragon(n)
#     string = 'Fa'
#     while n > 0
#         string = dragon_step(string)
#         n -= 1
#     end
#     return string.gsub!('a','').gsub!('b','')
# end

def dragon_step(string)
    #string.gsub!('a','aRbFR').gsub!('b','LFaLb')
    string = string.split('').join(' ')
    subs = {'a' => 'aRbFR','b' => 'LFaLb'}
    string.gsub!(/\w+/) { |m| subs.fetch(m,m)}.gsub!(' ','')
    return string

end

def Dragon(n)
    return '' if n.is_a?(Integer) == false || n < 0
    string = 'Fa'
    while n > 0
        string = string.split('').join(' ')
        subs = {'a' => 'aRbFR','b' => 'LFaLb'}
        string.gsub!(/\w+/) { |m| subs.fetch(m,m)}.gsub!(' ','')
        n -= 1
    end
    string.gsub!('a',''); string.gsub!('b','')
    return string
end

def Dragon n
  return "" unless n.is_a?(Integer) && n >= 0
  str = 'Fa'
  n.times do 
    str.gsub!(/[ab]/, "a" => "aRbFR", "b" => "LFaLb")
  end
  
  str.gsub!(/[ab]/,'')
end

# def persistence(n,count = 0)
#     count = count
#     result = 1
#     digits = n.to_s.split('')
#     if digits.length > 1
#         count += 1
#         digits.each{|x| result *= x.to_i }
#     end
#     if result < 10
#         return count
#     else
#         persistence(result,count)
#     end
# end


#str.gsub!(/[ab]/, "a" => "aRbFR", "b" => "LFaLb")

string = 'acbcdBaEEc'
string.gsub!(/[ac]/,'a' => ' cIcOI ', 'c' => ' EOaaIA ')

def digital_root(n,count = 0)
    result = 0
    digits = n.to_s.split('')
    if digits.length > 1
        count += 1
        digits.each{|x| result += x.to_i }
    end
    if result < 10
        return result
    else
        digital_root(result,count)
    end
end


def digital_root(n)
  n < 10 ? n : digital_root(n / 10 + n % 10)
end
#p digital_root(15)

def Ackermann(m,n)
    if !m.is_a?(Integer) || !n.is_a?(Integer)
        return nil
    end
    if m < 0 || n < 0
        return nil
    end
    if m == 0
        return n+1
    end
    if m > 0 && n == 0
        return Ackermann(m-1,1)
    end
    if m > 0 && n > 0
        return Ackermann(m-1,Ackermann(m,n-1))
    end
    return nil
end

def factorial(n)
    return nil if n < 0
    return n <= 1 ? 1 : n*factorial(n-1)
end

















