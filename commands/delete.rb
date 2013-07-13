require_relative 'user_command'
class Delete < UserCommand

def initialize (reader)
		super (reader)
	end

	def title 
		'Delete a book by ISBN'
	end

   def input
	   print "ISBN of book you want to delete ?"   
	   @isbn = STDIN.gets.chomp.to_s 
   end

    def execute
      @reader.delete(@isbn)
    end
end 