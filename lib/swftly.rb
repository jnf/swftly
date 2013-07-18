class Swftly
  attr_reader :swf
  
  #init w/ a swf
  def initialize( swf, options = {} )
    @swf = swf
    @options = {
      form: {
        upload_field_name:  'swfFile',
        tos_field_name:     'gwt-uid-13',
        post_path:          'https://www.google.com/doubleclick/studio/swiffy/upload'
      }
    }.merge options
  end

  # post the swf to swiffy and parse/process the results
  def swiff

  end

  protected

  # use curb to send the swf to swiffy's web service.
  def post

  end

  # we should prolly make sure we've got workable results.
  def verify

  end

  # do whatevs we need to do to persist the verified results
  def process

  end
end