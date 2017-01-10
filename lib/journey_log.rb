class JourneyLog

  attr_reader :journeys

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = {}
    @journey_count = 0
  end

  def journey_start(card, station)
    @entry_station = station.station_name
    @entry_zone = station.zone
    @card = card
  end

  def journey_end(card, station)
    Journey.new.fare(card, @entry_station)
    record_journey(station.station_name, station.zone)
    @entry_station = nil
  end

  def record_journey(exit_name, exit_zone)
    @journeys["Journey #{@journey_count += 1}"] = ["#{@entry_zone}: #{@entry_station}", "#{exit_zone}: #{exit_name}"]
  end

  def report_journey
    @journeys
  end

  private

  def in_journey?
    true if @entry_station
  end

end
