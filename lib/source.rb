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

# source = Source.new(1, 'Baqir')
# now the add_item method will get an instance of class and it will add that into items object
# Print the source's properties
# puts "Source ID: #{source.id}"
# puts "Source Name: #{source.name}"
# puts "Associated Items: #{source.items.map { |item| item.name }}"
