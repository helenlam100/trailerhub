class TrailersController < ApplicationController

  def index
    if !user_signed_in?
      flash[:notice] = "You must sign in first"
    redirect_to new_user_registration_path
    end
  end

  def create
    if !params[:query].include?("trailer")
      search = params[:query] + " trailer"
    else
      search = params[:query]
    end
    client = YouTubeIt::Client.new(:dev_key => ENV["YOUTUBEAPIKEY"])
    response = client.videos_by(:query => search )
    @trailer_url = response.videos[0].media_content[0].url

    @trailer = Trailer.find_by(:url => @trailer_url)
    if @trailer != nil
      @review = @trailer.reviews
      #@review has an active record collection which is behaves like an array with some additional methods
    else
      @trailer = Trailer.new(:url => @trailer_url)  #new returns active record object that corresponds to a new row in the database
      @trailer.save  #save returns boolean
      @review = []
    end

    render :index
  end

  def new


  end
end
