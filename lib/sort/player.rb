class Player
  attr_accessor :name, :letter

  def initialize(name)
    @name = name
    @letter
  end

  def make_guess
    puts "\nWhat's the letter of your choice?"
    @letter = gets.chomp.downcase
  end
end