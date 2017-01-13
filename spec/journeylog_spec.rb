require 'journeylog'

describe JourneyLog do
  subject(:journeylog){described_class.new(journey)}
  let(:journey) {double :journey}
  let(:start_station) {double :start_station}
  #let(:current_journey)

  it 'should initialize with a journey_class parameter' do
    expect(journeylog.journey_class).to eq journey
  end

  describe '#start' do
    it{is_expected.to respond_to(:start)}

    it 'should start a new journey' do
      subject.start
      expect(journeylog.journey_started?).to eq true
    end

    it 'is expected to record an entry station' do
      allow(journey).to receive(:current_journey).and_return({entry_station: start_station})
      subject.start
      expect(journeylog.entry_station).to eq journey.current_journey[:entry_station]
    end

  end

end
