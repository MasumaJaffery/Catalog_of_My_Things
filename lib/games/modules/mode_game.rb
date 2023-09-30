module GameMod
  def take_title
    print 'Title: '
    title = gets.chomp
    if title.empty?
      puts 'Title cannot be empty.'
      take_title
    else
      title
    end
  end

  def take_date(x_date)
    print "#{x_date} [YYYY-mm-dd] : "
    date = gets.chomp
    if data_format?(date)
      date
    else
      puts 'invalide input'
      take_date(x_date)
    end
  end

  def data_format?(string)
    # Try to parse the string as a date using Date.strptime and the format
    format = '%Y-%m-%d'
    Date.strptime(string, format)
    # If no exception is raised, return true
    true
  rescue ArgumentError
    # If an exception is raised, return false
    false
  end

  def take_multiplayer
    print 'Multiplier [Y/N] :'
    multiplayer = gets.chomp.downcase
    if %w[n y].include?(multiplayer)
      if multiplayer == 'y'
        1
      else
        0
      end
    else
      puts "Please clik Y for 'yes' or N for 'No'"
      take_multiplayer
    end
  end
end
