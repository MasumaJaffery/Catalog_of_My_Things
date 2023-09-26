require 'date'

class Item
 attr_accessor :label, :author, :genre, :date
 attr_reader :id, :archived
 # inside intialize only those items that need association
 def initialize(label, author, genre, publish_date)
    @label = label,
    @author = author,
    @genre = genre,
    @publish_date = Date.parse(publish_date),
    @id: Random.rand(1...1000),
    @archived = false
 end
 
 def can_be_archived?
   return true if Date.now - publish_date > ''
 end

 def move_to_archive

 end

end