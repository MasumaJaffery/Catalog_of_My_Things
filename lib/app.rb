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

class App
  attr_reader :music_albums, :genres

  include AuthorMod
  include GameMod
  attr_accessor :movies, :sources, :games, :authors

  def initialize
    @movies = []
    @sources = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
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
  end

  def save_data
    @savedata.movies = @movies
    @savedata.sources = @sources
    @savedata.games = @games
    @savedata.authors = @authors
    @savedata.save_data
    @savedata.genres = @genres
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
    movie = Movie.new(title, nil, genre, publish_date, silent)
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
      puts '-' * 20
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
end
