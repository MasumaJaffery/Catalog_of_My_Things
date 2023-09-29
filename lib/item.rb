require 'date'

class Item
  attr_accessor :label, :author, :genre, :date, :publish_date
  attr_reader :id, :archived

  def initialize(label, author, genre, publish_date)
    @label = label
    @author = author
    @genre = genre

    if publish_date.is_a?(String)
      @publish_date = Date.parse(publish_date)
    else
      # Handle the case where publish_date is not a valid date string
      @publish_date = nil  # You can set it to nil or handle it as needed
    end

    @id = Random.rand(1...1000)
    @archived = false
  end

  def can_be_archived?
    now = Date.today
    ten_years_ago = now - 3652
    return false if @publish_date.nil?  # Added nil check
    return false if @publish_date > ten_years_ago

    true
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
