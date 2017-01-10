require 'journey_log'

describe JourneyLog do
  let(:journey) { Journey.new }
  let(:card) { Oystercard.new(subject) }
  let(:start_station) { Station.new }
  let(:end_station) { Station.new }
  it 'it stores information about the users journeys' do
    expect(subject).to respond_to :journeys
  end
  it 'has an empty journey history by default' do
    expect(subject.journeys).to be_empty
  end
  it 'adds a new journey to the history of journeys after touching in and out' do
    card.top_up(10.0)
    card.touch_in
    expect{card.touch_out}.to change {subject.journeys.size}.by(1)
  end
end
