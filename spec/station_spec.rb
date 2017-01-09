require 'station'

describe Station do
  subject {described_class.new("testname", 0)}

  it "Knows it's zone" do
    expect(subject.zone).to eq 0
  end
  it "Knows it's name" do
    expect(subject.name).to eq "testname"
  end

end
