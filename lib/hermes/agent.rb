require 'hermes/proxy'
require 'hermes/agents/http'

module Hermes
  class Agent

    def initialize
      @proxy = false
    end

    def set_proxy(address: '127.0.0.1', port: 9050, type: 'socks5')
      @proxy = Hermes::Proxy.new(address: '127.0.0.1', port: 9050, type: 'socks5')
    end

    def http
      return @http ||= Hermes::Agents::Http.new(proxy: @proxy)
    end

  end
end
