class Oystercard
  attr_reader :balance

  LIMIT = 90

  def initialize
    @balance = 1
  end

  def top_up(add_money)
    raise "Top up would exceed the card's balance limit of £#{LIMIT}" if @balance + add_money > LIMIT
    @balance += add_money
  end
end
