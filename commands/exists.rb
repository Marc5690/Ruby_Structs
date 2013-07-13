require_relative 'user_command'
class Exists < UserCommand

def initialize (reader)
		super (reader)
	end

	def title 
	   'Check if a book is in by its ISBN'
	end

    def input
   	   puts 'What is the books ISBN?'
	   @isbn = STDIN.gets.chomp#.to_f  
    end

    def execute
       @reader.itExists(@isbn)#.each {|b| puts b }
   	end
end 