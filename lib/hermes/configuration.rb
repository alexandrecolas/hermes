module Hermes

  class Configuration
    attr_accessor :user_agent

    def initialize
      @user_agent = "linux_firefox"
    end
  end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configuration=(config)
      @configuration = config
    end

    def configure
      yield configuration
    end
  end

end
