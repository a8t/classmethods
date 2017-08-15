class Vampire

  @@coven = []
  class << self
    def coven
      @@coven
    end
  end
  attr_accessor :name, :age, :in_coffin, :drank_blood_today

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today = false
  end

  def self.create(name,age)
    newvamp = Vampire.new(name, age)
    @@coven << newvamp
    return newvamp
  end

  def self.sunrise
    @@coven.delete_if { |vampire| !vampire.in_coffin || !vampire.drank_blood_today}
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.drank_blood_today = true
      vampire.in_coffin = false
    end
  end

  def drink_blood
    self.drank_blood_today = true
  end

  def go_home
    self.in_coffin = true
  end
end

edward = Vampire.create("Edward",120)
andy = Vampire.create("Andy",3230)
Vampire.sunset

puts

p Vampire.coven

puts
andy.drink_blood
andy.go_home
Vampire.sunrise

p Vampire.coven
