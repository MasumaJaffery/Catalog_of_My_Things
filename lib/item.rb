require 'date'

class Item
  attr_accessor :label, :author, :genre, :date, :publish_date, :source
  attr_reader :id, :archived, :source, :genre, :author, :label

  def initialize(label, author, genre, publish_date)
    @label = label
    @author = author
    @genre = genre

    @publish_date = if publish_date.is_a?(String)
                      Date.parse(publish_date)
                    else
                      # Handle the case where publish_date is not a valid date string
                      nil # You can set it to nil or handle it as needed
                    end

    @id = Random.rand(1...1000)
    @archived = false
  end

  def can_be_archived?
    now = Date.today
    ten_years_ago = now - 3652
    return false if @publish_date.nil? # Added nil check
    return false if @publish_date > ten_years_ago

    true
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def genre=(genre)
      @genre = genre
      genre.items.push(self) unless genre.items.include?(self)
    end

    def author=(author)
      @author = author
      author.items.push(self) unless author.items.include?(self)
    end

    def label=(label)
      @label = label
      label.items.push(self) unless label.items.include?(self)
    end
    
     # only if group has 4 members
    def source=(source)
      @source = source
      source.items.push(self) unless source.items.include?(self)
    end
end
