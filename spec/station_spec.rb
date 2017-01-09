require 'station'

describe Station do
  let(:station) {Station.new("testname", 0) }

  it "Initialises a station with zone" do
    expect(station.zone).to eq 0
  end
  it "Initializes a station with name" do
    expect(station.name).to eq "testname"
  end

end
