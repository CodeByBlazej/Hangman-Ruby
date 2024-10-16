class Player
  attr_accessor :name, :letter

  def initialize(name)
    @name = name
    @letter
  end

  def to_h
    { name: @name }
  end

  def self.from_h(hash)
    Player.new(hash['name'])
  end

  def make_guess
    puts "\nWhat's the letter of your choice?"
    @letter = gets.chomp.downcase
  end
end