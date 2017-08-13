class CitiesController < ApplicationController
  def updateTowns
    @towns = Town.find_all_by_city_id(params[:id])
    respond_to do |format|
      format.js
    end
  end
end
