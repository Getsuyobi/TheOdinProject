require 'pry-byebug'
def caesar_cipher(string, shift)
    string = string.bytes.map! {|value| value - shift}
    string.pack('c*')
end

puts a = caesar_cipher("Bonjour",5)
puts b = caesar_cipher(a,-5)