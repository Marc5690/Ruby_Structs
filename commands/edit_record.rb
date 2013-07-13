require_relative 'user_command'

class EditRecord < UserCommand

	def initialize (reader)
		super (reader)
		@isbn = ''
	end

	def title 
		'Edit a Book'
	end

   def input
		puts 'Please enter the relevant details.'
		
		print "The books ISBN? "   
		@isbn = STDIN.gets.chomp

        print "The new Price? "   
		@price = STDIN.gets.chomp 
        
        print "The new Title? "   
		@title = STDIN.gets.chomp
        
    end

    def execute

    	if @reader.itExists(@isbn)
    		@reader.createRecord(@isbn,@price,@title)
   		#else 
   		
   		end

    	#@reader.createRecord(@title, @price, (@reader.itExists(@isbn)))
    	 # @reader.itExists(@reader.editRecord(@isbn, @title, @price))
    	 
    	 #  @reader.editRecord(@isbn, @title, @price)
    	  # puts "Works!"
    	#else7
    	#	puts "This book does not exist!"
    	#end
    	#@reader.EditRecord(@isbn, @title, @price)
	end
end