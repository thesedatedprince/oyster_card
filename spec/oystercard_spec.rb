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

    it "Refuse topup if limit will be exceeded" do
      error = "Deposit would exceed max limit of #{Oystercard::DEFAULT_LIMIT}"
      deposit = Oystercard::DEFAULT_LIMIT + 1
      expect{subject.top_up(deposit)}.to raise_error error
    end
  end

  describe "#limit" do
    it "Checks card limit is £90" do
      expect(subject.limit).to eq 90
    end
  end

  describe "#deduct" do
    it "Deducts the fare amount from the balance" do
      subject.instance_variable_set(:@balance, 50)
      expect(subject.deduct(10)).to eq subject.balance
    end
    it "Raises an error when insufficient credit avaialable" do
      expect{subject.deduct(10)}.to raise_error "Insufficient credit available"
    end
  end

end
