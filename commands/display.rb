require_relative 'user_command'
class Display < UserCommand

def initialize (reader)
		super (reader)
	end

	def title 
		'Display all books'
	end

  def input
   end

    def execute
    @reader.display
	end


end 