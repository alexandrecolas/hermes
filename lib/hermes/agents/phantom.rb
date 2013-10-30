require 'capybara/poltergeist'

module Hermes
  module Agents
    class Phantom
      include Capybara::DSL

      def initialize(proxy: false)
        options = { timeout: 120, :cookies => true }

        if proxy
          options[:phantomjs_options] = ["--proxy-type=#{proxy.type}",
            "--proxy=#{proxy.address}:#{proxy.port}"]
          options[:js_errors] = false
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
        @session.driver.headers = { 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }

        return @session
      end

    end
  end
end
