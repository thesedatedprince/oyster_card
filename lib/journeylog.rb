class JourneyLog
  attr_reader :entry_station, :exit_station, :journeys #, :store_journey
  def initialize(entry_station)
    # @journey_class = journey_class
    @journeys = []
    @entry_station = entry_station
  end

  def record_exit(station)
    # @currentjourney ||= Journey.new(station)
    # @entry_station = station
    @exit_station = station
    store_journey
  end

  def store_journey
    @journeys << [entry_station, exit_station]
    # @currentjourney = nil
    # @journeys
  end

  def journey_status
    [entry_station, exit_station]
  end
end
