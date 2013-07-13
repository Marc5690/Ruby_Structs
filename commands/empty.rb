require_relative 'user_command'
class Empty < UserCommand

    def initialize (reader)
		super (reader)
	end

	def title 
		'Delete all books'
	end

   def input
	   print "Delete all books(Y/N) ?"   
	   @ans = STDIN.gets.chomp.to_s 
   end

    def execute
      if @ans == "Y"
      @reader.deleteall
      else
	  puts "Returning to main menu"
	  end
    end
end 