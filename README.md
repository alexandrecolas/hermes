# Hermes

Hermes is a web crawler which include Mechanize and PhantomJs.

## Installation

Add this line to your application's Gemfile:

    gem 'hermes', git: 'git@github.com:alexandrecolas/hermes.git'

And then execute:

    $ bundle install

## Usage

### Configuration

You can initialize a default user agent

```ruby
Hermes.configure do |config|
  config.user_agent = 'linux_firefox'
end
```

#### User Agents
- linux_firefox
- linux_konqueror
- linux_mozilla
- mac_firefox
- mac_mozilla
- Safari
- mac_safari
- windows_chrome
- windows_ie6
- windows_ie7
- windows_ie8
- windows_ie9
- windows_ie10
- windows_ie11
- windows_mozilla
- windows_firefox
- Safari
- ipad
- android


### Example

```ruby
# Initialization
agent = Hermes::Agent.new

# set proxy
agent.set_proxy(address: '127.0.0.1', port: 9090, type: 'socks5')

# get agent
mechanize = @agent.mechanize # Mechanize
phantom = @agent.phantom # PhantomJS
http = @agent.http # Http
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
