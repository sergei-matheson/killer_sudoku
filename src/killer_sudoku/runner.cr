module KillerSudoku
  class Runner
    def self.call
      new.call
    end

    def call
      puts "Total: #{total}"
      puts "Number of digits: #{number_of_digits}"
      print "Searching combinations..."
      if combinations.empty?
        puts "nothing found!"
      else
        puts "found #{combinations.size}"
        combinations.each do |combination|
          puts combination
        end
      end
    rescue e
      usage(e.message)
    end

    @combinations : Array(Array(Int32))?

    private def combinations
      @combinations ||= Combinator.new(
        number_of_digits, total
      ).call
    end

    private def total
      ARGV[0].to_i
    end

    private def number_of_digits
      ARGV[1].to_i
    end

    private def usage(message)
      puts message
      puts "Usage: #{PROGRAM_NAME} <total> <number-of-digits>"
    end
  end
end
