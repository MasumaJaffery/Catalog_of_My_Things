require_relative 'games/game'
require_relative 'games/author'
class App
    def initialize
        @games = []
        @authors = []
    end

    def list_of_games
       puts 'List of games : '
       @games.map { |game| puts "Title: '#{games.title}', Author: '#{game.author}'" }
    end

    def list_of_authors
        puts "List og authors : "
        @authors.map { |author| puts "First name: '#{author.first_name}', Last name: '#{game.last_name}'" }
    end

    def take_title
        print 'Title: '
        title = gets.chomp
        if title.empty?
          puts 'Title cannot be empty.'
          take_title
        else
          title
        end
    end

    def take_date
        print 'Published date [YYYY-mm-dd] : '
        date = gets.chomp
        if is_date_format?(date)
            date
        else
            puts "invalide input"
            take_date
        end
    end

    def is_date_format?(string)
        # Try to parse the string as a date using Date.strptime and the format
        format = "%Y/%m/%d"
        date = Date.strptime(string, format)
        # If no exception is raised, return true
        return true
      rescue ArgumentError
        # If an exception is raised, return false
        return false
    end

    def take_multiplayer
        puts "Multiplier [Y/N] :"
        multiplayer = gets.chomp.downcase
        if %w[n y].include?(multiplayer)
            multiplayer
        else
            puts "Please clik Y for 'yes' or N for 'No'"
            take_multiplayer
        end
    end

    def find_or_create_author
        first_name = take_name("Firt name")
        last_name = take_name("Last name")
        # return the existing author
        return @authors.find { |author| 
            author.first_name == first_name && author.last_name == last_name } if @authors.any? { |author| 
                author.first_name == first_name && author.last_name == last_name }
    
        # if not, create him/her
        author = Author.new(first_name, last_name)
        @authors.push(author)
        author
    end

    def take_name(x_name)
        print "#{x_ame}: "
        name = gets.chomp.strip
        if name.empty?
          puts 'Name cannot be empty'
          take_name
        else
            # returns a new string with the first character converted to uppercase 
            # and the remaining characters converted to lowercase
          name.capitalize
        end
      end

    def attribute_game_to_author(game)
        author = find_or_create_author
        author.add_item(game)
    end

    def add_game
        title = take_title
        published_date = take_date
        last_play = take_date
        multiplayer = take_multiplayer
        game =  Game.new(multiplayer,last_play,published_date,title)
        @games << game
        attribute_game_to_author(game)
    end

end

author = Author.new('jean', "mark")
game = Game.new(true,'2020-09-09','2019-09-09', "krug")
puts author
puts game
game.author = author
puts "author #{author.items}"
puts "game #{game.author}"