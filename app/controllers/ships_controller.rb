class ShipsController < ApplicationController

  def new
    @ship = Ship.new(:pilots => [Pilot.new])
  end
end
