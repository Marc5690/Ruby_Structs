require_relative 'user_command'
class Highest < UserCommand

def initialize (reader)
		super (reader)
		
	end

	def title 
		'Find the most expensive book'
	end

   def input
   	   puts 'Highest-priced book: '
	  # print "Y/N?"   
	   #@ans = STDIN.gets.chomp.to_f  
   end

    def execute
    @reader.highest
	end


end 