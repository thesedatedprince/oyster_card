require './lib/station.rb'

class Oystercard
  attr_reader :balance, :travelling, :entry_station, :exit_station, :journeys

  LIMIT = 90.0
  FARE = 6.6

  def initialize
    @balance = 5.00
    @entry_station = nil
    @exit_station = nil
    @journeys = Hash.new
    @journey_count = 0
  end

  def top_up(add_money)
    raise "Top up would exceed the card's balance limit of £#{LIMIT}" if @balance + add_money.to_f > LIMIT
    @balance += add_money.to_f
  end

  def touch_in(station = Station.new)
    raise "Insufficient balance on card." if @balance < FARE
    @entry_station = station.current_station
    in_journey?
  end

  def touch_out(station = Station.new)
    deduct
    @journey_count += 1
    @exit_station = station.current_station
    journeys["Journey #{@journey_count}"] = [@entry_station, @exit_station]
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
