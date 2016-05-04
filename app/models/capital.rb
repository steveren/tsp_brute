class Capital
  include Mongoid::Document
  field :city, type: String
  field :state, type: String
  field :loc, type: Array
end
