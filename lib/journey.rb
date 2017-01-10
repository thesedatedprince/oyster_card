class Journey
  attr_reader :journeys

  MINIMUM_CHARGE = 1
  PENALTY_FARE = 6

  def initialize(journeys=[], entry_station: nil)
    @journeys = journeys
    @entry_station = entry_station
  end

  def add_journey(journey)
    @journeys << journey
  end

  def entry_station(station)
    @entry_station = station
  end

  def fare
    MINIMUM_CHARGE
  end
end
