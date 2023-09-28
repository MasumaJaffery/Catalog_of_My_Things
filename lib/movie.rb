require 'date'
require_relative 'item'
# Movie inherits from Item
class Movie < Item
  attr_accessor :silent

  def initialize(label, genre, publish_date, silent, author = nil)
    super(label, author, genre, publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end

# Test the class by creating an instance
# It will test if parrent can be archived then it will be archived
# movie = Movie.new('RCA', 'Elvis', 'Rock', '2012-05-23', true)
# puts movie.can_be_archived?
