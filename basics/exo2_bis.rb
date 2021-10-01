puts "Veuillez renseigner un nombre à 4 chiffres"

number = gets.chomp

while number.strip.size != 4
    puts "4 chiffres j'ai dis"
    number = gets.chomp
end

puts "Merci !"

number = number.to_i

millier = number/1000
centaine = (number%1000)/100
dizaine = (number%100)/10
unité = number%10

puts "Millier : #{millier}\nCentaine : #{centaine}\nDizaine : #{dizaine}\nUnité : #{unité}"