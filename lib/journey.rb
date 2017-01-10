class Journey

  attr_reader :entry_station, :exit_station, :journeys, :entry_zone, :exit_zone

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = Hash.new
    @journey_count = 0
  end

  def journey_start(station)
    @entry_station = station.station_name
    @entry_zone = station.zone
  end

  def journey_end(station)
    @journey_count += 1
    @exit_station = station.station_name
    @exit_zone = station.zone
    @journeys["Journey #{@journey_count}"] = ["#{@entry_zone}: #{@entry_station}", "#{@exit_zone}: #{@exit_station}",]
    @entry_station = nil
  end

  private
  def in_journey?
    if @entry_station
      true
    end
  end

end
