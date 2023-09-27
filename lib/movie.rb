require_relative 'item'

class Movie < Item
  attr_reader :silent

  def initialize(silent, label, author, genre, publish_date, id: nil)
    super(label, author, genre, publish_date)
    @silent = silent
    @id = id || Random.rand(1...1000)
  end

  # Override parent method
  def can_be_archived?
    if super || @silent
      true
    else
      false
    end
  end
end

# Create an instance of the Movie 
movie = Movie.new(true, "Inception", "Christopher Nolan", "Science Fiction", "2023-09-23")
puts "Silent: #{movie.silent}"
puts "Label: #{movie.label}"
puts "Author: #{movie.author}"
puts "Genre: #{movie.genre}"
puts "Publish Date: #{movie.publish_date}"
puts "ID: #{movie.id}"
if movie.can_be_archived?
  puts "This movie can be archived."
else
  puts "This movie cannot be archived."
end

