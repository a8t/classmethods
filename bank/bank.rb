class BankAccount
  # attr_accessor :balance

  @@interest_rate = 1.01
  @@accounts = []

  def initialize
    @balance = 0
  end

  def deposit(amt)
    @balance += amt
  end

  def withdraw(amt)
    @balance -= amt
  end

  def self.create
    new_account = self.new
    @@accounts << new_account
    return new_account
  end

  def self.total_funds
    sum = 0
    @@accounts.each { |each_account| sum += each_account.balance}
    sum
  end

  def self.interest_time
    @@accounts.each do |each_account|
      each_account.deposit(@@interest_rate * each_account.balance)
      # each_account.balance *= @@interest_rate
      # above 
    end
  end

end


my_account = BankAccount.create
your_account = BankAccount.create


my_account.deposit(200)
your_account.deposit(1000)
puts BankAccount.total_funds
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
