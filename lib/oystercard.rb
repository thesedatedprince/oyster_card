class Oystercard
  attr_reader :balance

  LIMIT = 90.0
  FARE = 6.6

  def initialize
    @balance = 1.0
  end

  def top_up(add_money)
    raise "Top up would exceed the card's balance limit of £#{LIMIT}" if @balance + add_money.to_f > LIMIT
    @balance += add_money.to_f
  end

  def deduct
    @balance -= FARE
  end
end
