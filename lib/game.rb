require_relative 'sort/board'
require_relative 'sort/player'
require 'pry-byebug'

class Game
  attr_accessor :selected_word

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
    puts "\nWelcome to the Hangman Game! What is your name?"
    player_name = gets.chomp
    Player.new(player_name)
  end

  def check_letter(letter, secret_word)
    selected_word_copy = @selected_word.clone.split('')
  
    selected_word_copy.each_with_index do |el, index|
      next unless el == letter

        secret_word[index] = el
    end
    # binding.pry
    if selected_word_copy.none?(letter)
      @board.remove_live
    end
    # puts 
    # puts @board.secret_word.join(' ')
    @board.display(@selected_word)
  end

  def play_round
    # puts @selected_word
    @board.display(@selected_word)

    until @board.lives.empty? || @selected_word == @board.secret_word.join('') do
      @player.make_guess
      check_letter(@player.letter, @board.secret_word)
    end

    if @board.lives.empty?
      puts "\nGAME OVER! You run out of lives!"
    elsif @selected_word == @board.secret_word.join('')
      puts "\n#{@player.name} guessed the word and WINS!"
    end
  end

  def start
    puts "\nLook at the row of letters below and try to guess the word!\nEvery time you guess wrong, you lose 1 life-point"
    select_word
    play_round
  end
end

game = Game.new
game.start