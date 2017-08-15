require 'time'
class Book

  @@on_shelf = []
  @@on_loan = []

  attr_accessor :due_date, :title, :author

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def borrow
    if self.lent_out?
      return false
    else
      @due_date = current_due_date
      @@on_loan << self
      @@on_shelf.delete(self)
      return true
    end
  end

  def return_to_library
    if self.lent_out?
      @@on_loan.delete(self)
      @@on_shelf << self
      @due_date = nil
      return true
    else
      return false
    end
  end

  def lent_out?
    @@on_loan.include?(self)
  end

  def self.create(title, author, isbn)
    newbook = Book.new(title, author, isbn)
    @@on_shelf << newbook
    return newbook
  end

  def current_due_date
    Time.now + (2*7*24*60*60)
  end

  def self.overdue
    @@on_loan.each {|eachbook| puts (eachbook.due_date < Time.now ? "#{eachbook.title} is overdue!" : "")}
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end
end
