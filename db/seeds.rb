# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@airline_1 = Airline.create!(name: 'Turing Express')
@airline_2 = Airline.create!(name: 'PD Flights')

@flight_1 = @airline_1.flights.create!(number: '2124', date: '08/03/21', departure_city: 'Waterloo', arrival_city: 'Reno')
@flight_2 = @airline_1.flights.create!(number: '2600', date: '08/05/21', departure_city: 'Moab', arrival_city: 'Houston')
@flight_3 = @airline_2.flights.create!(number: '4532', date: '08/06/21', departure_city: 'Denver', arrival_city: 'New York')
@flight_4 = @airline_2.flights.create!(number: '4532', date: '08/06/21', departure_city: 'Aspen', arrival_city: 'Fresno')

@passenger_1 = Passenger.create!(name: 'Maddy', age: 24)
@passenger_2 = Passenger.create!(name: 'Joey', age: 28)
@passenger_3 = Passenger.create!(name: 'Mike', age: 43)
@passenger_4 = Passenger.create!(name: 'Mary', age: 37)
@passenger_5 = Passenger.create!(name: 'Juan', age: 7)
@passenger_6 = Passenger.create!(name: 'Esther', age: 23)
@passenger_7 = Passenger.create!(name: 'Toy', age: 47)


@flight_passengers_1 = FlightPassenger.create(flight: @flight_1, passenger: @passenger_1)
@flight_passengers_2 = FlightPassenger.create(flight: @flight_2, passenger: @passenger_2)
@flight_passengers_3 = FlightPassenger.create(flight: @flight_2, passenger: @passenger_3)
@flight_passengers_4 = FlightPassenger.create(flight: @flight_1, passenger: @passenger_4)
@flight_passengers_5 = FlightPassenger.create(flight: @flight_2, passenger: @passenger_5)
@flight_passengers_6 = FlightPassenger.create(flight: @flight_3, passenger: @passenger_6)
@flight_passengers_7 = FlightPassenger.create(flight: @flight_3, passenger: @passenger_7)
