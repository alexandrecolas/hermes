require 'capybara/poltergeist'

module Hermes
  module Agents
    class Phantom
      include Capybara::DSL

      def initialize(proxy: false, options: {})
        @path = Dir.pwd

        if proxy
          options[:phantomjs_options] = [
            "--proxy-type=#{proxy.type}",
            "--proxy=#{proxy.address}:#{proxy.port}",
            "--load-images=no",
            "--ignore-ssl-errors=yes"
          ]
        else
          options[:phantomjs_options] = [
            "--load-images=no",
            "--ignore-ssl-errors=yes"
          ]
        end

        Capybara.configure do |config|
          config.run_server = false
          config.default_driver = :poltergeist
        end

        # Use Phantomjs (aka poltergeist) with Capybara
        Capybara.register_driver :poltergeist do |app|
          Capybara::Poltergeist::Driver.new(app, options)
        end
      end

      def session
        @session = Capybara::Session.new(:poltergeist)
        @session.driver.headers = { 'User-Agent' => Hermes::UserAgents.get }

        return @session
      end

    end
  end
end
