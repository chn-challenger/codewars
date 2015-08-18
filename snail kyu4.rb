def snail(array)
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end

def snail1(array)
  array.empty? ? [] : array[0] + snail(array[1..-1].transpose.reverse)
end

def snail2(array)
  result = []
  while array.flatten.any?
    result << array.shift
    array = array.transpose.reverse
  end
  result.flatten
end

#p [[12,13,14,5],[11,16,15,6],[10,9,8,7]].transpose
#p [[12,13,14,5],[11,16,15,6],[10,9,8,7]].transpose.reverse

def rotate_ninety_degs(array,direction='clockwise')
    if direction == 'clockwise'
        return array.transpose.reverse
    else
        return array.transpose.each{|x| x.reverse!}
    end
end

def snail_anticlockwise(array)
    result = []
    while array.flatten.any?
        array = rotate_ninety_degs(array,'anti-clockwise')
        result << array.shift.reverse!
    end
    result.flatten
end

#p snail_anticlockwise([[1,4],[2,3]])
#p snail_anticlockwise([[1,12,11,10],
#                       [2,13,16,9],
#                      [3,14,15,8],
#                       [4,5,6,7],])

#p rotate_ninety_degs([[1,3,4],[6,5,8]],'not')


def snail4(array)
    array.shift + snail(array.transpose.reverse)
end
#=begin
#p snail2([])
p snail4([[1,2,3,4],
          [12,13,14,5],
          [11,16,15,6],
          [10,9,8,7]])

p snail4([
   [ 1,  2,  3,  4, 5],
   [16, 17, 18, 19, 6],
   [15, 24, 25, 20, 7],
   [14, 23, 22, 21, 8],
   [13, 12, 11, 10, 9],
 ])
#=end


def snail3 array
  #rearrange 2d array of arrays square into a single spiral order arranged array. 
  return [] if array == []
  ordered_array = []
  return ordered_array << array.flatten[0] if array.flatten.length == 1
  n = array.length - 1; x = 0; y = 0
    while true
    while true
      if array[x][y] != []
        ordered_array << array[x][y]
        array[x][y] = []
      else
        break
      end 
      y += 1 if y < n && array[x][y+1] != []
    end
    x += 1
    while true
      if array[x][y] != []
        ordered_array << array[x][y]
        array[x][y] = []
      else
        break
      end
      x += 1 if x < n && array[x+1][y] != []
    end
    y -= 1
    while true
      if array[x][y] != []
        ordered_array << array[x][y]
        array[x][y] = []
      else
        break
      end
      y -= 1 if y > 0  && array[x][y-1] != []
    end
    x -= 1
    while true
      if array[x][y] != []
        ordered_array << array[x][y]
        array[x][y] = []
      else
        break
      end
      x -= 1 if x > 0  && array[x-1][y] != []
    end
    y += 1
    break if array[x][y] == []
    end
  return ordered_array
end



