require 'yaml'

module Hermes
  class UserAgents

    def self.get
      browsers = YAML.load_file("#{Hermes.root}/config/browsers.yml")["browsers"]
      return browsers["user_agents"][Hermes.configuration.user_agent]
    end

    def self.get_mechanize
      browsers = YAML.load_file("#{Hermes.root}/config/browsers.yml")["browsers"]
      return browsers["user_agents_mechanize"][Hermes.configuration.user_agent]
    end

  end
end
