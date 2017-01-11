class JourneyLog
  attr_reader :entry_station, :exit_station, :journeys
  def initialize(entry_station)
    @journeys = []
    @entry_station = entry_station
  end

  def record_exit(station)
    @exit_station = station
    store_journey
  end

  def store_journey
    @journeys << [entry_station, exit_station]
  end

  def journey_status
    [entry_station, exit_station]
  end
end
