module KillerSudoku
  class Combinator
    DIGITS = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    def initialize(number_of_digits, total)
      @number_of_digits = number_of_digits
      @total = total
    end

    def call
      digit_set.permutations(@number_of_digits).map { |x| x.sort }.sort.uniq.select do |candidate|
        candidate.sum == @total
      end
    end

    private def digit_set
      DIGITS.select { |n| n <= max_digit }
    end

    private def max_digit
      (@number_of_digits > 1) ? @total : @total - 1
    end
  end
end
