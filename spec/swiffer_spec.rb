require 'spec_helper'

describe Swftly do
  it "shouldn't require any variables to successfully instantiate" do
    swftly = Swftly.new
    swftly.should_not be_nil
  end

  it "should be able to reassign swf_path on demand" do
    swftly = Swftly.new
    swftly.swf_path.should be_empty
    swftly.swf_path = "test/path"
    swftly.swf_path.should eql('test/path')
  end

  it "should submit the specified swf to Swiffy" do
    path = File.dirname(__FILE__) + '/fixtures/files/test.swf'
    swftly = Swftly.new path
    VCR.use_cassette('swiff_and_process') do
      swftly.swiff
    end

    #conversion (cassette or real) should work
    swftly.converter_response_code.should eql(200)
    swftly.raw.should_not be_empty

    #and since auto_process is true, we should have populated runtime and converted
    swftly.fetcher_response_code.should eql(200)
    swftly.runtime.should_not be_nil
    swftly.converted.should_not be_nil

  end

  it "should wait on post-processing if auto_process is false" do
    path = File.dirname(__FILE__) + '/fixtures/files/test.swf'
    swftly = Swftly.new path, false #no autoprocessing
    VCR.use_cassette('swiff_no_process') do
      swftly.swiff
    end

    #conversion (cassette or real) should work
    swftly.converter_response_code.should eql(200)
    swftly.raw.should_not be_empty

    #but runtime and converted should not exist yet
    swftly.runtime.should be_nil
    swftly.converted.should be_nil

    VCR.use_cassette('swiff_process!') do
      swftly.process! #trigger post-processing
    end

    #now we should have all the other stuff
    swftly.fetcher_response_code.should eql(200)
    swftly.runtime.should_not be_nil
    swftly.converted.should_not be_nil
  end
end
