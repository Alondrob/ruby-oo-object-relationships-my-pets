require 'pry'
class Owner

    attr_accessor 
    attr_reader :name, :species

    @@owners =[]

  def initialize(name)
    @name = name
    @species = "human"
    @@owners << self
  end


  def say_species

   "I am a #{@species}."
    
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.count
  end

  def self.reset_all
    @@owners.clear
  end

   def cats 
      # Cat.all.find {|cat| cat.owner == self} find method is not going to work because finde returns the first element that matches the condition
      # in this case only one element, what if there more than one that matches ?
      #select returns the array - that's what the spec is testing
      #this code will access the array of all created instances of cats and then 
      #ask if the cat's owner matches the object of the owner if it does
      #it will return an array of all cats objects owned by the owner object.
      Cat.all.select {|cat| cat.owner == self}
    end

    def dogs
      Dog.all.select {|dog| dog.owner == self}
    end

    def buy_cat(name)
      self.cats << Cat.new(name, self)
    end

    def buy_dog(name)
      self.dogs << Dog.new(name, self)
    end

    def walk_dogs
      self.dogs.each { |dog| dog.mood = "happy" }
      # this is owner_1.dogs => will return an array of dogs that belong to owner_1
      # telling iterate through the array of dogs of this owner and each dog change its mood to "happy"
      #on the upper level if i call owner_1.walk_dogs its invoke this method

    end

    def feed_cats
        self.cats.each { |cat| cat.mood = "happy" }
    end

    def sell_pets
      pets_array= cats + dogs

      pets_array.each {|pet| pet.mood = "nervous"}
      pets_array.each {|pet| pet.owner = nil}    
    end

    def list_pets

      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end

# binding.pry
end