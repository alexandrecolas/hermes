require 'yaml'

module Hermes
  class UserAgents
    BROWSERS = YAML.load_file('config/browsers.yml')["browsers"]

    def self.get
      return BROWSERS["user_agents"].values.sample
    end

    def self.get_mechanize
      return BROWSERS["user_agents_mechanize"].values.sample
    end

  end
end
