require 'rspotify'
RSpotify::authenticate("dbecd3a4157c4d8cb70e829987f0ad81", "e5882992e95e4aff9f8817252353c192")


class ArtistsController < ApplicationController

  def index
    
    if !params[:artist_name].empty?
      @artists = RSpotify::Artist.search(params[:artist_name])
    else
      redirect_to root_path
    end
  end

  def show
    @artist = RSpotify::Artist.find(params[:id])
  end
  
  def search

  end

end
