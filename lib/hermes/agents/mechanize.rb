require 'net/http'
require 'socksify/http'
require 'mechanize'

module Hermes
  module Agents
    class Mecha

      def initialize(proxy: false, user_agent: "Mac Safari")
        @proxy = proxy
        @user_agent_alias = user_agent
      end

      def mechanize
        unless @proxy == false
          if @proxy.type == 'socks5'
            TCPSocket::socks_server = @proxy.address
            TCPSocket::socks_port = @proxy.port
            agent = ::Mechanize.new
          else
            agent = ::Mechanize.new
            agent.set_proxy @proxy.address, @proxy.port
          end
        else
          agent = ::Mechanize.new
        end

        agent.user_agent_alias = @user_agent_alias

        return agent
      end

    end
  end
end
