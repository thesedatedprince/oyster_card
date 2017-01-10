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
    card.touch_in
    entry_test = subject.entry_station
    card.touch_out
    exit_test = subject.exit_station
    current_journey = ["#{subject.entry_zone}: #{entry_test}", "#{subject.exit_zone}: #{exit_test}"]
    expect(subject.journeys.has_value?(current_journey)).to eq true
  end
  it 'remembers the entry station after touch in' do
    card.top_up(10.0)
    card.touch_in(card, start_station)
    expect(subject.entry_station).to eq start_station.station_name
  end
  it 'clears the entry station after touch out' do
    card.top_up(10.0)
    card.touch_in(start_station)
    card.touch_out
    expect(subject.entry_station).to eq nil
  end
  it 'should deduct a penalty from the card if user doesnt touch in' do
    ded_amnt = Journey::PENALTY_FARE
    card.top_up(10)
    orig_amnt = card.balance
    card.touch_out
    expect(card.balance).to eq(orig_amnt - ded_amnt)
  end

  it 'should deduct money from the card' do
    ded_amnt = Journey::NORM_FARE
    card.top_up(10)
    orig_amnt = card.balance
    card.touch_in
    card.touch_out
    expect(card.balance).to eq(orig_amnt - ded_amnt)
  end

end
