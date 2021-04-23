require 'rails_helper'

RSpec.describe Airline, type: :model do
  before :each do
    @airline_1 = Airline.create!(name: 'Turing express')

    @flight_1 = @airline_1.flights.create!(number: '2124', date: '08/03/21', departure_city: 'Waterloo', arrival_city: 'Reno')
    @flight_2 = @airline_1.flights.create!(number: '2600', date: '08/05/21', departure_city: 'Moab', arrival_city: 'Houston')

    @passenger_1 = Passenger.create!(name: 'Maddy', age: 24)
    @passenger_2 = Passenger.create!(name: 'Joey', age: 28)
    @passenger_3 = Passenger.create!(name: 'Mike', age: 17)
    @passenger_4 = Passenger.create!(name: 'Mary', age: 37)
    @passenger_5 = Passenger.create!(name: 'Juan', age: 7)

    @flight_passengers_1 = FlightPassenger.create(flight: @flight_1, passenger: @passenger_1)
    @flight_passengers_2 = FlightPassenger.create(flight: @flight_1, passenger: @passenger_2)
    @flight_passengers_3 = FlightPassenger.create(flight: @flight_1, passenger: @passenger_3)
    @flight_passengers_4 = FlightPassenger.create(flight: @flight_2, passenger: @passenger_4)
    @flight_passengers_5 = FlightPassenger.create(flight: @flight_2, passenger: @passenger_5)

  end
  describe 'relationships' do
    it {should have_many :flights}
  end

  describe 'instance methods' do
    describe 'find_adult_passengers' do
      it 'list distinct passengers who are older than 19 yrs' do
        expect(@airline_1.find_adult_passengers).to eq([@passenger_1, @passenger_2, @passenger_4])
        expect(@airline_1.find_adult_passengers).to_not eq([@passenger_3, @passenger_5])
        expect(@passenger_3.age).to eq(17)
      end
    end
  end
end
