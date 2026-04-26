class Computer
  attr_accessor :name

  def initialize (name = nil)
    @name = name
  end

  def self.create_computer
    names = ["GPTo", "ClaudIO", "MarI.A."]
    @name = names.sample
  end
end
