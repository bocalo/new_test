puts 'Введите значение основания(a)'
a = gets.chomp.to_i
puts 'Введите значение высоты треугольника(h)'
h = gets.chomp.to_i
square = 0.5 * a * h
puts
puts "Площадь треугольника: #{square.to_i}"