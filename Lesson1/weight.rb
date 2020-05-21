puts 'Здравствуйте, как вас зовут?'
name = gets.chomp
puts "#{name}, какой у вас рост?"
height = gets.chomp.to_i

ideal_weight = (height - 110) * 1.15

puts "#{name}, Ваш идеальный вес: #{ideal_weight}" 

if ideal_weight < 0
    puts  'Ваш вес уже оптимальный' 
else
    puts 'Надо что-то делать'
end