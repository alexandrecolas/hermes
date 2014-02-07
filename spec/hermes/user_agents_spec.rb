require 'spec_helper'
require 'pry'

describe Hermes::UserAgents do

  before do
    @user_agents = Hermes::UserAgents
  end

  describe "#get" do
    it "return user agents" do
      user_agent = @user_agents.get
      user_agent.class.should eq String
    end
  end

  describe "#get_mechanize" do
    it "return user agents for mechanize" do
      user_agent = @user_agents.get_mechanize
      user_agent.class.should eq String
    end
  end

end
