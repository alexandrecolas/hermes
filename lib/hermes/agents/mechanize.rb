require 'net/http'
require 'socksify/http'
require 'mechanize'

module Hermes
  module Agents
    class Mecha

      def initialize(proxy: false)
        @proxy = proxy
      end

      def mechanize
        unless @proxy == false
          if @proxy.type == 'socks5'
            TCPSocket::socks_server = @proxy.address
            TCPSocket::socks_port = @proxy.port
            return ::Mechanize.new
          else
            agent = ::Mechanize.new
            agent.set_proxy @proxy.address, @proxy.port
            return agent
          end
        else
          return ::Mechanize.new
        end
      end

    end
  end
end
