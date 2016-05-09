def sol_equa(n)
    all_answers = []
    for i in 1..(n.to_f**0.5).to_i
        if n%i == 0 && (n/i - i)%4 ==0
            x = (n/i + i)/2
            y = (n/i - i)/4
            answer = [x,y]
            all_answers << answer
        end
    end
    return all_answers
end

puts "#{13/2}"
puts "#{sol_equa(12)}"
puts "#{sol_equa(13)}"
puts "#{sol_equa(16)}"
puts "#{sol_equa(17)}"
puts "#{sol_equa(1)}"
puts "#{sol_equa(2)}"