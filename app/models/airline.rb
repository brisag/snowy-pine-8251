class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers

  def find_adult_passengers
    passengers
    .where('age >= ?', 18)
    .distinct
  end

  def passenger_count
    passengers.size
  end

  def order_by_frequent_flyers
    flights.join(:passenger)
    .group(:id)
    .order("passengers.*, count(passengers.flights) as frequent_passenger")
    .order(frequent_passenger: :desc)
  end
end
