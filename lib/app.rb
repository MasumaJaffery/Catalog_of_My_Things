require_relative 'item'
require_relative 'movie'
require_relative 'source'
require_relative 'saveData'

class App
  attr_accessor :movies, :sources

  def initialize
    @movies = []
    @sources = []
    @savedata = SaveData.new
    load_data
  end

  def load_data
    @savedata.load_data
    @movies = @savedata.movies
    @sources = @savedata.sources
  end

  def save_data
    @savedata.movies = @movies
    @savedata.sources = @sources
    @savedata.save_data
  end

  def list_movies
    puts 'Listing all movies:'
    if @movies.empty?
      puts 'No movies found.'
    else
      @movies.each do |movie|
        puts "Title: #{movie.label}"
        puts "Author: #{movie.author}"
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
    print 'Author: '
    author = gets.chomp
    print 'Genre: '
    genre = gets.chomp
    print 'Publish Date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Silent (true/false): '
    silent = gets.chomp.downcase == 'true'

    # Create a new Movie instance
    movie = Movie.new(title, author, genre, publish_date, silent)
    @movies << movie
    puts 'Movie added successfully.'
    save_data
  end
end
