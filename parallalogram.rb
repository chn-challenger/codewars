def pattern(n)
  digits = (1..n).map{ |j| (j % 10).to_s }.join
  (1..n).map{ |i| "#{' ' * (n - i)}#{digits}#{' ' * (i - 1)}" } * "\n"
end

puts pattern(6)