class Oystercard

  attr_reader :balance, :limit, :entry_station, :journeys

  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  MINIMUM_CHARGE = 1

  def initialize(balance=DEFAULT_BALANCE, limit=DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
    @entry_station = nil
    @journeys = []
  end

  def top_up(deposit)
    @deposit = deposit
    fail "Deposit would exceed max limit of #{limit}" if hit_limit?
    @balance += deposit
  end

  def touch_in(station="entry_station")
    fail "Card already in use" if @entry_station
    @entry_station = station
  end

  def touch_out(station="exit_station")
    fail "Card not in use" unless @entry_station
    deduct(MINIMUM_CHARGE)
    journeys << {from: entry_station, to: station}
    @entry_station = nil
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
