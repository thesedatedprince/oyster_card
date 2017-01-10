require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'

class Oystercard
  attr_reader :journeys, :journey
  attr_accessor :balance

  LIMIT = 90.0

  def initialize(journey = JourneyLog.new)
    @balance = 5.00
    @journey = journey
    @journeys = journey.journeys
  end

  def top_up(add_money)
    raise "Top up would exceed the card's balance limit of £#{LIMIT}" if @balance + add_money.to_f > LIMIT
    @balance += add_money.to_f
  end

  def touch_in(card = self, station = Station.new)
    raise 'Insufficient balance on card.' if @balance < Journey::PENALTY_FARE
    @journey.journey_start(card, station)
  end

  def touch_out(card = self, station = Station.new)
    @journey.journey_end(card, station)
  end
end
