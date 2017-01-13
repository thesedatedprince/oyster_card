require_relative 'journey'

class JourneyLog

	attr_reader :active_journey, :entry_station

	def initialize(journey_class)
		@journey_class = journey_class
		@active_journey = journey_class.new
	end

	def start station
		active_journey.start_journey station
		@entry_station = active_journey.current_journey[:entry_station]
		#journey_started? = true
	end

	def journeys
		[]
	end

	def current_journey
	end

	def journey_started?
		current_journey.complete? if current_journey
	end
end
