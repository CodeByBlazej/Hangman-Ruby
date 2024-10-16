
class Board
  attr_accessor :secret_word, :lives

  def initialize(secret_word, lives)
    @secret_word = secret_word
    @lives = lives
  end

  def to_h
    { secret_word: @secret_word, lives: @lives }
  end

  def self.from_h(hash)
    Board.new(hash['secret_word'], hash['lives'])
  end

  def hidden_word(selected_word)
    if @secret_word.empty?
      selected_word.split('').each { |letter| @secret_word.push('_') }
      puts @secret_word.join(' ')
    else
      puts @secret_word.join(' ')
    end
  end

  def show_lives
    puts @lives.join(' ')
  end

  def remove_live
    @lives.pop
  end

  def display(selected_word)
    puts "\nWORD:"
    hidden_word(selected_word)
    puts "\nYOUR LIFE-POINTS:"
    show_lives
  end
end