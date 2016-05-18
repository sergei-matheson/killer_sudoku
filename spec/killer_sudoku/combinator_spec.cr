require "../spec_helper"


describe KillerSudoku::Combinator do
  subject { KillerSudoku::Combinator.new(digits, result) }
  let(combinations) { subject.call }

  context "given a required result of 4 and 2 digits required" do
    let(digits) { 2 }
    let(result) { 4 }
    describe "the resulting combinations" do
      it "is 1 and 3" do
        expect(combinations).to eq [[1,3]]
      end
    end
  end
  context "given a required result of 16 and 3 digits required" do
    let(:digits) { 3 }
    let(:result) { 16 }
    describe "the resulting combinations" do
      it "are correct" do
        expect(combinations).to eq [
          [1, 6, 9], [1, 7, 8], [2, 5, 9], [2, 6, 8],
          [3, 4, 9], [3, 5, 8], [3, 6, 7], [4, 5, 7]
        ]
      end
    end
  end
end
