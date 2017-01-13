require_relative 'station'
require_relative 'journey'
require_relative 'journeylog'

class Oystercard

attr_reader :balance, :journeys

CARD_LIMIT = 90
MINIMUM_FARE = 1

  def initialize()
    @balance = 0
    @journeys = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Top Up Error: You have hit your top up limit of #{CARD_LIMIT}" if check_max_bal(amount)
  	@balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if check_min_bal
    deduct(@journey.fare) if !@journey.complete?
    @journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish_journey(exit_station)
    deduct(@journey.fare)
    add_journey
  end

  def add_journey
    journeys << @journey.current_journey
    @journey = Journey.new
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def check_min_bal
    balance < MINIMUM_FARE
  end

  def check_max_bal(amount)
    (balance + amount) > CARD_LIMIT
  end

end
