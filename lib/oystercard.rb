class Oystercard

  attr_reader :balance, :limit, :in_journey, :entry_station

  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  MINIMUM_CHARGE = 1

  def initialize(balance=DEFAULT_BALANCE, limit=DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
    @in_journey = false
    @entry_station = nil
  end

  def top_up(deposit)
    @deposit = deposit
    fail "Deposit would exceed max limit of #{limit}" if hit_limit?
    @balance += deposit
  end

  def touch_in(station="test")
    fail "Card already in use" if @in_journey
    @entry_station = station
    @in_journey = true
  end

  def touch_out
    fail "Card not in use" unless @in_journey
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
    @in_journey = false
  end

  private

  attr_reader :deposit

  def hit_limit?
    balance + deposit > limit
  end

  def enough_credit?
    balance >= MINIMUM_CHARGE
  end

  def deduct(fare)
    fail "Insufficient credit available" unless enough_credit?
    @balance -= fare
  end
end
