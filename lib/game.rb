class Game
  
  def initialize
    
    @words = []
    @selected_word
  end

  def select_word
    fname = 'google-10000-english.txt'

    File.readlines(fname).each do |line|
      @words << line.chomp if line.size > 5 && line.size <= 12
    end

    @selected_word = @words.sample
  end

  def start
    puts "game starts"
    select_word
    p @selected_word
  end

end

game = Game.new
game.start