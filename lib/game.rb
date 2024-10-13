require_relative 'sort/board'
require_relative 'sort/player'

class Game
  attr_accessor

  def initialize
    @board = Board.new
    @player = create_player

    @words = []
    @selected_word = nil
  end

  def select_word
    fname = 'google-10000-english.txt'

    File.readlines(fname).each do |line|
      @words << line.chomp if line.size >= 5 && line.size <= 12
    end

    @selected_word = @words.sample
  end

  def create_player
    puts "Welcome to Hangman! What is your name?"
    player_name = gets.chomp
    Player.new(player_name)
  end

  def check_letter(letter, secret_word)
    selected_word_copy = @selected_word.clone.split('')
  
    selected_word_copy.each_with_index do |el, index|
      next unless el == letter

        secret_word[index] = el
    end
    puts @board.secret_word.join(' ')
  end

  def play_round
    puts @selected_word
    p @words.size
    @board.display(@selected_word)
    @player.make_guess
    check_letter(@player.letter, @board.secret_word)
  end

  def start
    puts "game starts"
    select_word
    play_round
    
  end

end

game = Game.new
game.start