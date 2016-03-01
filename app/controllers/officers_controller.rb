class OfficersController < ApplicationController

  def index
   @videos = Video.all
   @city = City.find(params[:city_id])
  end

end