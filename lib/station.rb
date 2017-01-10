class Station

  STATIONS = {zone_one: ["Charing Cross", "Picadilly"],
              zone_two: ["Camden", "Baker Street"]}

  attr_reader :zone, :station_name

  def initialize
    @zone = STATIONS.keys.sample
    @station_name = STATIONS[@zone].sample
  end


end
