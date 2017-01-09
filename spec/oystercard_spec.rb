require 'oystercard'

describe Oystercard do
  let(:oystercard) {Oystercard.new}

  it 'responds to #balance' do
    expect(subject).to respond_to :balance
  end
  it 'checks that a new card has a balance' do
    expect(subject.balance).not_to be_nil
  end
  it 'responds to #top_up' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
  it 'should add money to balance' do
    top_amnt = 3.0
    orig_amnt = subject.balance
    subject.top_up(top_amnt)
    expect(subject.balance).to eq(orig_amnt + top_amnt)
  end

  it 'should not allow the user to top up above the specified limit' do
    expect {subject.top_up(Oystercard::LIMIT + 1)}.to raise_error "Top up would exceed the card's balance limit of £#{Oystercard::LIMIT}"
  end

  it 'responds to #deduct' do
    expect(subject).to respond_to(:deduct)
  end

  it 'should deduct money from the card' do
    ded_amnt = Oystercard::FARE
    orig_amnt = subject.balance
    subject.deduct
    expect(subject.balance).to eq(orig_amnt - ded_amnt)
  end
  it 'should allow the user to touch in when entering the station' do
    subject.top_up(10.0)
    expect(subject).to respond_to :touch_in
    expect(subject.touch_in).to eq true
  end
  it 'should set the status to in journey after touching in' do
    subject.top_up(10.0)
    subject.touch_in
    expect(subject.travelling).to eq true
  end
  it 'should allow the user to touch out when leaving the station' do
    expect(subject).to respond_to :touch_out
    expect(subject.touch_out).to eq false
  end
  it 'should set the in journey status to false after touching out' do
    subject.touch_out
    expect(subject.travelling).to eq false
  end

  it 'should not allow the user to touch in if balance is less than fare' do
    allow(oystercard).to receive(:balance).and_return(6.5)
    expect {oystercard.touch_in}.to raise_error "Insufficient balance on card."
  end

end
