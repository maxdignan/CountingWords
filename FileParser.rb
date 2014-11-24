class FileParser
	attr_accessor :file, :wordCounter

	def initialize(file)
		@file = file
		@wordCounter = Hash.new(0)
		parse_file
		# print_histogram
	end

	def parse_file	
		File.foreach(file) do |line| 
			if line.strip != ""
				line.scan(/\w+/).each do |word| 
					wordCounter[word] += 1 
				end
			end
		end
	end

	def print_histogram
		@wordCounter = wordCounter.sort_by {|word,count| count}
		wordCounter.reverse!
		wordCounter.each do |word, count|
			puts "#{count} - #{word}"
		end
	end
end

file_parser = FileParser.new("speech.txt")
file_parser.print_histogram
