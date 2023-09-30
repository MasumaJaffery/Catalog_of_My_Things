require_relative 'item'

class Source
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id = nil)
    @id = id.nil? ? rand(1...1000) : id
    @name = name
    @items = []
  end

  def add_item(item)
    items << item
    item.source = self
  end
end

# source = Source.new('From a friend')
# item = Item.new('Item 1', 'Author 1', 'Genre 1', '2023-09-24')
# source.add_item(item)
# puts source.to_json
