require 'journey'

describe Journey do
	let(:entry_station) {double(:entry_station)}
	let(:exit_station)	{double(:exit_station)}


	it { is_expected.to respond_to(:start_journey) }


	context do

		before(:each) do
			subject.start_journey(entry_station)
		end

		describe '#start_journey' do

			it "should create a new journey and remember journey point of origin" do
			expect(subject.current_journey[:entry_station]).to eq entry_station
			end

		end

		describe '#finish_journey' do
			it "should finish a journey and remember destination" do
			subject.finish_journey(exit_station)
			expect(subject.current_journey[:exit_station]).to eq exit_station
			end
		end

		describe '#fare' do
			it {is_expected.to respond_to(:fare)}
			it 'returns true for completed journey' do
				subject.start_journey(entry_station)
				subject.finish_journey(exit_station)
				expect(subject.fare).to eq 1
			end
		end
	end
	it 'returns false for incomplete journey' do
		subject.finish_journey(exit_station)
		expect(subject.fare).to eq 6
	end

end
