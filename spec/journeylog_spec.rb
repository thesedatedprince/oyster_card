require 'journeylog'

describe JourneyLog do
  subject(:journeylog) {JourneyLog.new(journey)}
  let (:journey) {Journey.new(start_station)}
  let (:oystercard) {Oystercard.new}
  let (:start_station) {double :start_station}

  describe "#initialize" do
  #  it "initializes a new Journey Log" do
  #    journeylog = JourneyLog.new(journey)
  #    expect(journeylog.journey_class).to eq journey
  #  end
    it "New journey initialises with empty array" do
      expect(journeylog.journeys).to eq []
    end
  end

  describe 'record journey' do
  it "Expects the card to remember the station departed from" do
    #allow(oystercard).to receive(:balance)
  #  oystercard.instance_variable_set(:@balance, Journey::MINIMUM_CHARGE)
    expect(subject.store_journey).to_not be_nil
  end
  end

end
