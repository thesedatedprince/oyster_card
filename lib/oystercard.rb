class Oystercard

  attr_reader :balance, :limit, :in_journey

  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90

  def initialize(balance=DEFAULT_BALANCE, limit=DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
    @in_journey = false
  end

  def top_up(deposit)
    @deposit = deposit
    fail "Deposit would exceed max limit of #{limit}" if hit_limit?
    @balance += deposit
  end

  def deduct(fare)
    @fare = fare
    fail "Insufficient credit available" unless enough_credit?
    @balance -= fare
  end
  
  private

  attr_reader :deposit, :fare

  def hit_limit?
    balance + deposit > limit
  end

  def enough_credit?
    balance - fare >= 0
  end

end
