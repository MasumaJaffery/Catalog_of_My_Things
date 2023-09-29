require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archieved)
    # call constructor here
    super(label, genre, author, publish_date)
    @id = rand(1...100)
    @publisher = publisher
    @cover_state = cover_state
    @archived = false
  end

  def can_be_archived?
    # super overrides method of Parent class (Item).
    super || (@cover_state == 'bad')
  end
end

book = Book.new('Imam Ali a.s', 'Nahjul-e-Balgah', '2001-01-01',false)
puts book.can_be_archived?
