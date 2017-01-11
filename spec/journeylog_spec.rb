require 'journeylog'

describe JourneyLog do
  subject(:journeylog) {JourneyLog.new(start_station)}
  let (:journey) {Journey.new(start_station)}
  let (:oystercard) {Oystercard.new}
  let (:start_station) {double :start_station}
  let (:finish_station) {double :finish_station}

  describe "#initialize" do
    it "New journey initialises with empty array" do
      expect(journeylog.journeys).to eq []
    end
  end

  describe 'record journey' do
    it "Expects the card to remember the station departed from" do
      expect(subject.store_journey).to_not be_nil
    end
  end

  describe 'journey state' do
    it 'returns current jounrey' do
      expect(subject.journey_status).to eq [start_station, nil]
    end
  end

  describe 'journey state' do
    it 'returns finished jounrey' do
      subject.record_exit(finish_station)
      expect(subject.journey_status).to eq [start_station, finish_station]
    end
  end
end
