require_relative 'book_in_stock'

class CsvReader
  def initialize
    @books_in_stock = []
  end
  
  def read_in_csv_data(csv_file_name)
    File.foreach(csv_file_name) do |line|
           content = line.chomp.split(",")
           book = BookInStock.new(content[0],content[2], content[1])
           @books_in_stock << book

    end
  end  
  
  def total_value_in_stock 
    sum = 0.0        
    @books_in_stock.each {|book| sum += book.price}
    sum
  end  
  
  def number_of_an_isbn(isbn)
    @books_in_stock.count {|item| item.isbn == isbn  }
  end

  def search(limit)
     @books_in_stock.select {|item| item.price < limit}
  end
end 