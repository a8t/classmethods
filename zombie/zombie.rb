class Zombie
  # Your class should have the following class variables:
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  attr_accessor :zombie_speed, :zombie_strength

  def initialize(zombie_speed, zombie_strength)
    @zombie_speed = (zombie_speed > @@max_speed ? @@default_speed : zombie_speed)
    @zombie_strength = (zombie_strength > @@max_strength ? @@default_strength : zombie_strength)
  end

  def encounter
    if outrun_zombie?
      return "You escaped!"
    elsif !(survive_attack?)
      return "You died."
    else
      you = Zombie.new(10,10)
      @@horde << you
      return "You're a zombie now."
    end
  end

  def outrun_zombie?
    rand(@@max_speed + 1) >  self.zombie_speed
  end

  def survive_attack?
    rand(@@max_strength + 1) >  self.zombie_strength
  end

  def self.all
    @@horde
  end

  def self.new_day
    some_die_off
    spawn
    increase_plague_level
  end

  def self.some_die_off
    num = rand(11)
    @@horde.pop(num)
    return "#{num} zombies died."
  end

  def self.spawn
    num = rand(@@plague_level+1)
    num.times {@@horde << Zombie.new(rand(@@max_speed), rand(@@max_strength))}
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end

  def self.deadliest_zombie
    self.all.max_by{|zombie| zombie.zombie_speed + zombie.zombie_strength}
  end
end
