# Define the 'actions' hash
require_relative 'app'

ACTIONS = {
  1 => :list_books,
  2 => :list_music_albums,
  3 => :list_movies,
  4 => :list_games,
  5 => :list_genres,
  6 => :list_labels,
  7 => :list_authors,
  8 => :list_sources,
  9 => :add_book,
  10 => :add_music_album,
  11 => :add_movie,
  12 => :add_game,
  13 => :exit_application
}.freeze

def handle_option(option)
  action = ACTIONS[option]
  if action
    app.send(action)
  else
    puts 'Invalid option.'
  end
end

def display_menu
  puts 'Welcome to our Catalog App'

  loop do
    ACTIONS.each { |k, v| puts "#{k} - #{v.to_s.tr('_', ' ')}" }
    print 'Option: '
    choice = gets.chomp.to_i
    handle_option(choice)
  end
end

def exit_application
  puts 'exited'
  exit
end

def main
  display_menu
end

main
