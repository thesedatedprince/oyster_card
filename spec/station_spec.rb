require 'station'

describe Station do
it 'initializes with a zone' do
  expect(subject.zone).not_to be_nil
end
it 'initializes with a station name' do
  expect(subject.station_name).not_to be_nil
end
end
