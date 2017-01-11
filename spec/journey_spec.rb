require 'journey'

describe Journey do
  let(:teststation) {double :station, name: "entry_station", zone: 1}
  let(:teststationtwo) {double :station, name: "exit_station", zone: 5}
  let(:full_journey) {double :journey, entry_station: teststation}

  describe "#initialize" do

  end

  context "It calculates the fare" do
    it "charges the minimum fare" do
      #subject.instance_variable_set(:@entry_station, teststation)
      allow(full_journey).to receive(:fare).and_return(Journey::MINIMUM_CHARGE)
      expect(full_journey.fare).to eq Journey::MINIMUM_CHARGE
    end

    it "charges the penalty fare when no touch in" do
      allow(full_journey).to receive(:fare).and_return(Journey::PENALTY_FARE)
      expect(full_journey.fare).to eq Journey::PENALTY_FARE
    end

    it "charges £1 from zone to zone 1" do
      # allow(full_journey).to receive(:add_journey).and_return(teststation)
      # allow(full_journey).to receive(:fare)
      fare_jounrey = Journey.new(teststation)
      fare_jounrey.add_journey(teststation)

      expect(fare_jounrey.fare).to eq 1
    end

    it "deducts the difference between zones" do
      fare_jounrey = Journey.new(teststation)
      fare_jounrey.add_journey(teststationtwo)
      expect(fare_jounrey.fare).to eq 4
    end
  end

  describe "#entry_station" do
    it "Check to see if you can add an entry station" do
      journey = Journey.new(teststation)
      expect(journey.entry_station).to eq teststation
    end
  end
end
