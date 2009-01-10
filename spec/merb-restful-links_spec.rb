require 'rubygems'
require 'spec'
require 'merb-core'
require 'merb-more'
require File.dirname(__FILE__) + '/../lib/merb-restful-links'

include Merb::AssetsMixin

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


end
