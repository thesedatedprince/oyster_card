class Oystercard

  attr_reader :balance, :limit
  #attr_accessor :limit

  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90

  def initialize(balance=DEFAULT_BALANCE, limit=DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
  end

  def top_up(deposit)
    @deposit = deposit
    fail "Deposit would exceed max limit of #{limit}" if hit_limit?
    @balance += deposit
  end

  private

  attr_reader :deposit

  def hit_limit?
    balance + deposit > limit
  end
end
