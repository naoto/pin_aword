require 'sinatra/activerecord'

class User < ActiveRecord::Base

  def self.active?(slack_id)
    user = User.find_by(slack_id: slack_id)
    !user.nil?
  end
end
