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

  context "for Mechanize agent" do
    it "should be return Mechanize class" do
      @agent.mechanize.class.should eq(Hermes::Agents::Mechanize)
    end
  end

end
