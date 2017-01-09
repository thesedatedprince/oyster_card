require 'oystercard'

describe Oystercard do
  describe "#balance" do
    it "Checks that initial value = 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "Tops up the balance of an Oystercard" do
      expect(subject.top_up(50)).to eq 50
    end
  end
end
