require 'open-uri'
require 'json'

module Pin2018
  class Slack

    PIN_LIST_URL = "https://slack.com/api/pins.list"
    USER_LIST_URL = "https://slack.com/api/users.list"
    TOKEN = ENV['SLACK_TOKEN']

    def pins
      json = JSON.parse(open(PIN_LIST_URL + "?channel=C36PBSRS8&token=#{TOKEN}").read)
      res = []
      json['items'].each do |line|
        res << line unless line['message'].nil?
      end

      res
    end

    def users
      json = JSON.parse(open(USER_LIST_URL + "?token=#{TOKEN}").read)
      puts json
      res = []
      json["members"].each do |line|
        res << line
      end

      res
    end


  end
end
