# map = [[true, false],
#     [true, true]];
#
# solve(map, {'x'=>0,'y'=>0}, {'x'=>1,'y'=>1})
# Should return ['right', 'down']

map = [
  [true,  false,  true,   false,  true,   false,  true],
  [true,  false,  true,   false,  true,   false,  true],
  [true,  true,   true,   true,   true,   true,   true],
  [true,  false,  true,   false,  true,   false,  true],
  [true,  false,  true,   false,  true,   false,  true]
]

starting_position = [3,3]
target = [0,2]

def search(map,starting_position,target)
  current_path = [starting_position]
  current_path = current_path + [] #just in case!
  current_position = starting_position
  if map[current_position[0]-1][current_position[1]]
    current_position[0] = current_position[0] - 1
    current_path << current_position
  elsif map[current_position[0]][current_position[1]+1]
    current_position[1] = current_position[1] + 1
    current_path << current_position
  end
  current_path
end

p search(map,starting_position,target)
