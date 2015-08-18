def point_vs_vector(point, vector)
  	x = ((vector[1][0].to_f - vector[0][0].to_f)/(vector[1][1].to_f - vector[0][1].to_f)) *(point[1].to_f - vector[0][1].to_f) + vector[0][0].to_f
 	x = x.to_f 	
  if point[0].to_f < x
  	return -1
  elsif point[0].to_f == x
  	return 0
  else 
  	return 1
  end
end


puts "#{point_vs_vector([2,2], [[1, 3], [5, 13]])}"
puts "#{point_vs_vector([0,1], [[0, 0], [1, 1]])}"
puts "#{point_vs_vector([2.3,7.2], [[1, 2], [4, 14]])}"



=begin

def point_vs_vector(point, vector)
  y = ((vector[1][1].to_f - vector[0][1].to_f) / (vector[1][0].to_f - vector[0][0].to_f)) * (point[0] - vector[0][0]) + vector[0][1]
  if point[1] < y
  	return -1
  elsif point[1] == y
  	return 0
  else 
  	return 1
  end
end

=end