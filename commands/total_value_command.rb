require_relative 'user_command'
class TotalValueCommand < UserCommand

	def initialize (reader)
		super (reader)
	end

	def title 
		'Show total stock value'
	end

   def input
   end

    def execute
        puts "Stock value = #{@reader.total_value_in_stock}"
	end

end