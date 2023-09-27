require_relative '../item'

class Game < Item
    attr_accessor :multiplayer, :last_played_at
    def initialize(multiplayer, last_played_at)
        @multiplayer = multiplayer
        @last_played_at = Date.parse(last_played_at)
    end 

    def can_be_archived?
        
        puts Date.today.prev_year(2)
        puts @last_played_at
        puts @last_played_at < Date.today.prev_year(2)
        puts("restonce is #")
    end
end

gamw = Game.new(true, '2021-02-01')
puts "eel"

puts(gamw.can_be_archived?)