require_relative 'journey'

class JourneyLog

	attr_reader :active_journey, :entry_station, :journey_class

	def initialize(journey_class)
		@journey_class = journey_class
		@active_journey = journey_class.new
		@journeys = []
	end

	def start station
		active_journey.start_journey station
		@entry_station = active_journey.current_journey[:entry_station]
		#journey_started? = true
	end

	def finish station
		active_journey.finish_journey station
	end

	def journeys
		@journeys.dup
	end

	def current_journey
	#	@active_journey
	  if @active_journey.complete?
			@journeys << @active_journey
			@active_journey = journey_class.new
		else
			@active_journey
		end
	end

end
