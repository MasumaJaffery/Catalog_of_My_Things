require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :title, :publish_date

  def initialize(multiplayer, last_played_at, publish_date, title = nil)
    super(nil, nil, nil, publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
    @title = title
  end

  def can_be_archived?
    now = Date.today # Use Date.today to ensure consistent data types
    two_years_ago = now - 730.4 # Approximately 2 years in days
    return true if super && @last_played_at < two_years_ago

    false
  end

  def add_author(author)
    author.items.push(self)
    self.author = author
  end

  def self.json_create(hash)
    title = hash.fetch('title') # get the values from the hash by their keys
    last_played_at = hash.fetch('last_played_at')
    publish_date = hash.fetch('publish_date')
    multiplayer = hash.fetch('multiplayer')
    author = hash.fetch('author')
    puts last_played_at
    object_game = Game.new(multiplayer, last_played_at, publish_date, title)
    object_author = Author.new(author['first_name'], author['last_name'])
    object_author.items = author['items']
    object_game.author = object_author

    # Return the book object
    object_game
  end
end
