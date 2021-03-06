module TourManager
  def self.destination_cities
    @destination_cities ||= []
  end

  def self.add_city( city )
    destination_cities << city
  end

  def self.get_city( index )
    destination_cities[ index ]
  end

  def self.number_of_cities
    destination_cities.size
  end

  def self.each_city
    destination_cities.each do |city|
      yield city
    end
  end
end
