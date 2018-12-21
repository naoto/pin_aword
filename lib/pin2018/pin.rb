require 'sinatra/activerecord'

class Pin < ActiveRecord::Base
  belongs_to :user, :primary_key => 'slack_id'
end
