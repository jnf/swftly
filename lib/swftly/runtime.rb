class Runtime
  attr_reader :markup

  def initialize(markup)
    @markup = markup
    @urls = URI::extract @markup
  end

  def version
    url.split('/')[-2] #we'll strip out runtime version here
  end

  def url
    @urls.detect { |d| d.match /runtime\.js/} #typically the first js file in the set.
  end

end