require_relative 'user_command'

class NumberOfCopiesCommand < UserCommand

	def initialize (reader)
		super (reader)
		@isbn = ''
	end

	def title 
		'Check no. of copies in stock'
	end

   def input
		puts 'Find the number book copies.'
		print "ISBN? "   
		@isbn = STDIN.gets.chomp  
   end

    def execute
    	 puts "No. of copies = #{@reader.number_of_an_isbn(@isbn)}"
	end

end