require_relative 'sort/board'
require_relative 'sort/player'
require 'json'
require 'colorize'

class Game
  attr_accessor :selected_word

  def initialize
    @board = Board.new(Array.new, Array.new(8, 'O'))
    @player = nil

    @words = []
    @selected_word = nil
  end

  def to_h
    {
      player: @player.to_h,
      board: @board.to_h,
      selected_word: @selected_word
    }
  end

  def self.from_h(hash)
    game = Game.new
    game.instance_variable_set(:@player, Player.from_h(hash['player']))
    game.instance_variable_set(:@board, Board.from_h(hash['board']))
    game.instance_variable_set(:@selected_word, hash['selected_word'])
    game
  end

  def save_game
    File.write("savefile.json", JSON.dump(self.to_h))
  end

  def load_game
    save_data = JSON.load(File.read("savefile.json"))
    game = Game.from_h(save_data)
    game.play_round
  end

  def select_word
    fname = 'google-10000-english.txt'

    File.readlines(fname).each do |line|
      @words << line.chomp if line.size >= 5 && line.size <= 12
    end

    @selected_word = @words.sample
  end

  def create_player
    return @player if @player

    puts "\nWhat is your name?".colorize(:color => :black, :background => :light_green)
    player_name = gets.chomp
    Player.new(player_name)
  end

  def check_letter(letter, secret_word)
    selected_word_copy = @selected_word.clone.split('')
  
    selected_word_copy.each_with_index do |el, index|
      next unless el == letter

        secret_word[index] = el
    end

    if selected_word_copy.none?(letter)
      @board.remove_live unless letter == 'save'
    end

    @board.display(@selected_word)
  end

  def play_round
    puts "\nIf you want to SAVE the game instead of guess letter type SAVE.\n\n".colorize(:color => :black, :background => :light_green)
    @board.display(@selected_word)

    until @board.lives.empty? || @selected_word == @board.secret_word.join('') do
      @player.make_guess

      if @player.letter == 'save'
        save_game
      end

      check_letter(@player.letter, @board.secret_word)
    end

    if @board.lives.empty?
      puts "\nGAME OVER! You run out of lives! Secret word was: #{selected_word}".colorize(:color => :black, :background => :light_green)
    elsif @selected_word == @board.secret_word.join('')
      puts "\n#{@player.name} guessed the word and WINS!".colorize(:color => :black, :background => :light_green)
    end
  end

  def welcome_message
    puts "\nWelcome to the Hangman!".colorize(:color => :black, :background => :light_green)
  end

  def start
    welcome_message

    if File.exist?("savefile.json")
      puts "\nDo you want to load saved game? Type YES or NO...".colorize(:color => :black, :background => :light_green)
      answer = gets.chomp.downcase
      return load_game if answer == "yes"
    end

    @player = create_player
    puts "\nLook at the row of letters below and try to guess the word!\nEvery time you guess wrong, you lose 1 life-point".colorize(:color => :black, :background => :light_green)
    select_word
    play_round
  end
end
