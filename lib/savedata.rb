require 'json'

class SaveData
  attr_accessor :sources, :movies

  def initialize
    @sources = []
    @movies = []
  end

  # Load data from JSON files
  def load_data
    load_movies
    load_source
  end

  # Save data to JSON files
  def save_data
    save_movies
    save_source
    puts 'Data saved successfully.'
  rescue StandardError => e
    puts "Error saving data: #{e.message}"
  end

  def load_movies
    return unless File.exist?('./json/movies.json')

    json_str = File.read('./json/movies.json')
    @movies = JSON.parse(json_str).map do |movie_data|
      Movie.new(movie_data['label'], movie_data['author'], movie_data['genre'], movie_data['publish_date'],
                movie_data['silent'])
    end
  end

  # Save movies
  def save_movies
    File.open('./json/movies.json', 'w') do |file|
      file.puts JSON.pretty_generate(@movies.map do |movie|
        {
          'label' => movie.label,
          'author' => movie.author,
          'genre' => movie.genre,
          'publish_date' => movie.publish_date.to_s,
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
end
