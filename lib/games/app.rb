require_relative 'games/game'
require_relative 'games/author'
class App
  def initialize
    @games = []
    @authors = []
  end

  def list_games
    if @games.empty?
      puts 'No game available. \n'
    else
      puts 'List of games : '
      @games.each { |game| puts "Title: '#{game.title}', Author: '#{game.author.first_name}'" }
    end
  end

  def list_authors
    if @authors.empty?
      puts "No author available \n"
    else
      puts 'List og authors : '
      @authors.map { |author| puts "First name: '#{author.first_name}', Last name: '#{game.last_name}'" }
    end
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

  def take_date(x_date)
    print "#{x_date} [YYYY-mm-dd] : "
    date = gets.chomp
    if data_format?(date)
      date
    else
      puts 'invalide input'
      take_date(x_date)
    end
  end

  def data_format?(string)
    # Try to parse the string as a date using Date.strptime and the format
    format = '%Y-%m-%d'
    Date.strptime(string, format)
    # If no exception is raised, return true
    true
  rescue ArgumentError
    # If an exception is raised, return false
    false
  end

  def take_multiplayer
    print 'Multiplier [Y/N] :'
    multiplayer = gets.chomp.downcase
    if %w[n y].include?(multiplayer)
      multiplayer
    else
      puts "Please clik Y for 'yes' or N for 'No'"
      take_multiplayer
    end
  end

  def find_or_create_author
    puts "Author's infos : "
    first_name = take_name("Author's first name")
    last_name = take_name("Authorr's last name")
    # return the existing author
    if @authors.any? do |author|
         author.first_name == first_name && author.last_name == last_name
       end
      return @authors.find do |author|
               author.first_name == first_name && author.last_name == last_name
             end
    end

    # if not, create him/her
    author = Author.new(first_name, last_name)
    @authors.push(author)
    author
  end

  def take_name(x_name)
    print "#{x_name}: "
    name = gets.chomp.strip
    if name.empty?
      puts 'Name cannot be empty'
      take_name(x_name)
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
    published_date = take_date('Published date')
    last_play = take_date('Last played at')
    multiplayer = take_multiplayer
    game = Game.new(multiplayer, last_play, published_date, title)
    @games.push(game)
    attribute_game_to_author(game)
  end
end
