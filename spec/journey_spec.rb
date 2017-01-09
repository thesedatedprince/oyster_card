require 'journey'

describe Journey do
  it "New journey initialises with empty array" do
    expect(subject.journeys).to eq []
  end
end

describe Journey do
  subject {described_class.new([{from: "entry_station", to: "exit_station"}])}
  it "Check for existing journeys" do
    expect(subject.journeys).to eq [{from: "entry_station", to: "exit_station"}]
  end
end
