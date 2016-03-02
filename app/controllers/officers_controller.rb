class OfficersController < ApplicationController

  def index
   @videos = Video.all
   @city = City.find(params[:city_id])
  end

  def login

  end

  def show
    render :login
  end

  def create
    @city = City.find(params[:city_id])
  end

end