require 'yaml'
# s
class Hangman
  def initialize
    @word = select_random_word.downcase.split('')
    @word_guessed = ''
    @letters_used = []
    @letter = ''
    @hp = 7
    @found_word = false
  end

  def show_title
    title = %(
  888
  888
  888
  88888b.   8888b.  88888b.  .d88b.  88888b.d88b.    8888b.  88888b.
  888 "88b     "88b 888 "88b d88P"88 b888 "888 "88b     "88b 888 "88b
  888  888 .d888888 888  888 888  88 8888  888  888 .d888888 888  888
  888  888 888  888 888  888 Y88b 88 8888  888  888 888  888 888  888
  888  888 "Y888888 888  888  "Y8888 8888  888  888 "Y888888 888  888
                                 888
                             Y8b 88P
                              "Y88P"                               )

    puts title
  end

  def start
    @word.each_with_index do |_caracter, i|
      @word_guessed[i] = '_'
    end
    show_title
    puts @word
    while @hp.positive?
      print_state
      choose_letter
      break if check_word || check_letter
    end

    puts '________________________________________________________'
    if @hp.zero?
      puts 'PERDU !'
      puts "Le mot à trouver était : #{@word.join('')}"
    elsif check_word
      puts 'GAGNÉ ! TU AS TROUVÉ LE MOT MYSTÈRE !'
    end
  end

  def choose_letter
    @letter = ''
    while @letter.length.zero? || @letters_used.include?(@letter)
      puts 'Veuillez entrer une lettre ou <save> pour sauvegarder la partie'
      @letter = gets.chomp.downcase
      puts 'Lettre déjà utilisée' if @letters_used.include? @letter
    end
    @letter = @letter[0] unless @letter == 'save'
    # fonction check_letter
    check_letter
    @letters_used.push(@letter) unless @letter == 'save'
  end

  def lose_hp
    @hp -= 1
    puts 'Raté !'
  end

  def print_state
    puts '________________________________________________________'
    puts "Il vous reste #{@hp} tentatives."
    puts "Lettres déjà utilisées : #{@letters_used}"
    puts "Mot à deviner : #{@word_guessed}"
  end

  def check_letter
    if @letter == 'save'
      # serialization
      save_state
      return @letter
    end
    if @word.include?(@letter)
      @word.each_with_index do |_caracter, i|
        @word_guessed[i] = @letter if @word[i] == @letter
      end
    else
      lose_hp
    end
    false
  end

  def check_word
    @word.join('') == @word_guessed
  end

  def save_state
    puts 'Choisissez le nom du fichier'
    name = gets.chomp
    File.open(name, 'w') do |f|
      f.write(to_yaml)
    end
  end

  def select_random_word
    word = ''
    word = File.readlines('5desk.txt').sample.chomp while word.length < 5 || word.length > 12
    word
  end
end

game = Hangman.new
game.start
