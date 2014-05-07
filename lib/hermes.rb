module Hermes
  def self.root
    File.dirname __dir__
  end
end

require "hermes/version"
require "hermes/configuration"
require "hermes/user_agents"

require "hermes/agent"
