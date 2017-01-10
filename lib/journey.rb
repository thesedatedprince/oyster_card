class Journey
  attr_reader :journeys, :entry_station, :exit_station

  MINIMUM_CHARGE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    #if @journeys = journeys
    @entry_station = entry_station
  end

  def add_journey(station)
    @exit_station = station
    #@journeys << [{entry_station: @entry_station, exit_station: station}]
  end

  # def entry_station(station)
  #   @entry_station = station
  # end

  def fare
    MINIMUM_CHARGE
  end
end
