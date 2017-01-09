class Oystercard

  attr_accessor :balance
  DEFAULT_BALANCE = 0

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(deposit)
    @balance += deposit
  end

end
