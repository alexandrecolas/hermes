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
      @proxy = Hermes::Proxy.new(address: address, port: port, type: type)
    end

    def phantom(options: {})
      return @agent_phantom ||= Hermes::Agents::Phantom.new(proxy: @proxy, options: options)
    end

    def mechanize
      return @agent_mechanize ||= (Hermes::Agents::Mecha.new(proxy: @proxy)).mechanize
    end

    def http
      return @agent_http ||= Hermes::Agents::Http.new(proxy: @proxy)
    end

  end
end
