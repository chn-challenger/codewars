def DNA_strand(dna)
	dna = dna.split('').join(' ')
  	mapping = {'A'=>'T','T'=>'A','C'=>'G','G'=>'C'}
  	dna.gsub!(/\w+/){|x| mapping.fetch(x,x)}
  	dna.split(' ').join
end

def DNA_strand(dna)
  dna.tr("ACTG", "TGAC")
end

def DNA_strand(dna)
  dna.gsub(/[ATGC]/, "A" => "T", "T" => "A", "C" => "G", "G" => "C")
end

def zipvalidate(postcode)
	digits = ['0','1','2','3','4','5','6','7','8','9']
	postcode = postcode.split('') 
	return false if postcode.length != 6
	p postcode[0]
	return false if (postcode[0] == '0' || postcode[0] == '5' || postcode[0] == '7' || postcode[0] == '8' || postcode[0] == '9')
	postcode.each do |i|
		return false if digits.include?(i) == false
	end
	return true
end

def zipvalidate(postcode)
  /^[^05789\D]\d{5}$/ === postcode
end

def zipvalidate(postcode)
  !!(postcode =~ /^[1-46]\d{5}$/)
end

def zipvalidate(postcode)
  not (postcode =~ /^[12346]\d{5}$/).nil?
end

def zipvalidate(postcode)
  postcode =~ /^[12346]\d{5}$/ ? true : false
end

def zipvalidate(postcode)
  postcode.to_i.to_s.length == 6 && (!postcode.start_with? '0', '5', '7', '8', '9', ' ') ? true : false
end

def calculate(n1,n2,opt)
	n1 = n1.split('')
	sign = ''
	sign = n1.shift if n1[0] == '-'
	n1 = n1.reverse
	num_1 = 0
	(0..n1.length-1).each do |i|
		num_1 += n1[i].to_i*2**(i)
	end
	num_1 *= -1 if sign == '-'

	n2 = n2.split('')
	sign = ''
	sign = n2.shift if n2[0] == '-'
	n2 = n2.reverse
	num_2 = 0
	(0..n2.length-1).each do |i|
		num_2 += n2[i].to_i*2**(i)
	end
	num_2 *= -1 if sign == '-'

  	case opt	
  		when 'add' then result = num_1 + num_2
  		when 'subtract' then result = num_1 - num_2
  		when 'multiply' then result = num_1 * num_2
  		else result = nil
  	end
  	return result.to_i.to_s(2)
end

# p calculate('-1011','1111','multiply')
# p calculate('1','1','add')
#p '-13'.to_i.to_s(2)

def calculate(n1,n2,o)
  options = { 'add' => :+, 'subtract' => :-, 'multiply' => :* }
  n1.to_i(2).send(options[o], n2.to_i(2)).to_s(2)
end

def calculate(n1,n2,op)
  ops = {'add'=>->(a,b){a+b},'subtract'=>->(a,b){a-b},'multiply'=>->(a,b){a*b}}
  ops[op].(n1.to_i(2),n2.to_i(2)).to_s(2)
end

def calculate(n1,n2,o)
  func = {'add' => :+, 'subtract' => :-, 'multiply' => :*}
  n1.to_i(2).send(func[o], n2.to_i(2)).to_s(2)
end

def calculate(n1,n2,function)

  

  n1_dec = n1.to_i(2).to_s(10).to_i
  n2_dec = n2.to_i(2).to_s(10).to_i
  result = 0
  
  case function
    when 'add'
      result = n1_dec + n2_dec
    when 'subtract'
      result = n1_dec - n2_dec
    when 'multiply'
      result = n1_dec * n2_dec
  end


  return result.abs.to_s(2) if result >= 0
  return "-" + result.abs.to_s(2) if result < 0
  
end

def chain(input, fs)
	fs.each{|sym| input = method(sym).call(input)}
	return input
end

def add num
  num + 1
end

def mult num
  num * 30 
end

#p chain(2,[:add,:mult])

def chain(value, functions)
  functions.reduce(value) { |value, function| send(function, value) }
end

def chain(input, fs)
  fs.each do |f|
    input = send(f, input)
  end
  input
end

def line_types lines
  	result = []
  	lines.each do |line|
  		if line == nil
  			result << :unknown
  		elsif line.downcase.include?('alpha')
  			result << :alpha
  		elsif line.downcase.include?('beta')
  			result << :beta
  		else
  			result << :unknown
  		end
  	end
  	result
end

def line_types lines
  lines.map { |line| line.to_s[/alpha|beta/i].downcase.to_sym rescue :unknown }
end

def line_types lines
  lines.map { |line| line =~ /(alpha|beta)/i ? $1.to_sym.downcase : :unknown }
end

def line_types lines
  lines.map { |line| line.downcase[/alpha|beta/i].to_sym rescue :unknown }
end




