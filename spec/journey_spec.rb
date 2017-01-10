require 'journey'

describe Journey do
  let(:card) {Oystercard.new(subject)}
  let(:start_station) {Station.new}
  let(:end_station) {Station.new}
  it 'it stores information about the users journeys' do
    expect(subject).to respond_to :journeys
  end
  it 'has an empty journey history by default' do
    expect(subject.journeys).to be_empty
  end
  it 'adds a new journey to the history of journeys after touching in and out' do
    card.top_up(10.0)
    current_journey = ["#{start_station.zone}: #{start_station.station_name}", "#{end_station.zone}: #{end_station.station_name}"]
    card.touch_in(start_station)
    card.touch_out(end_station)
    expect(subject.journeys.has_value?(current_journey)).to eq true
  end
  it 'remembers the entry station after touch in' do
    card.top_up(10.0)
    card.touch_in(start_station)
    expect(subject.entry_station).to eq start_station.station_name
  end
  it 'clears the entry station after touch out' do
    card.top_up(10.0)
    card.touch_in(start_station)
    card.touch_out
    expect(subject.entry_station).to eq nil
  end

end
