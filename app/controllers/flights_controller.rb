class FlightsController < ApplicationController

  def index
    @flights = Flight.all.map do |flight|
      ["#{flight.departure_airport.name} → #{flight.arrival_airport.name}", flight.id]
    end
  end
  
  def show
    
  end
end