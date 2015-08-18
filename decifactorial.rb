class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

def dec2FactString(nb)
  # your code
end


puts 5.fact