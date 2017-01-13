class Journey

	attr_reader :current_journey

	PENALTY_FARE = 6
	INCOMPLETE_JOURNEY = 1


	def initialize
		@current_journey = {}
	end

	def start_journey(entry_station)
		@current_journey[:entry_station] = entry_station
	end

	def finish_journey(exit_station)
		@current_journey[:exit_station] = exit_station
	end

	def complete?
		@current_journey.size != INCOMPLETE_JOURNEY
	end

	def fare
		complete? ? Oystercard::MINIMUM_FARE : PENALTY_FARE
	end
end
