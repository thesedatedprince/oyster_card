require './lib/station.rb'

class Oystercard
  attr_reader :balance, :travelling, :entry_station

  LIMIT = 90.0
  FARE = 6.6

  def initialize
    @balance = 5.00
    @entry_station = nil
  end

  def top_up(add_money)
    raise "Top up would exceed the card's balance limit of £#{LIMIT}" if @balance + add_money.to_f > LIMIT
    @balance += add_money.to_f
  end

  def touch_in(station = Station.new)
    raise "Insufficient balance on card." if @balance < FARE
    @entry_station = station
    in_journey?
  end

  def touch_out
    deduct
    @entry_station = nil
  end

  private
  def in_journey?
    if @entry_station
      true
    end
  end

  def deduct
    @balance -= FARE
  end

end
