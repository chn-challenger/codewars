def basic_op a,b,op
	a = a.to_f; b = b.to_f
	case op
		when '+' then a+b
		when '-' then a-b
		when '*' then a*b
		when '/' then a/b
		else puts "#{op} operator error - not recognized"
	end
end

def calc_array(expr_array)
	operators = ['+','-','/','*']
	digits = ['0','1','2','3','4','5','6','7','8','9','.']
	opt_idx = 0
	if (expr_array & operators).length == 0
		if expr_array[-1].to_f == expr_array[-1].to_i
			return expr_array[-1].to_i
		else
			return expr_array[-1].to_f
		end
	end
	expr_array.each.with_index do |x, i|
		if operators.include?(x)
			opt_idx =  i
			break
		end
	end
	
	result = basic_op(expr_array[opt_idx-2],expr_array[opt_idx-1],expr_array[opt_idx])
	expr_array[opt_idx] = result
	expr_array.delete_at(opt_idx-1)
	expr_array.delete_at(opt_idx-2)

	if expr_array.length == 1
		if expr_array[0].to_f == expr_array[0].to_i
			return expr_array[0].to_i
		else
			return expr_array[0].to_f
		end
	else
		return calc_array(expr_array)
	end	
end

def calc(expr)
	return 0 if expr == ""
	expr_array=expr.split(' ')	
	return calc_array(expr_array)
end

def calc_v1(expr)
  expr.split.each_with_object([]) { |e, a|
    if e.match(/\d+/)
      a << e.to_f
    else
      y, x = a.pop, a.pop
      a << x.send(e, y)
    end
  }.last || 0
end
