require 'httparty'

class HomeController < ApplicationController

  AUTHORIZE = "https://accounts.spotify.com/authorize?"
  CLIENT_SECRET = ENV['CLIENT_SECRET']
  CLIENT_ID = ENV['CLIENT_ID']
  REDIRECT_URI = "http://localhost:3000/home/search"

  TOKEN = "https://accounts.spotify.com/api/token"

  def index
    @external_url = "https://accounts.spotify.com/authorize?client_id=#{CLIENT_ID}&response_type=code&redirect_uri=#{REDIRECT_URI}"

  end
  
  def search
    @decode = request.url.split("code=")
    @code = @decode[1]
    
    @sp_access = HTTParty.post('https://accounts.spotify.com/api/token',
    headers: { 'Content_Type' => 'application/json' },
    body: {
      'client_id' => CLIENT_ID,
      'client_secret' => CLIENT_SECRET,
      'grant_type' => 'authorization_code',
      'code' => @code,
      'redirect_uri' => "http://localhost:3000/home/search"
    })
    @access_token = @sp_access['access_token']

    @response = HTTParty.get("https://api.spotify.com/v1/albums/4aawyAB9vmqN3uQ7FjRGTy", :headers => {
      "Authorization" => "Bearer #{@access_token}",
      "Content-Type" => "application/json"
    })
  end

  def auth
    @query = {
      'response_type' => "code",
      'client_id' => CLIENT_ID,
      'redirect_uri' => REDIRECT_URI
    }

    @test = HTTParty.get('https://accounts.spotify.com/authorize?', 
    :query => @query,
    )
  end
end
