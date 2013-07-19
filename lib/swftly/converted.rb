class Converted
  MATCHER = /swiffyobject\s*?=\s*?(\{.*\})/
  attr_reader :markup, :json_blob

  def initialize(markup)
    @markup = markup
  end

  def json_definition
    @json_blob ||= @markup.match(MATCHER).to_s
    @json_blob
  end
end