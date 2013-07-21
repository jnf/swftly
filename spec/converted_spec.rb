require 'spec_helper'

describe Converted do
  it "should isolate the json necessary to execute the converted interactions" do
    basepath = File.dirname(__FILE__)
    path = "#{basepath}/fixtures/files/test.swf"
    data = File.read("#{basepath}/fixtures/files/json_definition_test")

    swftly = Swftly.new path
    VCR.use_cassette('swiff_and_process') do
      swftly.swiff
    end

    swftly.converted.should_not be_nil
    swftly.converted.json_definition.should eql(data)
  end
end