require 'spec_helper'
require 'pry'

describe Hermes::Agent do

  before :all do
    @agent = Hermes::Agent.new()
  end

  context "for Http agent" do
    it "should be return Http class" do
      @agent.http.class.should eq(Hermes::Agents::Http)
    end
  end

end
