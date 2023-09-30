require_relative 'item'
require 'date'

class Label < Item
  attr_accessor :title, :color
  attr_reader :id, :items, :publish_date

  def initialize(title, color, items, publish_date)
    # Calling Constructor of Parent Class (Item)
    super(label, genre, author, publish_date)
    @title = title
    @color = color
    @items = items
    @publish_date = Date.parse(publish_date)
  end

  def add_item(item)
    # << means appending item in items Array.
    items << item
    # Add self as a property of the item object (by using the correct setter from the item object)
    item.label = self
  end
end
