require_relative 'sort/board'
require_relative 'sort/player'

class Game
  attr_accessor

  def initialize
    @board = Board.new
    @player = create_player

    @words = []
    @selected_word
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

  def play_round
    puts @selected_word
    p @words.size
    @board.display(@selected_word)
    @player.make_guess
    puts @player.name
  end

  def start
    puts "game starts"
    select_word
    play_round
    
  end

end

game = Game.new
game.start