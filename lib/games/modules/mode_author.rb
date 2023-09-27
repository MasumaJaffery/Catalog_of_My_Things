module AuthorMod
    def find_or_create_author
        puts "Author's infos : "
        first_name = take_name("Author's first name")
        last_name = take_name("Authorr's last name")
        # return the existing author
        if @authors.any? do |author|
             author.first_name == first_name && author.last_name == last_name
           end
          return @authors.find do |author|
                   author.first_name == first_name && author.last_name == last_name
                 end
        end
    
        # if not, create him/her
        author = Author.new(first_name, last_name)
        @authors.push(author)
        author
    end

    def take_name(x_name)
        print "#{x_name}: "
        name = gets.chomp.strip
        if name.empty?
          puts 'Name cannot be empty'
          take_name(x_name)
        else
          # returns a new string with the first character converted to uppercase
          # and the remaining characters converted to lowercase
          name.capitalize
        end
    end

    def attribute_game_to_author(game)
        author = find_or_create_author
        author.add_item(game)
    end
end