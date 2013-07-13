require_relative 'user_command'
class SearchPriceCommand < UserCommand

	def initialize (reader)
		super (reader)
		@limit = 0
	end

	def title 
		'Search for books by price'
	end

   def input
   	   puts 'Price search.'
	   print "Which price do you want to search for? "   
	   @limit = STDIN.gets.chomp.to_f  
   end

    def execute
       @reader.searchPrice(@limit)
	end

end