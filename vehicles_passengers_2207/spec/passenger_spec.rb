require './lib/passenger'

RSpec.describe Passenger do
    describe ".passenger_initialize" do
        before(:each) do
            @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
            @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        end

        context "passenger object is instance of class" do
            it 'exists' do
                expect(@charlie).to be_an_instance_of(Passenger)
                expect(@taylor).to be_an_instance_of(Passenger)
            end
        end

        context "passenger object returns instance variables" do
            it 'returns name' do
                expect(@charlie.name).to eq("Charlie")
                expect(@taylor.name).to eq("Taylor")
            end

            it 'returns age' do
                expect(@charlie.age).to eq(18)
                expect(@taylor.age).to eq(12)
            end
        end

        context "returns boolean if method adult? is executed" do
            it 'returns true for @charlie' do
                expect(@charlie.adult?).to eq(true)
            end

            it 'returns false for @taylor' do
                expect(@taylor.adult?).to eq(false)
            end
        end

        context "returns boolean for driver? allow reassigning of driver?" do
            it 'returns false, nobody is driving' do
                expect(@charlie.driver?).to eq(false)
                expect(@taylor.driver?).to eq(false)
            end

            it 'returns true for @charlie given .drive' do
                @charlie.drive
                expect(@charlie.driver?).to eq(true)
            end
        end
    end
end