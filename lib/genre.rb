require_relative 'item' # Assuming Item is in the same directory

class Genre
  attr_accessor :name, :items # :items to hold associated Item objects

  def initialize(name)
    @name = name
    @items = [] # Initializing an empty array to hold associated Item objects
  end

  # Method to add an associated item
  def add_item(item)
    @items << item # Adding the item to the items array
    item.genre = self # Setting the genre of the item to this instance
  end
end

# Test the class by creating an instance and accessing the properties and associations.
# if __FILE__ == $PROGRAM_NAME
#   genre = Genre.new('Rock')

#   puts "Genre Name: #{genre.name}" # Should print Rock
#   puts "Items: #{genre.items}" # Should print an empty array

#   # Creating an associated Item and adding it to the Genre
#   item = Item.new('Label', 'Author', genre, '2012-05-23')
#   genre.add_item(item)

#   puts "Items after adding an item: #{genre.items}" # Should print the array with the added item

#   puts "Item's Genre after adding the item to the genre: #{item.genre.name}" # Should print the name of the genre
# end
