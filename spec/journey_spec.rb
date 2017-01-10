require 'journey'

describe Journey do
  let(:card) { Oystercard.new }
  let(:start_station) { Station.new }
  let(:end_station) { Station.new }

  
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
