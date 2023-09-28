require 'date' # For parsing dates
require_relative 'item' # Assuming Item is the parent class

# MusicAlbum inherits from Item
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(label, author, genre, publish_date, on_spotify)
    super(label, author, genre, publish_date) # Calling the constructor of the parent class
    @on_spotify = on_spotify
  end

  # Overriding the can_be_archived? method of the parent class
  def can_be_archived?
    super && @on_spotify # Returns true if parent's method returns true and on_spotify is true
  end
end

# Test the class by creating an instance and accessing the properties.
album = MusicAlbum.new('RCA', 'Elvis', 'Rock', '2012-05-23', true)
puts "Scenario 1: Album with on_spotify true and publish_date within 10 years: #{album.can_be_archived?}" # Should print false

album2 = MusicAlbum.new('RCA', 'Elvis', 'Rock', '2000-05-23', true)
puts "Scenario 2: Album with on_spotify true and publish_date more than 10 years ago: #{album2.can_be_archived?}" # Should print true

album3 = MusicAlbum.new('RCA', 'Elvis', 'Rock', '2000-05-23', false)
puts "Scenario 3: Album with on_spotify false and publish_date more than 10 years ago: #{album3.can_be_archived?}" # Should print false
