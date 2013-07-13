require_relative 'user_command'
class ExistsTitle < UserCommand

def initialize (reader)
		super (reader)
	end

	def title 
	   'Check if a book is in by its title'
	end

    def input
   	   puts 'What is the books Title?'
	   @title = STDIN.gets.chomp.to_s
    end

    def execute
       @reader.existsTitle(@title)#.each {|b| puts b }
   	end
end 