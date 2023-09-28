require_relative '../book'
require_relative '../label'

class App
  def initialize
    @books = []
    @labels = []
  end

  def list_books
    puts('Book Listing:')
    if @books.empty?
      puts('There are no books yet!')
    else
      @books.each do |book|
        puts("Book Publisher: #{book.publisher}")
        puts("Book Cover: #{book.cover_state}")
      end
    end
    # sllep 3 pause execution 3 seconds before continue the next instructions.
    sleep 3
  end

  def list_labels
    puts('Label Listing:')
    if @labels.empty?
      puts('There are no labels yet!')
    else
      @labels.each do |label|
        puts("Label Title: #{label.title}")
        puts("Label Color: #{label.color}")
      end
    end
    sleep 3
  end

  def add_book
    puts('Add a book, please enter the book information:')
    print('Publisher: ')
    publisher = gets.chomp.strip
    print('Cover State: ')
    cover_state = gets.chomp.strip
    print('Publish Date: ')
    publish_date = gets.chomp.strip

    book = Book.new(publisher, cover_state, publish_date)
    @books.push(book)
    puts("Book created successfully: #{cover_state} - #{publisher}")
    sleep 3
  end
end
