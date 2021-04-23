class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def adult_passengers
    passengers
      .where('age >= ?', 18)
  end
end
