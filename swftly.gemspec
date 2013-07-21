Gem::Specification.new do |spec|
  spec.name           = 'swftly'
  spec.version        = '0.1.1'
  spec.summary        = "swftly abstracts and automates interactions with Swiffy, Google's hosted swf converter."
  spec.description    = "The summary summarizes sumarily."
  spec.platform       = Gem::Platform::CURRENT
  spec.require_path   = '.'
  spec.authors        = ["jnf"]
  spec.email          = 'jeremy.flores@gmail.com'
  spec.files          = ["lib/swftly.rb", "lib/swftly/runtime.rb"]
  spec.homepage       = 'https://github.com/jnf/swftly'

  #for always
  spec.add_dependency "curb", "~> 0.8.4" #we'll use curl to talk to swiffy

  #for dev/testing
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end