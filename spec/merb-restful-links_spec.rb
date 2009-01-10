require 'rubygems'
require 'spec'
require 'merb-core'
require 'merb-more'

include Merb::AssetsMixin

require File.dirname(__FILE__) + '/../lib/merb-restful-links'

describe "merb-restful-links" do

  before(:all) do
  end

  describe "link_to functioning as normal" do

    it "should still generate anchor element" do
      link_to("Bestial Death", "/die/slowly").should eql("<a href=\"/die/slowly\">Bestial Death</a>")
    end

    it "should still accept traditional options" do
      link_to("Into the Abyss", "/abyss", :class => "coffee").should eql("<a class=\"coffee\" href=\"/abyss\">Into the Abyss</a>")
    end

  end

  describe "link_to functioning with method option" do

    it "should accept :delete or :put as option value" do
      lambda { link_to("Nuclear Death", "/nuclear/death", :method => :delete) }.should_not raise_error
      lambda { link_to("Nuclear Death", "/nuclear/death", :method => :put) }.should_not raise_error
    end

    it "should not accept any other values" do
      lambda { link_to("Nuclear Death", "/nuclear/death", :method => :cheese) }.should raise_error(ArgumentError)
      lambda { link_to("Nuclear Death", "/nuclear/death", :method => "destruktorr") }.should raise_error(ArgumentError)
    end

    it "should generate onclick code for anchor with :put" do
      link_to("Temple of the Underworld", "/temple/1", :method => :put).should match(/<a onclick=".+" href="\/temple\/1">Temple of the Underworld<\/a>/)
    end

    it "should generate onclick code for anchor with :delete" do
      link_to("Temple of the Underworld", "/temple/1", :method => :delete).should match(/<a onclick=".+" href="\/temple\/1">Temple of the Underworld<\/a>/)
    end

    it "should also allow other traditional options" do
      link_to("Time for Crime", "/crime", :method => :delete, :id => "crime_link").should match(/<a onclick=".+" id="crime_link" href="\/crime">Time for Crime<\/a>/)
    end

    it "should append onclick code to existing value instead of overwriting it"

    it "should generate correct onclick with PUT"

    it "should generate correct onclick with DELETE"

  end

end
