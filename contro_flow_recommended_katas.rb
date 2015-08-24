def greet(name)
  return name == "Johnny" ?  "Hello, my love!" :  "Hello, #{name}!"
end

def get_planet_name(id)
  # This doesn't work; Fix it!
  case id
    when 1 then "Mercury"
    when 2 then "Venus"
    when 3 then "Earth"
    when 4 then "Mars"
    when 5 then "Jupiter"
    when 6 then "Saturn"
    when 7 then "Uranus"  
    when 8 then "Neptune"
    else return nil
  end
end