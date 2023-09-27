require 'date'

class Item
  attr_accessor :label, :author, :genre, :date
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
    now = Time.now
    ten_years_before_now = now - (10 * 365 * 24 * 60 * 60) # 10 years in seconds, not accounting for leap years
    return true if @publish_date > ten_years_before_now

    false
  end

  def move_to_archive
    return unless can_be_archived? == true

    @archived = true
  end
end

