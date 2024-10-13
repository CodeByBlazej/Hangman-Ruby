
class Board
  attr_accessor :secret_word, :lives

  def initialize
    @secret_word = Array.new
    @lives = Array.new(8, 'O')
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
    show_lives
  end

  def display(selected_word)
    puts "WORD\n"
    hidden_word(selected_word)
    puts "YOUR LIVES"
    show_lives
  end


  ### add lives counter before I make move with implementation 
  # of loop checking the lives and letters which will be probably
  # in display method.
end