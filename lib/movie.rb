require 'date' 
require_relative 'item'
# Movie inherits from Item
class Movie < Item
  attr_accessor :silent

  def initialize(label, author, genre, publish_date, silent)
    super(label, author, genre, publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end

# Test the class by creating an instance
movie = Movie.new('RCA', 'Elvis', 'Rock', '2012-05-23', true)
puts movie.can_be_archived? 
