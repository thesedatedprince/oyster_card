class Journey

  attr_reader :entry_station, :exit_station, :journeys

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = Hash.new
    @journey_count = 0
  end

  def journey_start(station)
    @entry_station = station.station_name
  end

  def journey_end(station)
    @journey_count += 1
    @exit_station = station.station_name
    journeys["Journey #{@journey_count}"] = ["#{station.zone}: #{@entry_station}", "#{station.zone}: #{@exit_station}",]
    @entry_station = nil
  end


end
