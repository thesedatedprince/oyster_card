class Journey
  attr_reader :journeys

  def initialize(journeys=[])
    @journeys = journeys
  end

  def add_journey(journey)
    @journeys << journey
  end
end
