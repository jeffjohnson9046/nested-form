class Ship < ActiveRecord::Base
  attr_accessible :armament, :crew, :has_astromech, :name, :speed
  has_many :pilots
end
