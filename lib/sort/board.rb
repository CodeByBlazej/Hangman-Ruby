class Board
  attr_accessor :secret_word

  def initialize
    @secret_word = Array.new

  end

  def hidden_word(selected_word)
    puts selected_word

    selected_word.split('').each { |letter| @secret_word.push('_') }
    puts @secret_word.join(" ")
  end

  def display(selected_word)
    hidden_word(selected_word)
  end


  ### add lives counter before I make move with implementation 
  # of loop checking the lives and letters which will be probably
  # in display method.
end