require 'oystercard'

describe Oystercard do
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
    top_amnt = 3
    orig_amnt = subject.balance
    subject.top_up(top_amnt)
    expect(subject.balance).to eq(orig_amnt + top_amnt)
  end
  it 'should not allow the user to top up above the specified limit' do
    expect { subject.balance) }.to raise_error "Top up would exceed the card's balance limit of £#{Oystercard::LIMIT}"
  end
end
