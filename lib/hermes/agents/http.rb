require 'net/http'
require 'socksify/http'

module Hermes
  module Agents
    class Http

      def initialize(proxy: false, user_agent: "Windows Firefox")
        @user_agent_alias = user_agent

        @proxy = proxy
        @net = Net::HTTP

        unless @proxy == false
          if @proxy.type == 'socks5'
            TCPSocket::socks_server = @proxy.address
            TCPSocket::socks_port = @proxy.port
          else
            @net = Net::HTTP::Proxy(@proxy.address, @proxy.port)
          end
        end

      end

      def get url, headers: nil
        uri = URI.parse(url)
        begin
          return @net.start(uri.host, 80) do |http|
            http.read_timeout = 480
            headers ? http.get(uri.path, headers) : http.get(uri.path)
          end
        rescue StandardError => e
          return false
        end
      end

      def post url, params: nil, headers: nil
        uri = URI.parse(url)
        begin
          return @net.start(uri.host, 80) do |http|
            request = Net::HTTP::Post.new(uri.path, headers)
            request.set_form_data(params)

            http.request(request)
          end
        rescue StandardError => e
          return false
        end
      end

    end
  end
end
