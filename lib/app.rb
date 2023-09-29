require_relative 'item'
require_relative 'movie'
require_relative 'source'
require_relative 'saveData'
require_relative 'genre'
require_relative 'musicalbum'
require_relative 'games/game'
require_relative 'games/author'
require_relative 'games/modules/mode_author'
require_relative 'games/modules/mode_game'
require_relative 'book'
require_relative 'label'

class App
  attr_reader :music_albums, :genres, :label

  include AuthorMod
  include GameMod
  attr_accessor :movies, :sources, :games, :authors, :books

  def initialize
    @movies = []
    @sources = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
    @books = []
    @labels = []
    @savedata = SaveData.new
    load_data
  end

  def load_data
    @savedata.load_data
    @movies = @savedata.movies
    @sources = @savedata.sources
    @music_albums = @savedata.music_albums
    @genres = @savedata.genres
    @games = @savedata.games
    @authors = @savedata.authors
    @books = @savedata.books
    @labels = @savedata.labels
  end

  def save_data
    @savedata.movies = @movies
    @savedata.sources = @sources
    @savedata.games = @games
    @savedata.authors = @authors
    @savedata.save_data
    @savedata.genres = @genres
    @savedata.books = @books
    @savedata.labels = @labels
    @savedata.save_data
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums available.'
    else
      @music_albums.each_with_index do |album, index|
        puts "#{index + 1}. #{album.label} by #{album.author.first_name} #{album.author.last_name}  (#{album.genre.name})"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'No genres available.'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
    end
  end

  def add_music_album
    puts 'Enter album label:'
    label = gets.chomp
    # puts 'Enter album author:'
    # author = gets.chomp

    puts 'Enter album genre:'
    genre_name = gets.chomp
    genre = @genres.find { |g| g.name == genre_name } || Genre.new(genre_name)
    @genres << genre unless @genres.include?(genre)
    puts 'Enter publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Available on Spotify? (y/n):'
    on_spotify = gets.chomp.downcase == 'y'

    album = MusicAlbum.new(label, nil, genre, publish_date, on_spotify)
    attribute_game_to_author(album)
    @music_albums << album
    genre.add_item(album)

    puts 'Album added successfully!'
    save_data
  end

  def list_movies
    puts 'Listing all movies:'
    if @movies.empty?
      puts 'No movies found.'
    else
      @movies.each do |movie|
        puts "Title: #{movie.label}"
        puts "Author: #{movie.author.first_name} #{movie.author.last_name}"
        puts "Genre: #{movie.genre}"
        puts "Publish Date: #{movie.publish_date}"
        puts "Silent: #{movie.silent}"
        puts "Archived: #{movie.archived}"
        puts '-' * 20
      end
    end
  end

  def list_sources
    puts 'Listing all sources:'
    if @sources.empty?
      puts 'No sources found.'
    else
      @sources.each do |source|
        puts "Source ID: #{source.id}"
        puts "Source Name: #{source.name}"
        puts 'Associated Items:'
        if source.items.empty?
          puts 'No items associated with this source.'
        else
          source.items.each do |item|
            puts "  - #{item.label}"
          end
        end
        puts '-' * 20
      end
    end
  end

  def add_movie
    puts 'Adding a movie:'
    print 'Title: '
    title = gets.chomp
    # print 'Author: '
    # author = gets.chomp
    print 'Genre: '
    genre = gets.chomp
    print 'Publish Date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Silent (true/false): '
    silent = gets.chomp.downcase == 'true'

    # Create a new Movie instance
    movie = Movie.new(title, genre, publish_date, silent, nil)
    @movies << movie
    attribute_game_to_author(movie)
    puts 'Movie added successfully.'
    save_data
  end

  def list_games
    if @games.empty?
      puts 'No game available. \n'
    else
      puts 'List of games : '
      puts '-' * 20
      @games.each_with_index do |game, i|
        puts "#{i + 1}. '#{game.title}' by '#{game.author.first_name} #{game.author.last_name}'"
      end
      puts '-' * 10
    end
  end

  def list_authors
    if @authors.empty?
      puts "No author available \n"
    else
      puts 'List og authors : '
      puts '-' * 20
      @authors.each_with_index { |author, i| puts "#{i + 1}. Full-name: '#{author.first_name} #{author.last_name}'" }
      puts '-' * 20
    end
  end

  def add_game
    title = take_title
    published_date = take_date('Published date')
    last_play = take_date('Last played at')
    multiplayer = take_multiplayer
    game = Game.new(multiplayer, last_play, published_date, title)
    @games.push(game)
    attribute_game_to_author(game)
    print "Game created \n"
    save_data
  end

  def list_books
    if @books.empty?
      puts "No Books available \n"
    else
      puts 'List of Books : '
      puts '-' * 20
      @books.each_with_index do |book, i|
        puts "#{i + 1}. Publisher: '#{book.publisher}'  Cover: '#{book.cover_state}'"
      end
      puts '-' * 20
    end
  end

  def list_labels
    if @labels.empty?
      puts "No Labels available \n"
    else
      puts 'List of Labels : '
      puts '-' * 20
      @labels.each_with_index { |label, i| puts "#{i + 1}. Title: '#{label.title}' Color: '#{label.color}'" }
      puts '-' * 20
    end
  end

  def add_book
    puts('Add a book, please enter the book information:')
    print('Publisher: ')
    publisher = gets.chomp.strip
    print('Cover State: ')
    cover_state = gets.chomp.strip
    print('Publish Date: ')
    publish_date = gets.chomp.strip
    print('Archived (true/false): ') # NOTE: I corrected the spelling of "archived"
    archived = gets.chomp.strip.downcase == 'true'

    # Create a new Book instance with the updated constructor arguments
    book = Book.new(publisher, cover_state, publish_date, archived)
    @books << book
    puts("Book added successfully: #{cover_state} - #{publisher}")
    save_data
  end

  def load_movies
    # Print the content of the JSON data before parsing
    json_data = File.read('movies.json')
    puts json_data

    # Now, try parsing the JSON data
    @movies = JSON.parse(json_data, object_class: OpenStruct)
  end
end
