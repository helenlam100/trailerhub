class TrailersController < ApplicationController

  def index
  end

  def create
    client = YouTubeIt::Client.new(:dev_key => ENV["YOUTUBEAPIKEY"])
    response = client.videos_by(:query => params[:query])
    @trailer_url = response.videos[0].media_content[0].url
    render :index
  end

  def new


  end
end
