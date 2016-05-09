def make_lazy(code, a)
	some_lamb = lambda{|method| method(a)}
	return some_lamb
end

def triple(n)
	3*n
end

#lazy1 = make_lazy(:triple,3)
#lazy1.call

array = [1, 2, 3, 4]

# array.collect! do |n|
#   n ** 2
# end

class Array
  def iterate!(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end
end

def square(n)
  n ** 2
end

def some_m(mth,a)
	mth.call(a) + 100
end

#p some_m(method(:square),5)


def make_lazy1(code, *a)
	some_lamb = lambda{code.call(*a)}
	return some_lamb
end

def make_lazy(code, *a)
	some_lamb = lambda{method(code).call(*a)}
	return some_lamb
end

def test(a,b,c)
	a + b + c
end

def square(n)
  n ** 2
end



object1 = make_lazy(:test,1,2,3)
p object1.call
object2 = make_lazy(:square,4)
p object2.call


#Other solutions...
def make_lazy block, *args
  ->(){send block, *args}
end

def make_lazy f, *args
  -> (){ method(f).call(*args) }
end

def make_lazy(fct, *arg)
  lambda { send(fct, *arg)}
end

def make_lazy f, *args
  lambda {Kernel.send(f, *args)}
end

def make_lazy(method, *params )
  lambda {
    send method, *params
  }
end

