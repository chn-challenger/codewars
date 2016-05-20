def scan_possible_moves(path,map)
  pos = path.last
  possible_moves = []
  x_max, y_max = map.length - 1, map.first.length - 1
  possible_moves << [pos[0]-1,pos[1]] if 0 <= pos[0]-1 && map[pos[0]-1][pos[1]]
  possible_moves << [pos[0],pos[1]+1] if pos[1]+1 <= y_max && map[pos[0]][pos[1]+1]
  possible_moves << [pos[0]+1,pos[1]] if pos[0]+1 <= x_max && map[pos[0]+1][pos[1]]
  possible_moves << [pos[0],pos[1]-1] if 0 <= pos[1]-1 && map[pos[0]][pos[1]-1]
  going_back_removed = possible_moves - path
end

def move_a_step(current_path,other_choices,map,target)
  return [] if map == [[true]]
  possible_moves = scan_possible_moves(current_path,map)
  if possible_moves != []
    next_move = possible_moves.delete_at(0)
    other_choices[current_path.last] = possible_moves if possible_moves != []
    current_path << next_move
  else
    last_junction = other_choices.keys.last.dup
    junction_index = current_path.index(last_junction)
    current_path.delete_if{|pos| current_path.index(pos) > junction_index}
    next_move = other_choices[current_path.last].delete_at(0)
    other_choices.delete(current_path.last) if other_choices[current_path.last] == []
    current_path << next_move
  end
  if current_path.last == target
    return current_path
  else
    move_a_step(current_path,other_choices,map,target)
  end
end
