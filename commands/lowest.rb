require_relative 'user_command'
class Lowest < UserCommand

def initialize (reader)
		super (reader)
	end

	def title 
		'Find the cheapest book'
	end

   def input
   	   puts 'Lowest-priced book: '  
   end

    def execute
    @reader.lowest
	end


end 