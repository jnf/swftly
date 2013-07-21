require 'spec_helper'

describe Runtime do
  it "should return the version of the runtime supplied by Google" do
    path = File.dirname(__FILE__) + '/fixtures/files/test.swf'
    swftly = Swftly.new path
    VCR.use_cassette('swiff_and_process') do
      swftly.swiff
    end

    swftly.runtime.should_not be_nil
    swftly.runtime.version.should eql("v5.2")
  end

  it "should provide a complete url to the cdn-provided version of the runtime" do
    path = File.dirname(__FILE__) + '/fixtures/files/test.swf'
    swftly = Swftly.new path
    VCR.use_cassette('swiff_and_process') do
      swftly.swiff
    end

    swftly.runtime.should_not be_nil
    swftly.runtime.url.should eql("https://www.gstatic.com/swiffy/v5.2/runtime.js") 
  end
end