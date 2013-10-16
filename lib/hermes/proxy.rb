module Hermes
  class Proxy

    attr_reader :address, :port, :type

    # @params address String
    # @params port Integer
    # @params type String ['http', 'socks5']
    def initialize(address: '127.0.0.1', port: 9050, type: 'socks5')
      @address = address
      @port = port
      @type = type
    end

  end
end
