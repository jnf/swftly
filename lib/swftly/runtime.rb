# f = '/Users/jeremy/test.swf'; x = Swftly.new f; x.swiff
class Runtime
  attr_accessor :result_page

  def initialize(result_page)
    @result_page = result_page
    @urls = URI::extract @result_page
  end

  def version
    url.split('/')[-2] #we'll strip out runtime version here
  end

  def url
    @urls.detect { |d| d.match /runtime\.js/} #typically the first js file in the set.
  end

end