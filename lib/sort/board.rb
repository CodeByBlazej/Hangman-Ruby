class Board
  attr_accessor

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

end