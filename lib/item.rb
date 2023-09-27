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
    now = Date.today
    # now.prev_year(10) calculates past 10 years including leap years.
    ten_years_before_now = now.prev_year(10)
    (@publish_date > ten_years_before_now)
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
