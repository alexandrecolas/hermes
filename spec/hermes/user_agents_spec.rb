require 'spec_helper'
require 'pry'

describe Hermes::UserAgents do

  before do
    @user_agents = Hermes::UserAgents
  end

  describe "#get" do
    it "return user agents" do
      user_agent = @user_agents.get
      user_agent.should eq "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0"
    end
  end

  describe "#get_mechanize" do
    it "return user agents for mechanize" do
      user_agent = Hermes::UserAgents.get_mechanize
      user_agent.should eq "Linux Firefox"
    end
  end

end
