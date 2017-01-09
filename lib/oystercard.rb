class Oystercard

  attr_reader :balance

  def initialize
    @balance = 1
  end

  def top_up(add_money)
    @balance += add_money
  end

end
