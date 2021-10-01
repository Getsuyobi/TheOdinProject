# frozen_string_literal: true

require 'pry-byebug'

# bjr
class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, '#') }
    @players = %w[X O]
  end

  def game
    @board = Array.new(3) { Array.new(3, '#') }

    current_player = @players.sample

    (1..9).each do |_i|
      puts "C'est au tour du joueur #{current_player}"
      set(current_player)
      current_player = current_player == 'X' ? 'O' : 'X'

      break if check_winner(@board)
    end
    puts 'OUPS ! Égalité !'
  end

  def set(player)
    row = 3
    col = 3
    while row > 2
      puts 'Choisis une ligne (0, 1 ou 2)'
      row = gets.chomp.to_i
    end

    while col > 2
      puts 'Choisis une colonne (0, 1 ou 2)'
      col = gets.chomp.to_i
    end

    if @board[row][col] == '#'
      @board[row][col] = player
    else
      puts 'Case non disponible'
      set(player)
    end

    # Affichage du tableau
    puts "État actuel :\n"

    @board.each do |pos|
      puts pos.each { |p| p }.join(' ')
    end
  end

  def check_winner(board)
    [board, board.transpose].each do |new_board|
      result = check_lines(new_board)
      if result
        puts "Le joueur #{result} a gagné !!"
        return true
      end
    end
    result = check_diagonals(board)
    if result
      puts "Le joueur #{result} a gagné !!"
      return true
    end
    false
  end

  def check_lines(board)
    board.each do |row|
      return row[0] if row.uniq.length == 1 && (row.uniq[0] == 'X' || row.uniq[0] == 'O')
    end
    false
  end

  def check_diagonals(board)
    new_board = Array.new(3) { Array.new(3) }
    (0..2).each do |i|
      new_board[0][i] = board[i][i]
    end

    return board[0][0] if new_board[0].uniq.length == 1 && (new_board[0].uniq[0] == 'X' || new_board[0].uniq[0] == 'O')

    new_board = Array.new(3) { Array.new(3) }

    (0..2).each do |i|
      new_board[0][i] = board[i][2 - i]
    end

    return board[0][2] if new_board[0].uniq.length == 1 && (new_board[0].uniq[0] == 'X' || new_board[0].uniq[0] == 'O')

    false
  end
end

new_game = TicTacToe.new

new_game.game
