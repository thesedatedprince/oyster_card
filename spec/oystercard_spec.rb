require 'oystercard'

describe Oystercard do
  subject(:oystercard) {Oystercard.new(50)}
  let(:entry_station) { double :station, name: "station1", zone: 1}
  let(:exit_station) { double :station, name: "station2", zone: 1 }
  let(:journey) { {from: entry_station, to: exit_station} }

  describe "#initialize" do
    it "Checks that balance initializes value = 0" do
      expect(Oystercard.new.balance).to eq 0
    end
    it "Checks card limit initializes to £90" do
      expect(subject.limit).to eq 90
    end
  end

  describe "#top_up" do
    it "Tops up the balance of an Oystercard" do
      expect(subject.top_up(10)).to eq 60
    end

    it "Refuse topup if limit will be exceeded" do
      error = "Deposit would exceed max limit of #{Oystercard::DEFAULT_LIMIT}"
      deposit = Oystercard::DEFAULT_LIMIT + 1
      expect{subject.top_up(deposit)}.to raise_error error
    end
  end

  describe "#touch_in(entry_station)" do
    it "Check if a card is in use" do

      temp_station = Station.new("Temp Station",1)
      subject.touch_in(temp_station)
      expect{subject.touch_in(temp_station)}.to raise_error "Card already in use"
    end

    it "Changes in_journey status to true when touching in" do
      subject.instance_variable_set(:@balance, Journey::MINIMUM_CHARGE)
      expect(subject.touch_in(entry_station)).to_not eq nil
    end

    it "Raises an error if card is already in use" do
      subject.instance_variable_set(:@balance, Journey::MINIMUM_CHARGE)
      subject.touch_in(entry_station)
      expect{subject.touch_in(entry_station)}.to raise_error "Card already in use"
    end


    it "Doesn't allow access when there is not enough credit" do
      subject.instance_variable_set(:@balance, 0)
      expect{subject.touch_in(entry_station)}.to raise_error "Not enough credit"
    end
  end

  describe "#touch_out(exit_station)" do
    it "Changes injourney status to false when touching out" do
      subject.instance_variable_set(:@balance, 0)
      subject.top_up(50)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.injourney).to eq false
    end

    it "Raises an error if card is not in use" do
      subject.instance_variable_set(:@balance, 0)
      subject.top_up(50)
      expect{subject.touch_out(exit_station)}.to raise_error "Card not in use"
    end

    it "Deducts correct fare for the journey" do
      subject.instance_variable_set(:@balance, 0)
      subject.top_up(50)
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-Journey::MINIMUM_CHARGE)
    end
  end

end
