require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the flights index page' do
    before :each do
      @airline_1 = Airline.create!(name: 'Turing Express')
      @airline_2 = Airline.create!(name: 'PD Flights')

      @flight_1 = @airline_1.flights.create!(number: '2124', date: '08/03/21', departure_city: 'Waterloo', arrival_city: 'Reno')
      @flight_2 = @airline_1.flights.create!(number: '2600', date: '08/05/21', departure_city: 'Moab', arrival_city: 'Houston')
      @flight_3 = @airline_2.flights.create!(number: '4532', date: '08/06/21', departure_city: 'Denver', arrival_city: 'New York')
      # @flight_4 = @airline_2.flights.create!(number: '4532', date: '08/06/21', departure_city: 'Aspen', arrival_city: 'Fresno')

      @passenger_1 = Passenger.create!(name: 'Maddy', age: 24)
      @passenger_2 = Passenger.create!(name: 'Joey', age: 28)
      @passenger_3 = Passenger.create!(name: 'Mike', age: 43)
      @passenger_4 = Passenger.create!(name: 'Mary', age: 37)
      @passenger_5 = Passenger.create!(name: 'Juan', age: 7)
      @passenger_6 = Passenger.create!(name: 'Esther', age: 23)
      @passenger_7 = Passenger.create!(name: 'Toy', age: 47)
      # @passenger_8 = Passenger.create!(name: 'Brisa', age: 100)



      @flight_passengers_1 = FlightPassenger.create(flight: @flight_1, passenger: @passenger_1)
      @flight_passengers_2 = FlightPassenger.create(flight: @flight_2, passenger: @passenger_2)
      @flight_passengers_3 = FlightPassenger.create(flight: @flight_2, passenger: @passenger_3)
      @flight_passengers_4 = FlightPassenger.create(flight: @flight_1, passenger: @passenger_4)
      @flight_passengers_5 = FlightPassenger.create(flight: @flight_2, passenger: @passenger_5)
      @flight_passengers_6 = FlightPassenger.create(flight: @flight_3, passenger: @passenger_6)
      @flight_passengers_7 = FlightPassenger.create(flight: @flight_3, passenger: @passenger_7)
      # @flight_passengers_8 = FlightPassenger.create(flight: @flight_4, passenger: @passenger_8)


      visit flights_path
    end

    it 'I see each flight in the system including its number, the name of the airline of that flight, and name of all the passengers' do
      # save_and_open_page
      within("#flight-#{@flight_1.id}") do
        expect(page).to have_content(@flight_1.number)
        expect(page).to have_content(@flight_1.airline.name)
        expect(page).to have_content(@passenger_1.name)
        expect(page).to have_content(@passenger_4.name)
      end

      within("#flight-#{@flight_2.id}") do
        expect(page).to have_content(@flight_2.number)
        expect(page).to have_content(@flight_2.airline.name)
        expect(page).to have_content(@passenger_2.name)
        expect(page).to have_content(@passenger_3.name)
        expect(page).to have_content(@passenger_5.name)

      end

      within("#flight-#{@flight_3.id}") do
        expect(page).to have_content(@flight_3.number)
        expect(page).to have_content(@flight_3.airline.name)
        expect(page).to have_content(@passenger_6.name)
        expect(page).to have_content(@passenger_7.name)
      end
    end
  end
end
