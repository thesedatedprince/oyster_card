require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :limit, :journeys, :currentjourney, :injourney

  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90

  def initialize(balance=DEFAULT_BALANCE, limit=DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
    @journeys = []
    @injourney = false
  end

  def top_up(deposit)
    @deposit = deposit
    fail "Deposit would exceed max limit of #{limit}" if hit_limit?
    @balance += deposit
  end

  def touch_in(station)

    fail "Card already in use" if in_journey?
    @currentjourney ||= Journey.new(station)
    fail "Not enough credit" unless enough_credit?
    @injourney = true
    @entry_station = station
  end

  def touch_out(station)
    fail "Card not in use" unless in_journey?
    @currentjourney.add_journey(station)
    deduct_fare
    store_journey
    station
  end

  private

  attr_reader :deposit

  def hit_limit?
    balance + deposit > limit
  end

  def enough_credit?
    balance >= Journey::MINIMUM_CHARGE
  end

  def deduct_fare
    fail "Insufficient credit available" unless enough_credit?
    @balance -= @currentjourney.fare
    @injourney = false
  end

  def in_journey?
    @injourney
  end

  def store_journey
    @journeys << @currentjourney
    @currentjourney = nil
    @journeys
  end
end
