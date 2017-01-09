class Oystercard
  attr_reader :balance, :travelling

  LIMIT = 90.0
  FARE = 6.6

  def initialize
    @balance = 5.00
    @travelling = false
  end

  def top_up(add_money)
    raise "Top up would exceed the card's balance limit of £#{LIMIT}" if @balance + add_money.to_f > LIMIT
    @balance += add_money.to_f
  end

  def deduct
    @balance -= FARE
  end

  def touch_in
    raise "Insufficient balance on card." if @balance < FARE
    @travelling = true
  end

  def touch_out
    @travelling = false
  end

  private
  def in_journey?
    @travelling
  end
end
