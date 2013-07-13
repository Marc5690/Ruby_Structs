require_relative 'book_in_stock'

class CsvReaderHash
  attr_accessor :books_in_stock
  def initialize
    @books_catalogue = {}  
  end
  
  def read_in_csv_data(csv_file_name)
    #This function simply reads in data from a CSV file
      File.foreach(csv_file_name) do |line|
           content = line.chomp.split(",")
           book = BookInStock.new(content[0],content[2], content[1])
          if @books_catalogue [book.isbn]
             @books_catalogue[book.isbn][:quantity] += 1
          else 
             emptyStruct = Struct.new(:book, :quantity)# defining a struct
             filledStruct = emptyStruct.new(book)#Inserting data into a struct
             @books_catalogue[book.isbn] = filledStruct
             @books_catalogue[book.isbn][:quantity] = 1  
          end
      end
  end

  def total_value_in_stock
    #This function returns a sum of all book prices
     sum = 0
     @books_catalogue.each do |isbn, struct| sum += struct[:book].price 
     end 
     sum.round(2)
  end  
  
  def number_of_an_isbn(isbn)
    #This function returns the quantity of a book, for which
    #the user enters the ISBN of
     if @books_catalogue[isbn]#[:quantity]
      @books_catalogue[isbn][:quantity] 
    else
      puts "This book does not exist!"
      0
    end
  end

  def search(limit)
    #This function returns all book under a price
    #that is specified by the user
     matches = @books_catalogue.select {|isbn,struct| struct[:book].price < limit}
     matches.values
  end

  def searchPrice(limit)
    #This function tells the user whether a book
    #at a specfic price exists
      if @books_catalogue.any?{|isbn, struct|  struct[:book].price == limit}
      puts "There is a book at that price."
    else
      puts "There are no books at that price"
    end
  end

  def itExists(isbn)
    #This function tells the user whether a book
    #with a specific ISBN exists
     if @books_catalogue.has_key?(isbn)
      puts "This book (#{isbn}) is in the database"
      return true
     else
      puts "The book (#{isbn}) is NOT in the database "
      return false
     end
  end
 
  def existsTitle(title)
    #This function checks to see if a book exists
    #in the database, based on its title
    cat = @books_catalogue.collect {|isbn, struct| struct[:book].title == title}
    if cat.include?(true)
     puts "This book '#{title}' exists in the database" 
    else
     puts "The book '#{title}' is NOT in the database "
    end
  end

  def highest
    #This function returns the most expensive book
     puts @books_catalogue.max_by {|isbn, struct| struct[:book].price}
  end

  def Sort
    #This function sorts the books based on price
    puts @books_catalogue.sort_by{ |isbn, struct| struct[:book].price }
  end

  def lowest
    #This function returns the least expensive book
     puts @books_catalogue.min_by { |isbn, struct| struct[:book].price}
  end

  def deleteall
    #This function deletes all book from the database
     @books_catalogue.clear
  end

  def deleteif(price)
    #This function deletes all books over a certain price
    @books_catalogue.keep_if{|key, struct| struct[:book].price >= price.to_f}
  end

  def delete(isbn)
    #This function deletes a book based on its ISBN
    if @books_catalogue.has_key?(isbn)
       @books_catalogue[isbn][:quantity] = @books_catalogue[isbn][:quantity] - 1
       if @books_catalogue[isbn][:quantity] == 0
        @books_catalogue.delete(isbn){|key| "#{key} not found!" }
      else
      end
    else
      puts "Key not found!"    
  end
  end

  def discount(reduction)
    #This function reduces the price of all books by an
    #amount specified by the user
     @books_catalogue.each do |isbn, struct|   
       percentage = reduction/100 * struct[:book].price ; 
       struct[:book].price = struct[:book].price - percentage 
     end
  end

  def createRecord(isbn, price, title)
    #This function is used to both create and edit books.
    #The edit function is passed through the itExists method first,
    #so it always skips the else statement, ensuring that the editing 
    #function does not result in a book being created, as this would be
    #an incorrect use of the function
   if @books_catalogue[isbn]
      @books_catalogue[isbn][:quantity] += 1
      @books_catalogue[isbn][:book].price = price
      @books_catalogue[isbn][:book].title = title
      puts "The book (#{isbn}) has been updated"
   
   else
      @books_catalogue2 = {}
      book = BookInStock.new(isbn, price, title)
             emptyStruct = Struct.new(:book, :quantity)# defining a struct
             filledStruct = emptyStruct.new(book)#Inserting data into a struct
             @books_catalogue2[isbn] = filledStruct
             @books_catalogue2[isbn][:quantity] = 1 
             @books_catalogue =  @books_catalogue2.merge(@books_catalogue) {|key, oldval, newval| newval = oldval, [book.isbn][:quantity] += 1}
   end
  end
   
  def display
  #This function displays the contents of the database
  #in a more readable manner
 @euro = [8364].pack("U")
     @books_catalogue.each do |isbn, struct| 
     print "ISBN: " ; 
     print struct[:book].isbn ; 
     print " Title: " ; 
     print struct[:book].title.chomp ; 
     print " Price: #{@euro}" ; 
     puts struct[:book].price;#.round(2) ; 
     print " Quantity: " ; 
     puts struct[:quantity] 
     end  
  end

end