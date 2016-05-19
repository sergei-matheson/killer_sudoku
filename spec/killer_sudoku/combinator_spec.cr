require "../spec_helper"

describe KillerSudoku::Combinator do
  subject { KillerSudoku::Combinator.new(number_of_digits, total) }

  let(result) { subject.call }

  context "given a required total of 4 and 2 digits required" do
    let(number_of_digits) { 2 }
    let(total) { 4 }
    describe "the resulting combinations" do
      it "is 1 and 3" do
        expect(result).to eq [[1, 3]]
      end
    end
  end
  context "given a required total of 16 and 3 digits required" do
    let(number_of_digits) { 3 }
    let(total) { 16 }
    describe "the resulting combinations" do
      it "are correct" do
        expect(result).to eq [
          [1, 6, 9], [1, 7, 8], [2, 5, 9], [2, 6, 8],
          [3, 4, 9], [3, 5, 8], [3, 6, 7], [4, 5, 7],
        ]
      end
    end
  end
  context "given a required total of 46 and 9 digits required" do
    let(number_of_digits) { 9 }
    let(total) { 45 }
    describe "the resulting combinations" do
      it "are correct" do
        expect(result).to eq [
          [1, 2, 3, 4, 5, 6, 7, 8, 9],
        ]
      end
    end
  end
end
