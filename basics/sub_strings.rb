require 'pry-byebug'

# def substrings(string, dictionary)
#     answer = Hash.new(0)
#     string = string.downcase.split
#     dictionary.each do |substring|
#         string.each do |word|
#             if word.include? substring
#             answer[substring] += 1
#             end
#         end
#     end
#     # binding.pry
#     puts answer
# end

def substrings (string, dictionary)
    answer = Hash.new(0)
    string = string.downcase

    dictionary.each do |word|
        matches = string.scan(word).length
        answer[word] = matches unless matches == 0
    end

    puts answer
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)