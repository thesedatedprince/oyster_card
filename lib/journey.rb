class Journey
  attr_reader :entry_station, :exit_station, :log, :min_charge

  MINIMUM_CHARGE = 1
  PENALTY_FARE = 6

  def initialize(entry_station, min_charge = MINIMUM_CHARGE)
    @entry_station = entry_station
    @min_charge = min_charge
    @log ||= JourneyLog.new(entry_station)
  end

  def add_journey(station)
    @exit_station = station
    @log.record_exit(station)
  end

  def check_fare(balance)
    balance >= min_charge
  end

  def fare
    # entry_station == nil ? PENALTY_FARE : MINIMUM_CHARGE

    return PENALTY_FARE if entry_station == nil
    return MINIMUM_CHARGE if @entry_station.zone == @exit_station.zone
    MINIMUM_CHARGE
  end
end
