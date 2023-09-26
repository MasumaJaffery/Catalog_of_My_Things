def main
  puts 'Welcome to our Catalog App'
  loop
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
choice = gets.chomp.to_i
case choice
when 1
# run a the list of books
when 2
# run a the list of music albums
when 3
# run a the list of movies
when 4
# run a the list of games
when 5
# run a the list of genres
when 6
# run a the list of labels
when 7
# run a the list of authors
when 8
# run a the list of sources
when 9
# Add a book
when 10
# Add a music album
when 11
# Add a movie
when 12
# Add a game
when 13
# Exit
else
  puts 'Invalid choice'
end

main
