class JourneyLog
  attr_reader :journey_class, :entry_station, :store_journey, :exit_station, :journeys
  def initialize(entry_station)
  #  @journey_class = journey_class
    @journeys = []
    @entry_station = entry_station
  end

  def record_exit(station)
  #  @currentjourney ||= Journey.new(station)
  #  @entry_station = station
    @exit_station = station
  end

  def store_journey
    @journeys << ["#{entry_station}", "#{exit_station}"]
#    @currentjourney = nil
  #  @journeys
  end

end
