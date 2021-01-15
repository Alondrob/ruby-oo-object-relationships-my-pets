require 'pry'
class Cat
  
  attr_accessor :owner, :mood
  attr_reader :name

    @@all_cats = []

  def initialize(name, owner)
      @name = name
      @owner = owner
      @mood = 'nervous'
      save

  end

    def save
      @@all_cats << self
    end

    def self.all
      @@all_cats
    end

 



# binding.pry
end