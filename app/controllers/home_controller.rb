class HomeController < ApplicationController

  AUTHORIZE = "https://accounts.spotify.com/authorize?"
  CLIENT_SECRET = "e5882992e95e4aff9f8817252353c192"
  CLIENT_ID = "dbecd3a4157c4d8cb70e829987f0ad81"
  RESPONSE_TYPE = "code"
  REDIRECT_URI = "http://localhost:3000/"
  def index
    @external_url = "https://accounts.spotify.com/authorize?client_id=#{CLIENT_ID}&response_type=code&redirect_uri=#{REDIRECT_URI}"
    
  end


end
