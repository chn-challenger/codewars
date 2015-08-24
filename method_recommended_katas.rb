def partition list, &block
  	true_array = []
  	false_array = []
  	true_array = list.select(&block)
  	false_array = list - true_array
  	result = []; result << true_array; result << false_array
  	result
end

def count list, &block
  	true_array = []
  	true_array = list.select(&block)
	return true_array.length
end

def none? list, &block
  	true_array = []
  	true_array = list.select(&block)
  	return true_array.length == 0 ? true : false
end

def all? list, &block
  list.select(&block).length == list.length
end


def divide_numbers x, y
  x.to_f / y.to_f
end

class Dog
  def initialize(breed)
    @breed=breed
  end
  
  def bark
    "Woof"
  end
end

snoopy=Dog.new("Beagle")
scoobydoo=Dog.new("Great Dane")

def compute &block
    proc = block
    if proc.is_a?(Proc)
    	proc.call
    else
    	return "Do not compute"
    end
end







