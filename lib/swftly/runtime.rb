class Runtime
  attr_accessor :result_page

  def initialize(result_page)
    @result_page = result_page
  end

  def version
    raise "No result page set" unless have_page?

    #we'll strip out runtime version here
  end

  def url
    raise "No result page set" unless have_page?

    #get the full url to the google-hosted runtime to use with embedding
  end

  private

  def have_page?
    @result_page.present? && @result_page.instance_of?(String)
  end
end