require 'hermes/proxy'
require 'hermes/agents/http'
require 'hermes/agents/mechanize'
require 'hermes/agents/phantom'

module Hermes
  class Agent

    def initialize
      @proxy = false
    end

    def set_proxy(address: '127.0.0.1', port: 9050, type: 'socks5')
      @proxy = Hermes::Proxy.new(address: '127.0.0.1', port: 9050, type: 'socks5')
    end

    def phantom
      return Hermes::Agents::Phantom.new(proxy: @proxy)
    end

    def mechanize
      return Hermes::Agents::Mechanize.new(proxy: @proxy)
    end

    def http
      return Hermes::Agents::Http.new(proxy: @proxy)
    end

  end
end
