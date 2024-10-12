class Board


  def initialize
    @secret_word = Array.new

  end

  def hidden_word(selected_word)
    puts selected_word
    p @secret_word
  end

  def display(selected_word)
    hidden_word(selected_word)
  end

end