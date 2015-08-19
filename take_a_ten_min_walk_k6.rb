def isValidWalk(walk)
	return (walk.count('n') == walk.count('s') && walk.count('e') == walk.count('w') && walk.length == 10)? true : false
end

w1 =['n','s','n','s','n','s','n','s','n','s']
p isValidWalk(w1)
w2 = ['w','e','w','e','w','e','w','e','w','e','w','e']
p isValidWalk(w2)
p isValidWalk(['n','n','n','s','n','s','n','s','n','s'])