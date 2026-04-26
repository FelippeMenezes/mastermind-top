class Player
  attr_accessor :name, :guess

  def initialize(name = nil, guess = nil)
    @name = name
    @guess = name
  end
end
