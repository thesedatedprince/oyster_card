require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :journey

  LIMIT = 90.0
  FARE = 6.6

  def initialize(journey = Journey.new)
    @balance = 5.00
    @journey = journey
  end

  def top_up(add_money)
    raise "Top up would exceed the card's balance limit of £#{LIMIT}" if @balance + add_money.to_f > LIMIT
    @balance += add_money.to_f
  end

  def touch_in(station = Station.new)
    raise "Insufficient balance on card." if @balance < FARE
    @journey.journey_start(station)
  end

  def touch_out(station = Station.new)
    deduct
    @journey.journey_end(station)
  end

  private

  def deduct
    @balance -= FARE
  end

end
