require 'citymod'
require 'ga'
require 'populationmod'
require 'tour_manager'
require 'tourmod'

class WelcomeController < ApplicationController
  include Citymod
  include GA
  include Populationmod
  include TourManager
  include Tourmod
  
  def index
    @capitals = Capital.all

  end
  
  def plot
    @cities = []
    params.each do |param|
      if param[0] =~ /^city/
        @cities << param[1]
      end
    end
    
    @cities.each do |city_name|
      city_data = Capital.where(city: city_name).first
      new_city = City.new(city_data.loc[0], city_data.loc[1], "#{city_data.city}, #{city_data.state}");
      TourManager.add_city(new_city);
    end
 
      
    population = Population.new(100, true) 
    
    # Evolve population
    population = GA.evolve_population( population )
    population = GA.evolve_population( population )
    100.times do
      population = GA.evolve_population( population )
    end

    @solution = population.fittest.to_s
    
    #
    # puts "Finished"
    # puts "Final distance: #{population.fittest.distance}"
    # puts "Solution:"
    # puts population.fittest.to_s
    
  end
end