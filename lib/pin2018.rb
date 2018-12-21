require "pin2018/version"
require "pin2018/server"
require "pin2018/pin"
require "pin2018/user"

module Pin2018

  def self.run(options)
    Server.run!(options)
  end

  def self.batch(options)
    slack = Slack.new
    users = slack.users
    users.each do |user|
      u = User.find_by(slack_id: user["id"])
      if u.nil?
        u = User.new
        u.slack_id = user["id"]
        u.name = user["name"]
        u.avatar_url = user["profile"]["image_32"]
        u.save
      end
    end

    pins = slack.pins
    pins.each do |pin|
      pi = Pin.find_by(slack_id: pin["message"]["ts"])
      if pi.nil?
        pi = Pin.new
        pi.slack_id = pin["message"]["ts"]
        pi.user_id = pin["message"]["user"]
        pi.text = pin["message"]["text"]
        pi.post_date = Time.at(pin["created"])
        pi.fav = 0
        pi.save
      end
    end
  end

end
