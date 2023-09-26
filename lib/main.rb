def main
  loop 
   puts " 1- List all books"
    puts "2 - List all music albums"
    puts "3 - List all movies"
    puts "4 - List of games"
    puts "5 - List all genres (e.g 'Comedy', 'Thriller')"
    puts "6 - List all labels (e.g. 'Gift', 'New')"
    puts "7 - List all authors (e.g. 'Stephen King')"
    puts "8 - List all sources (e.g. 'From a friend', 'Online shop')"
    puts "9 -  Add a book"
    puts "10 - Add a music album"
    puts "11 - Add a movie"
    puts "12 - Add a game"
    puts "13 - Exit"
  end
  choice = gets.chomp.to_i 
when choice
    case 1
        #run a the list of books
    case 2

    case 3

    case 4

    case 5

    case 6

    case 7

    case 8

    case 9

    case 10

    case 11

    case 12

    case 13
        
    else  
        puts "Invalide choice"
    end
end

main()