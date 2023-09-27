require_relative 'item'
require 'date'

class Label < Item
  attr_accessor :title, :color
  attr_reader :id, :items, :publish_date

  def initialize(title, color, items, publish_date)
    # Calling Constructor of Parent Class (Item)
    super('#label', '#author', '#genre', publish_date)
    @id = rand(1...100)
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
    # << means appending item in items Array.
    items << item
    # Add self as a property of the item object (by using the correct setter from the item object)
    item.label = self
  end
end

label = Label.new('Rainbow', 'blue', [1, 2, 3, 4, 5, 6, 7], '2023-09-27')
puts label.title
