require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :limit, :entry_station, :journeys, :currentjourney, :injourney

  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90

  def initialize(balance=DEFAULT_BALANCE, limit=DEFAULT_LIMIT) #, journeys=Journey.new)
    @balance = balance
    @limit = limit
    #@entry_station = nil
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
    #.entry_station != station
    #@currentjourney ||= Journey.new(station)
    fail "Not enough credit" unless enough_credit?
    @injourney = true


    #@currentjourney.entry_station = station
    @entry_station = station
  end

  def touch_out(station)
    @currentjourney ||= Journey.new(station)
    fail "Card not in use" unless in_journey?
    deduct(Journey::MINIMUM_CHARGE)
    #@journeys.add_journey(station)
    @injourney = false
    @currentjourney = nil
    #@entry_station = nil

  end

  def in_journey?
    @injourney
  end

  private

  attr_reader :deposit

  def hit_limit?
    balance + deposit > limit
  end

  def enough_credit?
    balance >= Journey::MINIMUM_CHARGE
  end

  def deduct(fare)
    fail "Insufficient credit available" unless enough_credit?
    @balance -= fare
  end
end
