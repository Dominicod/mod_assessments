require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do
    before(:all) do
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @jude = Passenger.new({"name" => "Jude", "age" => 20})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    end
    describe ".vehicle_initialize" do
        context "vehicle object is instance of class" do
            it 'exists' do
                expect(@vehicle).to be_an_instance_of(Vehicle)
            end
        end

        context "vehicle object returns instance variables" do
            it 'returns year' do
                expect(@vehicle.year).to eq("2001")
            end

            it 'returns make' do
                expect(@vehicle.make).to eq("Honda")
            end

            it 'returns model' do
                expect(@vehicle.model).to eq("Civic")
            end

            it 'returns passengers (empty array by default)' do
                expect(@vehicle.passengers).to eq([])
            end
        end
    end
    describe ".speeding?" do
        context "returns boolean if method speeding? is executed" do
            it 'returns false for vehicle by default' do
                expect(@vehicle.speeding?).to eq(false)
            end

            it 'returns true if vehicle object is passed .speed' do
                @vehicle.speed
                expect(@vehicle.speeding?).to eq(true)
            end
        end
    end
    describe ".add_passenger" do
        context "adds passenger objects to passengers array" do
            it 'adds passengers' do
                @vehicle.add_passenger(@charlie)
                @vehicle.add_passenger(@jude)
                @vehicle.add_passenger(@taylor)
                expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
            end
        end
        context "tracks the number of adults in passengers array" do
            it 'tracks adults' do
                expect(@vehicle.num_adults).to eq(2)
            end
        end
    end
end