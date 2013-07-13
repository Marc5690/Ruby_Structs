require_relative 'user_command'
class DeleteIf < UserCommand

def initialize (reader)
		super (reader)
	end

	def title 
		'Delete all books under a price'
	end

   def input
	   print "Books below what price will be deleted?"   
	   @price = STDIN.gets.chomp.to_s 
   end

    def execute
      @reader.deleteif(@price)
    end
end 