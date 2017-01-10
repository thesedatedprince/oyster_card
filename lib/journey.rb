class Journey
  attr_reader :journeys, :entry_station, :exit_station

  MINIMUM_CHARGE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def add_journey(station)
    @exit_station = station
  end

  def fare
    entry_station == nil ? PENALTY_FARE : MINIMUM_CHARGE
  end
end
