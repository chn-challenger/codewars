
def make_lazy12(code, *a)
	some_lamb = lambda{method(code).call(*a)}
	return some_lamb
end

def test(a,b,c)
	a + b + c
end

def square(n)
  n ** 2
end

#p spread('test',1,2,3)

def spread(func, *args)
    args = args.flatten
    if func.is_a?(String)
      evaluating_text = func + '('
      for i in 0...args.length
        evaluating_text += args[i].to_s+','
      end 
      evaluating_text.slice!(-1)
      evaluating_text += ')'
      return eval(evaluating_text)
    elsif func.is_a?(Proc)
      evaluating_text = 'func.call(' 
      for i in 0...args.length
        evaluating_text += args[i].to_s+','
      end
      evaluating_text.slice!(-1)
      evaluating_text += ')'
      return eval(evaluating_text)
    end
end

def spread1(func, args)
  func.call(*args)
end

func = ->(x,y){x+y}
#p func.is_a?(Proc)
p spread1(->(x,y){x+y}, [1,2])


#p spread1('test', [1,2,3])#

#p eval('test(1,2,3)')


#p func
text = 'func.call(1,2)'
p eval(text)




