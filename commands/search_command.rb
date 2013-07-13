require_relative 'user_command'
class SearchCommand < UserCommand

	def initialize (reader)
		super (reader)
		@limit = 0
	end

	def title 
		'Search by price limit.'
	end

   def input
   	   puts 'Price limit search.'
	   print "Max price? "   
	   @limit = STDIN.gets.chomp.to_f  
   end

    def execute
       @reader.search(@limit).each {|b| puts b }
	end

end