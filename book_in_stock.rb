
class BookInStock      
  
  attr_reader :isbn, :price, :title
  attr_accessor :price, :title

  def initialize(isbn, price, title)
    @isbn  = isbn
    @title = title
    @price = Float(price)
    
  end  
  def to_s
	"#{@isbn} ; #{@title} ; #{@price}"
  end
end
