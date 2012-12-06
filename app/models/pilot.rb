class Pilot < ActiveRecord::Base
  belongs_to :ship
  attr_accessible :call_sign, :first_name, :last_name, :ship_id
end
