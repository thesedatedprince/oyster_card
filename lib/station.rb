class Station


  STATIONS = {zone_one: ["Charing Cross", "Picadilly"],
              zone_two: ["Camden", "Baker Street"]}

  attr_reader :current_zone, :current_station

  def initialize
    @current_zone = STATIONS.keys.sample
    @current_station = STATIONS[@current_zone].sample
  end


end
