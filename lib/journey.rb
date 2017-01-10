class Journey

  attr_reader :entry_station, :exit_station, :journeys, :entry_zone, :exit_zone

  PENALTY_FARE = 6.6
  NORM_FARE = 3

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = Hash.new
    @journey_count = 0
  end

  def journey_start(card, station)
    @entry_station = station.station_name
    @entry_zone = station.zone
    @card = card
  end

  def journey_end(card, station)
    @exit_station = station.station_name
    @exit_zone = station.zone
    @card = card
    fare
  end

  def report_journey
    @journeys["Journey #{@journey_count += 1}"] = ["#{@entry_zone}: #{@entry_station}", "#{@exit_zone}: #{@exit_station}",]
    @entry_station = nil
  end

  def fare
    #norm_fare = 3
    @entry_station ? @fee = NORM_FARE : @fee = PENALTY_FARE
    deduct
  end

  private
  def in_journey?
    if @entry_station
      true
    end
  end

  def deduct
    @card.balance -= @fee
    report_journey
  end

end
