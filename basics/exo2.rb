puts "Veuillez renseigner un nombre à 4 chiffres"

number = gets

while number.strip.size != 4
    puts "4 chiffres j'ai dis"
    number = gets
end

puts "Merci !"
number.split("")

puts "Millier : #{number[0]}\nCentaine : #{number[1]}\nDizaine : #{number[2]}\nUnité : #{number[3]}"