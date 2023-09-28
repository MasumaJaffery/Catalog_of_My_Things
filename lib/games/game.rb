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
end
