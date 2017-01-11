class Journey
  attr_reader :entry_station, :exit_station, :log, :min_charge

  MINIMUM_CHARGE = 1
  PENALTY_FARE = 6

  def initialize(entry_station=nil, min_charge = MINIMUM_CHARGE)
    @entry_station = entry_station
    @min_charge = min_charge
    @log ||= JourneyLog.new(entry_station)
  end

  def add_journey(station=nil)
    @exit_station = station
    @log.record_exit(station)
  end

  def check_fare(balance)
    balance >= min_charge
  end

  def fare
    return PENALTY_FARE if no_station?
    return MINIMUM_CHARGE if same_station?
    (entry_station.zone - exit_station.zone).abs
  end

  private

  def same_station?
    entry_station.zone == exit_station.zone
  end

  def no_station?
    !entry_station || !exit_station
  end
end
