#def sort_deer names
#	names.map!{|x| x.split(" ")}
#	names_hash = Hash.new
#	names.each {|x| names_hash[x[0]] = x[1]}
#	names_hash2 = names_hash.sort_by {|a, b| b}
#	return names_hash2
#end


#def sort_deer names
	#names.map!{|x| x.split(" ")}.sort_by! {|x, y| y }.map!{|x| x.join(" ").to_s}
#end

def sort_reindeer reindeer_names
  reindeer_names.map!{|x| x.split(" ")}.sort_by! {|x, y| y }.map!{|x| x.join(" ").to_s}
end

def sort_reindeer2 reindeer_names
  reindeer_names.sort_by { |n| n.split.last }
end


puts "#{sort_reindeer(["Matty Elx","Alex Adam","Joe Bets"])}"