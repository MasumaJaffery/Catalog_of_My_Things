class Author
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end

  def self.json_create(hash)
    first_name = hash.fetch('first_name') # get the values from the hash by their keys
    last_name = hash.fetch('last_name')
    items = hash.fetch('items')

    object_author = Author.new(first_name, last_name)
    object_author.items = items

    # Return the book object
    object_author
  end
end
