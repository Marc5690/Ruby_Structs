require_relative 'user_command'
class Sort < UserCommand

def initialize (reader)
		super (reader)
		
	end

	def title 
		'Sort books in order of price'
	end

    def input
    end

    def execute
    @reader.Sort
	end


end 