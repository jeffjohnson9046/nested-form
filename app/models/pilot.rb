class Pilot < ActiveRecord::Base
  belongs_to :ship
  attr_accessible :call_sign, :first_name, :last_name, :ship_id

  validates :first_name,
            :presence => true,
            :length => { :maximum => 50 }

  validates :last_name,
            :presence => true,
            :length => { :maximum => 50 }
  
  validates :call_sign,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :length => { :maximum => 50, :minimum => 5 }
end
