require 'oystercard'

describe Oystercard do
  #let(:oystercard) {double :oystercard, :in_journey => false, in_journey?: false}
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

=begin
  describe "#deduct" do
    it "Deducts the fare amount from the balance" do
      subject.instance_variable_set(:@balance, 50)
      expect(subject.deduct(10)).to eq subject.balance
    end
    it "Raises an error when insufficient credit avaialable" do
      expect{subject.deduct(10)}.to raise_error "Insufficient credit available"
    end
  end
=end

  describe "#in_journey?" do
    it "Check a new card is not in use" do
      expect(subject.in_journey).to eq false
    end

    it "Check if a card is in use" do
      subject.instance_variable_set(:@in_journey, true)
      expect(subject.in_journey).to eq true
    end
  end

  describe "#touch_in" do
    it "Changes in_journey status to true when touching in" do
      subject.touch_in
      expect(subject.in_journey).to eq true
    end

    it "Raises an error if card is already in use" do
      subject.touch_in
      expect{subject.touch_in}.to raise_error "Card already in use"
    end
  end

  describe "#touch_out" do
    it "Changes in_journey status to false when touching out" do
      subject.top_up(50)
      subject.touch_in
      expect(subject.touch_out).to eq false
    end

    it "Raises an error if card is not in use" do
      expect{subject.touch_out}.to raise_error "Card not in use"
    end

    it "Deducts correct fare for the journey" do
      subject.top_up(50)
      subject.touch_in
      expect{subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_CHARGE)
    end
  end

end
