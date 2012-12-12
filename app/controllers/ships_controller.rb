class ShipsController < ApplicationController

  def index
    @ships = Ship.all
  end

  def show
    @ship = Ship.includes(:pilots).find_by_id(params[:id])
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(params[:ship])

    if @ship.save
      flash[:notice] = "The <b>#{ @ship.name }</b> ship has been saved successfully."
      redirect_to(ships_path, :notice => "The <b>#{ @ship.name }</b> ship has been saved successfully.")
    else
      render(:new, :error => @ship.errors)
    end
  end

  def edit
    @ship = Ship.find_by_id(params[:id])
  end

  def update
    @ship = Ship.find_by_id(params[:id])

    if @ship.update_attributes(params[:ship])
      redirect_to(ships_path, :notice => "The <b>#{ @ship.name }</b> ship has been updated successfully.")
    else
      render(:edit, :error => @ship.errors)
    end
  end

  def destroy
    @ship = Ship.find(params[:id])

    if @ship.destroy
      redirect_to(ships_path, :notice => "The <b>#{ @ship.name }</b> and its associated Pilots have been deleted successfully.")
    else
      redirect_to(ships_path, :notice => "The <b>#{ @ship.name }</b> could not be deleted.")
    end
  end
end
