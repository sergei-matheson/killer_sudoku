module KillerSudoku
  class Combinator
    DIGITS = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    def initialize(digits, result)
      @digits = digits
      @result = result
    end

    def call
      digit_set.permutations(@digits).map{|x| x.sort}.sort.uniq.select do |candidate|
        candidate.sum == @result
      end
    end

    private def digit_set
      DIGITS.select { |n| n <= max_digit }
    end

    private def max_digit
      (@digits > 1) ? @result : @result - 1
    end
  end
end
