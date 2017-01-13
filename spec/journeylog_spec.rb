require 'journeylog'

describe JourneyLog do
  subject(:journeylog){described_class.new(journey_class)}
  let(:journey_class) {double :journey,new: journey}
  let(:journey) {double :journey,complete?: true, current_journey: {},start_journey: nil}
  let(:start_station) {double :start_station}
  #let(:current_journey)
  describe "#creation " do
    it 'should have journey_class parameter' do
      expect(journeylog.active_journey).to eq journey
    end
    xit 'should not have a journey started' do
      expect(journeylog.journey_started?).to eq false
    end
  end

  describe '#start ' do
    it{is_expected.to respond_to(:start).with(1)}

    it 'should start a new journey' do
      subject.start start_station
      expect(journey).to have_received(:start_journey).with(start_station)
    end

    xit 'is expected to record an entry station' do
      allow(journey).to receive(:current_journey).and_return({entry_station: start_station})
      subject.start
      expect(journeylog.entry_station).to eq journey.current_journey[:entry_station]
    end
  end

  describe '#finish ' do
    it  'should add an exit station to current_journey'
  end

  describe '#current_journey ' do
    it{is_expected.to respond_to :current_journey}
    it 'should return a current journey if one exists '
    it 'should create a new journey if current journey is complete '
  end

  describe '#journeys ' do
    it 'should return an empty array if no journeys have happened' do
      expect(subject.journeys.size).to eq 0
    end
    xit 'should return a list of all previous journeys without exposing the internal array' do
    end
  end
end
