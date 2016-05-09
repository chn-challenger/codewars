class Calc
	attr_accessor :first_num, :second_num, :operator

	@@operators = {'plus'=> '+','minus'=> '-','times'=> '*','divided_by'=> '/',}

  	def initialize
  		@first_num = nil
  		@second_num = nil
  		@operator = nil
  	end

  	def plus
  		@operator = '+'
  		return self
  	end

  	def minus
  		@operator = '-'
  		return self
  	end

  	def times
  		@operator = '*'
  		return self
  	end

  	def divided_by
  		@operator = '/'
  		return self
  	end

  	def one
  		if @first_num.nil?
  			@first_num = 1.to_f
  		elsif @operator.nil?
  			@second_num = 1.to_f
  		else
  			@second_num = 1.to_f
  			result = eval("#{@first_num}#{@operator}#{@second_num}")
  			return result.to_i == result ? result.to_i : result
  		end
  		return self
  	end

  	def two
  		if @first_num.nil?
  			@first_num = 2.to_f
  		elsif @operator.nil?
  			@second_num = 2.to_f
  		else
  			@second_num = 2.to_f
  			result = eval("#{@first_num}#{@operator}#{@second_num}")
  			return result.to_i == result ? result.to_i : result
  		end
  		return self
  	end

  	def three
  		if @first_num.nil?
  			@first_num = 3.to_f
  		elsif @operator.nil?
  			@second_num = 3.to_f
  		else
  			@second_num = 3.to_f
  			result = eval("#{@first_num}#{@operator}#{@second_num}")
  			return result.to_i == result ? result.to_i : result
  		end
  		return self
  	end

  	def four
  		if @first_num.nil?
  			@first_num = 4.to_f
  		elsif @operator.nil?
  			@second_num = 4.to_f
  		else
  			@second_num = 4.to_f
  			result = eval("#{@first_num}#{@operator}#{@second_num}")
  			return result.to_i == result ? result.to_i : result
  		end
  		return self
  	end

  	def five
  		if @first_num.nil?
  			@first_num = 5.to_f
  		elsif @operator.nil?
  			@second_num = 5.to_f
  		else
  			@second_num = 5.to_f
  			result = eval("#{@first_num}#{@operator}#{@second_num}")
  			return result.to_i == result ? result.to_i : result
  		end
  		return self
  	end

  	def six
  		if @first_num.nil?
  			@first_num = 6.to_f
  		elsif @operator.nil?
  			@second_num = 6.to_f
  		else
  			@second_num = 6.to_f
  			result = eval("#{@first_num}#{@operator}#{@second_num}")
  			return result.to_i == result ? result.to_i : result
  		end
  		return self
  	end

  	def seven
  		if @first_num.nil?
  			@first_num = 7.to_f
  		elsif @operator.nil?
  			@second_num = 7.to_f
  		else
  			@second_num = 7.to_f
  			result = eval("#{@first_num}#{@operator}#{@second_num}")
  			return result.to_i == result ? result.to_i : result
  		end
  		return self
  	end

  	def eight
  		if @first_num.nil?
  			@first_num = 8.to_f
  		elsif @operator.nil?
  			@second_num = 8.to_f
  		else
  			@second_num = 8.to_f
  			result = eval("#{@first_num}#{@operator}#{@second_num}")
  			return result.to_i == result ? result.to_i : result
  		end
  		return self
  	end

  	def nine
  		if @first_num.nil?
  			@first_num = 9.to_f
  		elsif @operator.nil?
  			@second_num = 9.to_f
  		else
  			@second_num = 9.to_f
  			result = eval("#{@first_num}#{@operator}#{@second_num}")
  			return result.to_i == result ? result.to_i : result
  		end
  		return self
  	end
end

p Calc.new.one.plus.one
p Calc.new.one.divided_by.two
p Calc.new.five.times.two
p Calc.new.six.divided_by.five
p Calc.new.one.minus.nine


#Others

class Calc
  { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }.each do |m, n|
    define_method("#{m}") { @proc ? @proc.call(n) : (@number ||= n ; self ) }
  end
  
  { plus: :+, minus: :-, times: :*, divided_by: :/ }.each do |m, o|
    define_method("#{m}") { @proc ||= lambda { |a| @number.send(o, a) }; self } 
  end
end

class Calc
  ACCEPTED_METHODS = { 
    one:'1', two:'2',   three:'3',  four:'4', five:'5',
    six:'6', seven:'7', eight:'8',  nine:'9', ten:'10',
    plus:'+', minus:'-', times:'*', divided_by:'/'
  }
  
  def method_missing(name)
    @calc_string = "#{@calc_string} #{ACCEPTED_METHODS[name]}".strip
    @calc_string.split.size == 3 ? eval(@calc_string) : self
  end
end

# Chainable:
# Calc.new.one.plus.one.plus.one == 3

class Fixnum
  def plus;       Calc.new("+", self) end
  def minus;      Calc.new("-", self) end
  def times;      Calc.new("*", self) end
  def divided_by; Calc.new("/", self) end
end

class Calc
  def initialize(*arguments)
    if arguments.length == 2
      @operation = arguments[0]
      @number    = arguments[1]
    end
  end
  
  %w(zero one two three four five six seven eight nine).each_with_index do |w,i|
    define_method(w) { perform i }
  end
  
  def perform number
    if @operation
      @number.send(@operation, number)
    else
      number
    end
  end
end

class Calc
  %w(zero one two three four five six seven eight nine).each_with_index do |m, n|
    define_method("#{m}") { @proc ? @proc.call(n) : (@number ||= n ; self ) }
  end
  
  { plus: :+, minus: :-, times: :*, divided_by: :/ }.each do |m, o|
    define_method("#{m}") { @proc ||= lambda { |a| @number.send(o, a) }; self } 
  end
end

class Calc
  VALUES = { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9}
  OPS = { plus: :+, minus: :-, times: :*, divided_by: :/ }
  
  def initialize
    @args = []
  end
  
  def method_missing(x, *args)
    @args << VALUES[x] if VALUES.has_key? x
    @method = OPS[x] if OPS.has_key? x
     
    @args.size == 2 ? @args.reduce(@method) : self
  end
end