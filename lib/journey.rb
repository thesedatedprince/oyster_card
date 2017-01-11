class Journey
  attr_reader :entry_station, :exit_station, :log

  MINIMUM_CHARGE = 1
  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
    @log = JourneyLog.new(entry_station)
  end

  def add_journey(station)
    @exit_station = station
    @log.record_exit(station)
    @log.store_journey
  end

  def fare
    entry_station == nil ? PENALTY_FARE : MINIMUM_CHARGE
  end
end
