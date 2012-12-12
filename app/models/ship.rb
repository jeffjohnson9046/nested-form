class Ship < ActiveRecord::Base
  attr_accessible :armament, :crew, :has_astromech, :name, :speed
  attr_accessible :pilots_attributes

  has_many :pilots
  accepts_nested_attributes_for :pilots,
                                :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } },
                                :allow_destroy => true
end
