require_relative 'game'
require_relative 'author'
require_relative 'modules/mode_author'
require_relative 'modules/mode_game'

require 'json'
require 'fileutils'
class App
  include AuthorMod
  include GameMod
  def initialize
    @games = read_data('games.json')
    @authors = read_data('authors.json')
  end

  def list_games
    if @games.empty?
      puts 'No game available. \n'
    else
      puts 'List of games : '
      @games.each { |game| 
        puts "Title: '#{game.title}', Author: '#{game.author.first_name} #{game.author.last_name}'" }
    end
  end

  def list_authors
    if @authors.empty?
      puts "No author available \n"
    else
      puts 'List og authors : '
      @authors.map { |author| puts "First name: '#{author.first_name}', Last name: '#{author.last_name}'" }
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

  def write_data
    data = { games: @games, authors: @authors }
    data.each do |key, arr|
      arr = arr.select { |obj| !obj.nil? || arr.empty? } # take it if it's not empty or nil arrays
      arr = arr.map { |obj| object_to_hash(obj) } # Convert each object to a hash
      file_name = "#{key}.json" # the name of our futur json file
      json = JSON.generate(arr) # Generate a JSON string fron the arr of hashes
      FileUtils.mkdir_p('../json') # create a json file if it's not exist
      File.open("../json/#{file_name}", 'w') do |f|
        f.puts(json)
      end
      puts "The array #{key} has been written to #{file_name}"
    end
  end

  def read_data(file_name)
    if Dir.exist?('../json')
      if File.exist?("../json/#{file_name}")
        json = File.read("../json/#{file_name}")
        arr_of_hashes = JSON.parse(json) # Convert JSON string into an array of hashes

        arr = []
        arr_of_hashes.each do |hash|
          real_class = Kernel.const_get(hash['class']) # allows to get the class by it's name
          object = real_class.json_create(hash) # create methode from the hash
          arr.push(object) # we get an array of objects
        end
        arr
      else
        [] # return an empty array if the file doesn't exist
      end
    else
      [] # return an empty array if the folder doesn't exist
    end
  end

  def exit_application
    write_data
    puts 'exited'
    exit
  end
end
