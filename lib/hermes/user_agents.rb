require 'yaml'

module Hermes
  class UserAgents
    BROWSERS = YAML.load_file('config/browsers.yml')["browsers"]

    def self.get
      browser = Hermes.configuration.user_agent
      return BROWSERS["user_agents"][browser]
    end

    def self.get_mechanize
      browser = Hermes.configuration.user_agent
      return BROWSERS["user_agents_mechanize"][browser]
    end

  end
end
