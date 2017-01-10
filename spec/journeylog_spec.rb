require 'journeylog'

describe JourneyLog do
  let (:journey) {double :journey}
  describe "#initialize" do
    it "initializes a new Journey Log" do
      journeylog = JourneyLog.new(journey)
      expect(journeylog.journey_class).to eq journey
    end
  end
end
