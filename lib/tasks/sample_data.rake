namespace :db do
  desc "fill the database with sample data for testing"
  task populate: :environment do
    Rake::Task["db:reset"].invoke

    make_ships
    make_pilots
  end
end

def make_ships
  Ship.create!(:name => "RZ-1A A-Wing", :crew => 1, :has_astromech => false, :speed => 125, :armament => "2 laser cannons, concussion missiles")
  Ship.create!(:name => "B-Wing", :crew => 1, :has_astromech => false, :speed => 75, :armament => "2 Autoblasters, 1 Heavy Laser Cannon, 3 Ion Cannons, proton torpedoes")
  Ship.create!(:name => "BTL-S3 Y-Wing", :crew => 2, :has_astromech => true, :speed => 80, :armament => "2 laser cannons, ion cannon turret, proton torpedoes")
  Ship.create!(:name => "BTL-A4 Y-Wing", :crew => 1, :has_astromech => true, :speed => 80, :armament => "2 laser cannons, ion cannon turret, proton torpedoes")
  Ship.create!(:name => "T-65 X-Wing", :crew => 1, :has_astromech => true, :speed => 100, :armament => "4 laser cannons, proton torpedoes")
end

def make_pilots
  a_wing = Ship.find_by_name("RZ-1A A-Wing").id
  a4_y_wing = Ship.find_by_name("BTL-A4 Y-Wing").id
  x_wing = Ship.find_by_name("T-65 X-Wing").id

  Pilot.create!(:call_sign => "Green Leader", :first_name => "Arvel", :last_name => "Crynyd", :ship_id => a_wing)
  Pilot.create!(:call_sign => "Gray Leader", :first_name => "Horton", :last_name => "Salm", :ship_id => a4_y_wing)
  Pilot.create!(:call_sign => "Gold Leader", :first_name => "Jon", :last_name => "Vander", :ship_id => a4_y_wing)
  Pilot.create!(:call_sign => "Red Leader", :first_name => "Garven", :last_name => "Dreis", :ship_id => x_wing)
  Pilot.create!(:call_sign => "Red 2", :first_name => "Wedge", :last_name => "Antilles", :ship_id => x_wing)
  Pilot.create!(:call_sign => "Red 3", :first_name => "Biggs", :last_name => "Darklighter", :ship_id => x_wing)
end
