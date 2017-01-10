require 'journey'

describe Journey do
  let(:full_journey) {described_class.new([{from: "entry_station", to: "exit_station"}])}

  describe "#initialize" do
    it "New journey initialises with empty array" do
      expect(subject.journeys).to eq []
    end
  end
  #subject {described_class.new([{from: "entry_station", to: "exit_station"}])}

  it "Check for existing journeys" do
    expect(full_journey.journeys).to eq [{from: "entry_station", to: "exit_station"}]
  end

  context "It calculates the fare" do
    it "charges the minimum fare" do
     expect(subject.fare).to eq Journey::MINIMUM_CHARGE
    end
  end

end
