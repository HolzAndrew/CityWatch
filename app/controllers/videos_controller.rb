class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  # uncomment below for regex on url
  # before_action :pull_youtube_id, :only => [:create]

  # protected
  # GET /videos
  # GET /videos.json
  def index
    @city = City.find(params[:city_id])
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
    @city = City.find(params[:city_id])
  end

  # GET /videos/1/edit
  def edit
  end

  def pull_youtube_id
    url = params[:video][:url]
    regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/
      match = regExp.match(url);
          if ( match && match[7].length == 11 )
            @video.url = match[7];
          end
  end


  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(url:params[:url],
      vid_date:params[:vid_date],
      vid_time:params[:vid_time],
      email:params[:email],
      phone:params[:phone],
      notes:params[:notes],
      vid_lat:params[:vid_lat],
      vid_lng:params[:vid_lng],
      city_id:params[:city_id])

    respond_to do |format|
      if @video.save
        format.html { redirect_to "/", notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to '/', notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:url, :vid_lat, :vid_lng, :vid_date, :vid_time, :email, :phone, :notes)
    end
end
