class Swftly
  require 'curb'
  attr_accessor :swf_path, :auto_process
  attr_reader :runtime, :markup, :raw, :converted,
              :converter_response_code, :fetcher_response_code

  #init w/ a swf, through false for the second param if you don't wanna
  #immediately trigger post-conversion processing
  def initialize( swf_path = '', auto_process = true )
    @swf_path = swf_path
    @auto_process = auto_process
  end

  # post the swf to swiffy and parse/process the results
  def swiff
    return nil unless @swf_path.instance_of? String

    file = Curl::PostField.file 'swfFile', @swf_path
    converter = Curl::Easy.http_post("https://www.google.com/doubleclick/studio/swiffy/upload", file) do |curl|
      curl.multipart_form_post = true
      curl.headers["User-Agent"] = "Curl/Ruby"
      curl.follow_location = true
      curl.enable_cookies = true
    end

    @converter_response_code = converter.response_code
    @raw = converter.body_str

    process! if @auto_process
  end

  # perform and process the second fetching
  def process!
    return failed unless @converter_response_code == 200

    path = URI::extract(@raw).detect { |d| d.match /\/o\// }
    path += @raw.split('","').detect { |d| d.match '.html' }

    fetcher = Curl.get(path)

    @fetcher_response_code = fetcher.response_code
    @markup = fetcher.body_str

    @runtime = Runtime.new(@markup)
    @converted = Converted.new(@markup)
  end

  protected

  def failed
    raise "File conversion failed with response code #{converted_response_code}."
  end
end

require 'swftly/runtime'
require 'swftly/converted'