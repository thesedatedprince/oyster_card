require 'journey'

describe Journey do
  let(:card) { Oystercard.new(subject) }
  let(:start_station) { Station.new }
  let(:end_station) { Station.new }
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
