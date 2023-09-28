require 'json'

class SaveData
  attr_accessor :sources, :movies, :music_albums, :genres, :authors, :games

  def initialize
    @sources = []
    @movies = []
    @genres = []
    @music_albums = []
    @games = []
    @authors = []
  end

  # Load data from JSON files
  def load_data
    load_movies
    load_source
    load_genres
    load_music_albums
    load_games
    load_authors
  end

  # Save data to JSON files
  def save_data
    save_movies
    save_source
    save_genres
    save_music_albums
    save_games
    save_authors
    puts 'Data saved successfully.'
  rescue StandardError => e
    puts "Error saving data: #{e.message}"
  end

  def load_genres
    return unless File.exist?('./json/genres.json')

    json_str = File.read('./json/genres.json')
    @genres = JSON.parse(json_str).map do |genre_data|
      Genre.new(genre_data['name'])
    end
  end

  def save_genres
    File.open('./json/genres.json', 'w') do |file|
      file.puts @genres.map { |genre| { 'name' => genre.name } }.to_json
    end
  end

  def load_music_albums
    return unless File.exist?('./json/music_albums.json')

    json_str = File.read('./json/music_albums.json')
    @music_albums = JSON.parse(json_str).map do |album_data|
      genre = @genres.find { |g| g.name == album_data['genre'] }
      music_album = MusicAlbum.new(album_data['label'], nil , genre, album_data['publish_date'], album_data['on_spotify'])
      hash_author = album_data['author']
      music_album.author = Author.new(hash_author['first_name'], hash_author['last_name'])
      music_album
    end
  end

  # Save music albums
  def save_music_albums
    File.open('./json/music_albums.json', 'w') do |file|
      file.puts JSON.pretty_generate(@music_albums.map do |album|
        {
          'label' => album.label,
          'author' => object_to_hash(album.author),
          'genre' => album.genre.name, # Assume genre is not nil
          'publish_date' => album.publish_date.to_s, # Convert Date to string
          'on_spotify' => album.on_spotify
        }
      end)
    end
  end

  def load_movies
    return unless File.exist?('./json/movies.json')

    json_str = File.read('./json/movies.json')
    @movies = JSON.parse(json_str).map do |movie_data|
      movie = Movie.new(movie_data['label'], nil, movie_data['genre'], movie_data['publish_date'],
                movie_data['silent'])
      hash_author = movie_data['author']
      movie.author = Author.new(hash_author['first_name'], hash_author['last_name'])
      movie
    end
  end

  # Save movies
  def save_movies
    File.open('./json/movies.json', 'w') do |file|
      file.puts JSON.pretty_generate(@movies.map do |movie|
        {
          'label' => movie.label,
          'author' => object_to_hash(movie.author),
          'genre' => movie.genre,
          'publish_date' => movie.publish_date.to_s, # Convert Date to string before the next step
          'silent' => movie.silent
        }
      end)
    end
  end

  # Load sources
  def load_source
    return unless File.exist?('./json/sources.json')

    json_str = File.read('./json/sources.json')
    @sources = JSON.parse(json_str).map { |source_data| Source.new(source_data['id'], source_data['name']) }
  end

  # Save sources
  def save_source
    File.open('./json/sources.json', 'w') do |file|
      file.puts @sources.map { |source| { 'id' => source.id, 'name' => source.name } }.to_json
    end
  end

  def save_games
    File.open('./json/games.json', 'w') do |file|
      file.puts JSON.pretty_generate(@games.map do |game|
        {
          'title' => game.title,
          'publish_date' => game.publish_date.to_s,
          'last_played_at' => game.last_played_at.to_s, # Convert Date to string
          'multiplayer' => game.multiplayer,
          'author' => object_to_hash(game.author)
        }
      end)
    end
  end

  def save_authors
    File.open('./json/authors.json', 'w') do |file|
      file.puts JSON.pretty_generate(@authors.map do |author|
        {
          'first_name' => author.first_name,
          'last_name' => author.last_name,
          'items' => author.items
        }
      end)
    end
  end

  def load_games
    return unless File.exist?('./json/games.json')

    json_str = File.read('./json/games.json')
    @games = JSON.parse(json_str).map do |game_data|
      game = Game.new(game_data['multiplayer'], game_data['last_played_at'], game_data['publish_date'], game_data['title'])
      hash_author = game_data['author']
      game.author = Author.new(hash_author['first_name'], hash_author['last_name'])
      game
    end
  end

  def load_authors
    return unless File.exist?('./json/authors.json')

    json_str = File.read('./json/authors.json')
    @authors = JSON.parse(json_str).map do |author_data|
      author = Author.new(author_data['first_name'], author_data['last_name'])
      author.items = author_data['items']
      author
    end
  end

  def object_to_hash(object)
    hash = {}
    arr_of_class = %w[Game Author] # to store the class_name
    hash['class'] = object.class # store the class_name
    object.instance_variables.each do |var|
      name = var.to_s.delete('@') # take the name of instance variable without @
      value = object.instance_variable_get(var) # retrive the value of variable by it's name
      # if the value is an instance of Game or Author. so we transforme it into a hash to
      value = object_to_hash(value) if arr_of_class.include?(value.class.to_s)
      hash[name] = value
    end
    hash
  end
end
