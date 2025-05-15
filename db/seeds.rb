# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[["Manchester", "MAN"],["Aberdeen", "ABZ"],["Stanstead", "STN"]].each do |name, code|
  Airport.find_or_create_by!(name: name, code: code)
end  

flights = [
  {
    departure_airport_code: "MAN",
    arrival_airport_code: "ABZ",
    departure_time: DateTime.now + 1.day,
    flight_duration: 60
  },
  {
    departure_airport_code: "ABZ",
    arrival_airport_code: "STN",
    departure_time: DateTime.now + 2.days,
    flight_duration: 90
  },
  {
    departure_airport_code: "STN",
    arrival_airport_code: "MAN",
    departure_time: DateTime.now + 3.days,
    flight_duration: 45
  }
]

flights.each do |flight_attrs|
  departure_airport = Airport.find_by!(code: flight_attrs[:departure_airport_code])
  arrival_airport   = Airport.find_by!(code: flight_attrs[:arrival_airport_code])

  Flight.find_or_create_by!(
    departure_airport: departure_airport,
    arrival_airport: arrival_airport,
    departure_time: flight_attrs[:departure_time]
  )
end