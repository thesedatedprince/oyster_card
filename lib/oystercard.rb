require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :journey
  attr_accessor :balance

  LIMIT = 90.0

  def initialize(journey = Journey.new)
    @balance = 5.00
    @journey = journey
  end

  def top_up(add_money)
    raise "Top up would exceed the card's balance limit of £#{LIMIT}" if @balance + add_money.to_f > LIMIT
    @balance += add_money.to_f
  end

  def touch_in(card = self, station = Station.new)
    raise "Insufficient balance on card." if @balance < Journey::PENALTY_FARE
    @journey.journey_start(card, station)
  end

  def touch_out(card = self, station = Station.new)
    @journey.journey_end(card, station)
  end



end
