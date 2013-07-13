require_relative 'user_command'
class SaleDiscount < UserCommand

def initialize (reader)
		super (reader)
		@reduction = 0
	end

	def title 
		'Price Discount'
	end

   def input
   	   puts 'Price Discount.'
	   print "Reduce prices by what percentage? "   
	   @reduction = STDIN.gets.chomp.to_f  
   end

    def execute
       @reader.discount(@reduction)#.each {|b| puts b }
       @reader.display
	end


end 