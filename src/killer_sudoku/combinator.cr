module KillerSudoku
  class Combinator
    DIGITS = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    @number_of_digits : Int32
    @total : Int32
    @results : Array(Array(Int32))?
    @candidates : Array(Array(Int32))?
    private getter number_of_digits, total

    def initialize(number_of_digits, total)
      @number_of_digits = number_of_digits
      @total = total
    end

    def call : Array(Array(Int32))
      @results ||= candidates.select do |candidate|
        candidate.sum == @total
      end
    end

    def candidates
      @candidates ||= permutations.map { |x| x.sort }.sort.uniq
    end

    private def digit_set
      DIGITS.select { |n| n <= max_digit }
    end

    private def permutations
      if @number_of_digits >= DIGITS.last
        [DIGITS]
      else
        digit_set.permutations(number_of_digits)
      end
    end

    private def max_digit
      (number_of_digits > 1) ? total - 1 : total
    end
  end
end
