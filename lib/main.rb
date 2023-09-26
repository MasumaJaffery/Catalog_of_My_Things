class Main
  def initialize
    @choice = 0
  end

  def display_menu
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List of games'
    puts "5 - List all genres (e.g 'Comedy', 'Thriller')"
    puts "6 - List all labels (e.g. 'Gift', 'New')"
    puts "7 - List all authors (e.g. 'Stephen King')"
    puts "8 - List all sources (e.g. 'From a friend', 'Online shop')"
    puts '9 -  Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Exit'
  end

  def getchoice
    @choice = gets.chomp.to_i
  end

  def handle_choice
    case @choice
    when 1 then list_books
    when 2 then list_music_albums
    when 3 then list_movies
    when 4 then list_games
    when 5 then list_genres
    when 6 then list_labels
    when 7 then list_authors
    when 8 then list_sources
    when 9 then add_book
    when 10 then add_music_album
    when 11 then add_movie
    when 12 then add_game
    when 13 then return false # Exit the loop when the user chooses 13
    else
      puts 'Invalid choice'
    end
    true
  end

  def list_books; end

  def list_music_albums; end

  def list_movies; end

  def list_games; end

  def list_genres; end

  def list_labels; end

  def list_authors; end

  def list_sources; end

  def add_book; end

  def add_music_album; end

  def add_movie; end

  def add_game; end

  def run
    loop do
      display_menu
      getchoice
      break unless handle_choice
    end
  end
end

app = Main.new
app.run
