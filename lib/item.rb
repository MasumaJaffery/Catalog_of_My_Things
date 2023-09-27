require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent)
    @silent = silent
  end
end
