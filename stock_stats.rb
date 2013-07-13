require_relative 'csv_reader_hash'
require_relative 'commands/total_value_command'
require_relative 'commands/search_command'
require_relative 'commands/number_of_copies_command'
require_relative 'commands/quit_command'
require_relative 'commands/empty'
require_relative 'commands/sale_discount'
require_relative 'commands/exists'
require_relative 'commands/exists_title'
require_relative 'commands/create_record'
require_relative 'commands/display'
require_relative 'commands/highest'
require_relative 'commands/lowest'
require_relative 'commands/sort'
require_relative 'commands/search_price_command'
require_relative 'commands/delete'
require_relative 'commands/delete_if'
require_relative 'commands/edit_record'

reader = CsvReaderHash.new
ARGV.each do |csv_file_name| 
	puts "Processing #{csv_file_name}" 
	reader.read_in_csv_data(csv_file_name)

end

# New commands must be represented in this array. Command positions 
# are not significant, except for 'Quit' - it should always be
# the last entry.
commands = [
	TotalValueCommand.new(reader),
	SearchCommand.new(reader),
	NumberOfCopiesCommand.new(reader),
	Empty.new(reader),
	Delete.new(reader),
	DeleteIf.new(reader),
	Exists.new(reader),
	ExistsTitle.new(reader),
	CreateRecord.new(reader),
	EditRecord.new(reader),
	SaleDiscount.new(reader),
	Display.new(reader),
	Highest.new(reader),
	Sort.new(reader),
	Lowest.new(reader),
	SearchPriceCommand.new(reader),
	QuitCommand.new
]	
last_command = commands.size() -1

quit = false
while !quit 

	commands.each_index do |index| 
		puts " #{index+1} #{commands[index].title}"

    end

    print "Which option? "  
	option = STDIN.gets.chomp.to_i
	option -= 1     # Adjust for array index 
	system("cls")   # Clear Screen (Windows only)
	puts "\e[H\e[2J"   # Clear screen (Unix/Mac only)


	if (0..last_command).member? option
	   commands[option].input
	   commands[option].execute
	   20.times { print '-'}
	   puts
	 else
	    puts 'Not a valid option.'
	 end 
	 quit = true if option == last_command


end
