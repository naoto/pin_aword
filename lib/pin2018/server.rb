require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cookies'
require 'pin2018/slack'
require 'json'

module Pin2018
  class Server < Sinatra::Base

    set :root, "#{File.dirname(__FILE__)}/../../"
    set :bind, '0.0.0.0'
    helpers Sinatra::Cookies

    get '/' do
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
  end
end
