require_relative 'sort/board'

class Game
  
  def initialize
    @board = Board.new


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

  def start
    puts "game starts"
    select_word
    puts @selected_word
    p @words.size
    @board.display(@selected_word)
  end

end

game = Game.new
game.start