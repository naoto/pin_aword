require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cookies'
require 'pin2018/slack'
require 'pin2018/user'
require 'json'
require 'omniauth'
require 'omniauth-slack'

module Pin2018
  class Server < Sinatra::Base

    set :root, "#{File.dirname(__FILE__)}/../../"
    set :bind, '0.0.0.0'
    enable :sessions
    helpers Sinatra::Cookies
    use OmniAuth::Builder do
      provider :slack, ENV['OAUTH2_CLIENT_ID'], ENV['OAUTH2_CLIENT_SECRET'], scope: 'team:read'
    end

    get '/auth/slack/callback' do
      auth = request.env['omniauth.auth']
      if User.active?(auth["uid"])
        session[:uid] = auth["uid"]
        redirect '/'
      else
        redirect '/auth/slack'
      end
    end

    get '/' do
      if session[:uid].nil?
        redirect '/auth/slack'
      end

      @pins = Pin.order("fav desc, post_date desc")
      if cookies[:fav].nil?
        @faved = []
      else
        @faved = JSON.parse(cookies[:fav])
      end
p @faved
      erb :index
    end

    post '/fav' do
      if session[:uid].nil?
        redirect '/auth/slack'
      end

      pin_id = params["pin_id"];
      pin = Pin.find(pin_id)
      pin.fav += 1
      pin.save

      fav = nil
      if cookies[:fav].nil?
        fav = []
      else
        fav = JSON.parse(cookies[:fav])
      end
      fav << pin_id
      cookies[:fav] = JSON.generate(fav)

      true
    end

    get '/robots.txt' do
      erb :robots
    end

  end
end
