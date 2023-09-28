require 'date'

class Item
  attr_accessor :label, :author, :genre, :date, :publish_date
  attr_reader :id, :archived

  # inside intialize only those items that need association
  def initialize(label, author, genre, publish_date)
    @label = label
    @author = author
    @genre = genre
    @publish_date = Date.parse(publish_date)
    @id = Random.rand(1...1000)
    @archived = false
  end

  def can_be_archived?
    now = Date.today # Use Date.today to ensure consistent data types
    ten_years_ago = now - 3652 # Approximately 10 years in days
    return true if @publish_date > ten_years_ago

    false
  end

  def move_to_archive
    return unless can_be_archived? == true

    @archived = true
  end
end
