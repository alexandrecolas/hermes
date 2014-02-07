require 'net/http'
require 'socksify/http'

module Hermes
  module Agents
    class Http

      def initialize(proxy: false)
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

      def get(url, headers: {})
        headers['User-Agent'] ||= Hermes::UserAgents.get

        uri = URI.parse(url)
        begin
          return @net.start(uri.host, 80) do |http|
            http.read_timeout = 480
            http.get(uri.path, headers)
          end
        rescue StandardError => e
          return false
        end
      end

      def post(url, params: {}, headers: {})
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
