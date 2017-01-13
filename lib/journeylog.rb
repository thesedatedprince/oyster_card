require_relative 'journey'

class JourneyLog

	attr_reader :journey_class, :entry_station

	def initialize(journey_class = Journey.new)
		@journey_class = journey_class
	end

	def start
		@entry_station = journey_class.current_journey[:entry_station]
		journey_started? = true
	end

	def journey_started?
		false
	end

end
