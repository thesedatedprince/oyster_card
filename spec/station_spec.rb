require 'station'

describe Station do
it 'initializes with a zone' do
  expect(subject.current_zone).not_to be_nil
end
it 'initializes with a station name' do
  expect(subject.current_station).not_to be_nil
end
end
