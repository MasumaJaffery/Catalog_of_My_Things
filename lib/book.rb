require 'date'
require 'item'

class Book < Item
  attr_accessor :publisher, :cover_state
  def initialize(publisher, cover_state, publish_date)
    @id = rand(1...100)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = Date.parse(publish_date)
    @archived = false
  end
def can_be_archived?
    # super overrides can_be_archived method from item(parent) class.
    super || 
    if(@cover_state == 'bad')
    return true
    else
    return false
    end
  end
end

book = Book.new('Imam Ali a.s','Nahjul.e.Balgha')
puts book.can_be_archived?