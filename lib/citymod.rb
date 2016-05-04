module Citymod
  class City
    attr_accessor :x
    attr_accessor :y
    attr_accessor :name
  

    def initialize( x = nil, y = nil, name = nil)
      self.x = x || rand * 200
      self.y = y || rand * 200
      self.name = name
    end

    def distance_to( city )
      x_distance = (self.x - city.x).abs
      y_distance = ( self.y - city.y).abs
      Math.sqrt( x_distance.abs2 + y_distance.abs2 )
    end

    def to_s
      "#{self.x}, #{self.y} (#{self.name})\n"
    end
  end
end
