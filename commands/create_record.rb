require_relative 'user_command'

class CreateRecord < UserCommand

	def initialize (reader)
		super (reader)
		@isbn = ''
	end

	def title 
		'Add a Book'
	end

   def input
		puts 'Please enter the relevant details.'
		
		print "ISBN? "   
		@isbn = STDIN.gets.chomp

        print "Price? "   
		@price = STDIN.gets.chomp 
        
        print "Title? "   
		@title = STDIN.gets.chomp
        
    end

    def execute
    	@reader.createRecord(@isbn, @price, @title)
    	 #puts "No. of copies = #{@reader.number_of_an_isbn(@isbn)}"
	end

end