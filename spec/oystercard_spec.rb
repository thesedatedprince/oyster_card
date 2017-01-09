require 'oystercard'

describe Oystercard do
  describe "#balance" do
    it "Checks that initial value = 0" do
      expect(subject.balance).to eq 0
    end
  end
end
